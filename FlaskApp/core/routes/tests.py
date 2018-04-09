from flask import session, redirect, url_for, request, render_template

from FlaskApp.core import app
from FlaskApp.core.routes.main import verifyUserSession, userLoggedIn


def getPracTestAvg(area, skill):
    uid = session['user']

    # TODO: CONVERTME
    # cursor = mysql.connection.cursor()
    #
    # cursor.execute( '''     SELECT AVG(options.is_correct)
    #                         FROM options JOIN result_line
    #                             ON result_line.option_id = options.option_id
    #                             AND options.question_id = result_line.question_id
    #                         JOIN result
    #                             ON result_line.result_id = result.result_id
    #                         WHERE RESULT.TEST_TYPE='PRAC'
    #                         AND RESULT.TEST_AREA='{}'
    #                         AND RESULT.TEST_SKILL_LVL={}
    #                         AND result.user_id={}
    #                         GROUP BY result.USER_ID
    #                         LIMIT 5;
    #                 '''.format(area, skill, uid))
    #
    # ret = cursor.fetchone()
    # if ret:
    #     return ret[0]
    # else:
    #     return None
    return None


def getPracticeExam(area, skill=None):
    # TODO: CONVERTME
    # cur = mysql.connection.cursor()
    # limiter = 'WHERE AREA=\'{}\''.format(area)
    # if skill is not None:
    #     limiter += ' AND SKILL_LVL={}'.format(skill)
    #
    # cur.execute('''SELECT
    #         PARAGRAPH.PARAGRAPH_ID,
    #         PARAGRAPH.PARAGRAPH_TEXT,
    #         QUESTION.QUESTION_ID,
    #         QUESTION.QUESTION_TEXT,
    #         QUESTION.SKILL_LVL,
    #         QUESTION.AREA,
    #         OPTIONS.OPTION_ID,
    #         OPTIONS.OPTION_TEXT,
    #         OPTIONS.IS_CORRECT
    #     FROM apostrophy.PARAGRAPH
    #     RIGHT JOIN apostrophy.QUESTION ON QUESTION.PARAGRAPH_ID = PARAGRAPH.PARAGRAPH_ID
    #     RIGHT JOIN apostrophy.OPTIONS ON OPTIONS.QUESTION_ID = QUESTION.QUESTION_ID
    #     {} ORDER BY apostrophy.QUESTION.QUESTION_ID ASC;'''.format(limiter))
    # return cur.fetchall
    return None


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
    userid = str(session['user'])

    # Create a new result entry
    # TODO: CONVERTME!
    # conn = mysql.connection
    # cursor = conn.cursor()
    # cursor.callproc('sp_newResult', (userid, type, skill, area))
    # # data = cursor.fetchall()
    # mysql.connection.commit()
    #
    # # Create result lines for each selection
    # for selection in form:
    #     conn = mysql.connection
    #     cursor = conn.cursor()
    #     cursor.callproc('sp_newResultLine', (form.get(selection), str(selection)))
    #     # data = cursor.fetchall()
    #     mysql.connection.commit()
    #
    # return json.dumps({'Code':'Success!'})
    return None




def showTest(isPractice, submitAction, data):

    if len(data) > 0:

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

            # Add values to options dictionary { uniqueid, [qid, optid, opttext] }
            options[row] = [data[row][2], data[row][6], data[row][7]]

        return render_template('test.html', paragraphs=paragraphs, questions=questions, options=options,
                               submitAction=submitAction, isPractice=isPractice)

    return redirect(url_for('showDashboard'))



@app.route('/simulation', methods=['GET'])
def showSimExam():
    verify = verifyUserSession('showSimExam')
    if verify:
        return verify
    else:
        # TODO: CONVERTME
        # conn = mysql.connection
        # cursor = conn.cursor()
        # cursor.callproc('sp_generateSimExam')
        # data = cursor.fetchall()
        data = []
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
    formt = '/practice/{}/{}'.format(area, skill)

    verify = verifyUserSession(formt)
    if verify:
        return verify
    else:
        data = getPracticeExam(area, skill)
        if len(data) > 0:
            return showTest(True, formt, data)

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

    verify = verifyUserSession('/results')
    if verify:
        return verify
    else:

        data = []
        userdata = []

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
