from flask import session, redirect, url_for, request, render_template, json
from sqlalchemy import func

from FlaskApp.core import app
from FlaskApp.core.models import db, Option, ResultLine, Result, Paragraph, Question
from FlaskApp.core.routes.main import verifyUserSession, userLoggedIn


def getPracTestAvg(area, skill):
    uid = session['user']

    last5 = Option.query.join(Option.result_lines)\
        .filter(Option.option_id == ResultLine.option_id, Option.question_id == ResultLine.question_id)\
        .join(Result).filter(ResultLine.result_id == Result.result_id)\
        .filter(Result.test_type == 'PRAC',
                Result.test_area == area,
                Result.test_skill_lvl == skill,
                Result.user_id == uid)\
        .limit(5)

    avg = db.session.query(func.avg(last5.subquery().columns.is_correct)).scalar()

    print("Avg ", avg)
    return avg


def getPracticeExam(area, skill=None):
    query = db.session.query(Paragraph, Question, Option).join(Paragraph.questions).join(Question.options)\
        .filter(Question.area == area)
    if skill:
        query = query.filter(Question.skill_lvl == skill)

    data = query.order_by(Question.question_id).all()
    return data


def suggestTests():
    # The lowest skill not completed for each area
    lowestArea = {'Grammar': 4, 'Comprehension': 4}
    suggestions = {}

    for area in lowestArea.keys():
        for skill in range(1, 4):
            avg = getPracTestAvg(area, skill)
            if avg is None or avg < 0.75:
                lowestArea[area] = skill  # Recommend this skill
                break

    if sum(lowestArea.values()) == 8:
        # Suggest a simulation exam
        suggestions['Simulate'] = 1
    else:
        for area in lowestArea.keys():
            if lowestArea[area] < 4:
                # Suggest this difficulty
                suggestions[area] = lowestArea[area]

    return suggestions



def submitTest(type, skill, area, form):
    # Set variables for insertions into the tables
    userid = session['user']

    try:
        # Create a new result entry
        res = Result(user_id=userid, test_type=type, test_skill_lvl=skill, test_area=area)
        db.session.add(res)
        # Create a new result line for every option
        for selection in form:
            res_line = ResultLine(result_id=res.result_id, option_id=form.get(selection), question_id=str(selection))
            db.session.add(res_line)
        db.session.commit()
        return True
    except:
        return json.dumps({'error': 'Cannot submit the test!'})


def showTest(isPractice, submitAction, data):

    if len(data) > 0:

        paragraphs = {}
        questions = {}
        options = {}

        # Loop through each row of data returned from SQL query
        for row in data:

            p = row[0]  # Paragraph
            q = row[1]  # Question for this paragraph
            o = row[2]  # Option for this paragraph's question

            # Add values to question dictionary { pid: <paragraph> }
            paragraphs[p.paragraph_id] = p

            # Add values to question dictionary { qid: <question> }
            questions[q.question_id] = q

            # Add values to options dictionary { qid, [<option1>, <option2> ... ] }
            # The options dict will be by question ID, but append each option to a list held in each key
            if q.question_id in options.keys():
                options[q.question_id].append(o)
            else:
                options[q.question_id] = [o]

        return render_template('test.html', paragraphs=paragraphs, questions=questions, options=options,
                               submitAction=submitAction, isPractice=isPractice)

    return redirect(url_for('showDashboard'))


@app.route('/simulation', methods=['GET'])
def showSimExam():
    verify = verifyUserSession('showSimExam')
    if verify:
        return verify
    else:
        data = db.session.query(Paragraph, Question, Option).join(Paragraph.questions).join(Question.options).order_by(
            Question.question_id).all()
        if len(data) > 0:
            return showTest(False, '/simulation', data)
        else:
            return redirect(url_for('showDashboard'))


@app.route('/simulation', methods=['POST'])
def submitSimExam():
    if not userLoggedIn():
        return redirect(url_for('main'))
    else:
        submitTest('SIM', None, "ALL", request.form)
        return redirect(url_for('showResults'))


@app.route('/practice/<area>/<int:skill>', methods=['GET'])
def showPracticeExam(area, skill=None):
    verify = verifyUserSession('showPracticePage')
    if verify:
        return verify
    else:
        data = getPracticeExam(area, skill)
        if len(data) > 0:
            return showTest(True, '/practice/{}/{}'.format(area, skill), data)

        return redirect(url_for('showPracticePage'))


@app.route('/practice/<area>/<int:skill>', methods=['POST'])
def submitPracticeExam(area, skill):
    if not userLoggedIn():
        return redirect(url_for('main'))
    else:
        submitTest('PRAC', skill, area, request.form)
        return redirect(url_for('showResults'))


@app.route('/results', methods=['GET'])
def showResults():
    verify = verifyUserSession('showResults')
    if verify:
        return verify
    else:
        userid = session['user']
        dates = {}
        resids = {}
        scores = {}
        types = {}
        areas = {}

        allTests = Option.query.join(Option.result_lines).join(Result)\
            .filter(Result.user_id == userid).group_by(ResultLine.result_id)

        averages = db.session.query(func.avg(allTests.subquery().columns.is_correct)).all()

#         '''	SELECT
# 	   result.result_date,
#        result_line.result_id,
#        result.test_type,
#        result.test_area,
#        AVG(options.is_correct)
#
# FROM   options
#        JOIN result_line
#          ON result_line.option_id = options.option_id
#             AND options.question_id = result_line.question_id
#        JOIN result
#          ON result_line.result_id = result.result_id
#
#        WHERE user_id = uid
# GROUP  BY result_line.result_id;'''

        # TODO: CONVERTME
        # conn = mysql.connection
        # cursor = conn.cursor()
        # cursor.callproc('sp_getResults', (userid,))
        # data = cursor.fetchall()
        #
        # for row in range(len(data)):
        #     dates[row] = data[row][0]
        #     resids[row] = data[row][1]
        #     types[row] = data[row][2]
        #     areas[row] = data[row][3]
        #     scores[row] = "{:.2%}".format(data[row][4])

        return render_template('results.html', dates=dates, scores=scores, types=types, areas=areas, resids=resids)


@app.route('/review', methods=['POST'])
def showReview():
    resultid = request.form['resultId']

    verify = verifyUserSession('showResults')
    if verify:
        return verify
    else:

        data = []
        userdata = []


        userdata = ResultLine.query.filter(ResultLine.result_id == resultid).order_by(ResultLine.question_id).all()
        quesdata = Paragraph.query.join(Paragraph.questions).join(Question.options).order_by(Question.question_id).all()


        for row in userdata:
            for quesrow in quesdata:
                if row.question_id == quesrow.question_id:
                    data.append(quesrow)
        # TODO: CONVERTME
        # cur = mysql.connection.cursor()
        # cur.execute(
        #     '''
        #     SELECT * FROM result_line
        #     WHERE result_id={}
        #     ORDER by question_id ASC
        #     '''.format(resultid)
        # )
        # userdata = list(cur.fetchall())
        #
        # cur.execute('''SELECT  PARAGRAPH.PARAGRAPH_ID,
        #             PARAGRAPH.PARAGRAPH_TEXT,
        #             QUESTION.QUESTION_ID,
        #             QUESTION.QUESTION_TEXT,
        #             QUESTION.SKILL_LVL,
        #             QUESTION.AREA,
        #             OPTIONS.OPTION_ID,
        #             OPTIONS.OPTION_TEXT,
        #             OPTIONS.IS_CORRECT
        #
        #             FROM    apostrophy.PARAGRAPH
        #             RIGHT JOIN apostrophy.QUESTION ON QUESTION.PARAGRAPH_ID = PARAGRAPH.PARAGRAPH_ID
        #             RIGHT JOIN apostrophy.OPTIONS ON OPTIONS.QUESTION_ID = QUESTION.QUESTION_ID
        #             ORDER BY apostrophy.QUESTION.QUESTION_ID ASC;
        #             '''
        #             )
        # quesdata = list(cur.fetchall())
        #
        # for testrow in range(len(quesdata)):
        #     for userrow in range(len(userdata)):
        #         if userdata[userrow][3] == quesdata[testrow][2]:
        #             data.append(quesdata[testrow])

        paragraphs = {}
        questions = {}
        options = {}

        # data[x] where x is the row itself
        # data[x][y] where y is the column

        # Loop through each row of data returned from SQL query
        for row in range(len(data)):
            # Add values to question dictionary { pid, ptext }
            paragraphs[data[row][0]] = data[row][1]

            # Add values to question dictionary { qid, [pid, qtext] }
            questions[data[row][2]] = [data[row][0], data[row][3]]

            # Add values to options dictionary { uniqueid, [qid, optid, opttext, is_correct] }
            options[row] = [data[row][2], data[row][6], data[row][7], data[row][8]]

        return render_template('review.html', paragraphs=paragraphs, questions=questions, options=options,
                               userdata=userdata, submitAction=None, isPractice=None)
