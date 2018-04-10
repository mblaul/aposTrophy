from flask import session, redirect, url_for, request, render_template, json
from sqlalchemy import func

from FlaskApp.core import app
from FlaskApp.core.models import db, Option, ResultLine, Result, Paragraph, Question
from FlaskApp.core.routes.main import verifyUserSession, userLoggedIn


def getPracTestAvg(area, skill):
    uid = session['user']

    avgq = db.session.query(func.avg(Option.is_correct)) \
        .join(Option.result_lines).filter(ResultLine.option_id == Option.option_id,
                                          ResultLine.question_id == Option.question_id) \
        .join(Result, Result.result_id == ResultLine.result_id) \
        .filter(Result.user_id == uid,
                Result.test_type == 'PRAC',
                Result.test_area == area,
                Result.test_skill_lvl == skill).group_by(ResultLine.result_id).limit(5).all()
    if len(avgq):
        return sum(x[0] for x in avgq)/len(avgq)
    else:
        return 0


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
        db.session.commit()
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

            # Add values to question dictionary { pid: <questions> }
            # Each question is added to a list under the paragraph's ID
            if p.paragraph_id in questions.keys():
                questions[p.paragraph_id][q.question_id] = q
            else:
                questions[p.paragraph_id] = {q.question_id: q}

            # Add values to options dictionary { qid, [<option1>, <option2> ... ] }
            # The options dict will be by question ID, but append each option to a list held in each key
            if q.question_id in options.keys():
                options[q.question_id].append(o)
            else:
                options[q.question_id] = [o]

        return render_template('test.html', paragraphs=paragraphs, questions=questions, options=options,
                               submitAction=submitAction, isPractice=isPractice)

    return redirect(url_for('showUser'))


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
            return redirect(url_for('showUser'))


@app.route('/simulation', methods=['POST'])
def submitSimExam():
    if not userLoggedIn():
        return redirect(url_for('main'))
    else:
        submitTest('SIM', None, "All", request.form)
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

        data = db.session.query(Result.result_date, Result.result_id, Result.test_type, Result.test_area, Result.test_skill_lvl,
                                func.avg(Option.is_correct))\
            .join(Option.result_lines).filter(ResultLine.option_id == Option.option_id, ResultLine.question_id == Option.question_id)\
            .join(Result, Result.result_id == ResultLine.result_id)\
            .filter(Result.user_id == userid).group_by(ResultLine.result_id).all()
        return render_template('results.html', results=data)


@app.route('/review', methods=['POST'])
def showReview():
    resultid = request.form['resultId']

    verify = verifyUserSession('showResults')
    if verify:
        return verify
    else:
        userdata = ResultLine.query.filter(ResultLine.result_id == resultid).order_by(ResultLine.question_id).all()
        quesdata = db.session.query(Paragraph, Question, Option).join(Paragraph.questions)\
            .join(Question.options).order_by(Question.question_id).all()

        paragraphs = {}
        questions = {}
        options = {}

        for row in userdata:
            for quesrow in quesdata:

                p = quesrow[0]
                q = quesrow[1]
                o = quesrow[2]

                # We only care about our questions
                if row.question_id == q.question_id:

                    # Add values to question dictionary { pid: <paragraph> }
                    paragraphs[p.paragraph_id] = p

                    # Add values to question dictionary { pid: { qid1: question1, qid2: ...} }
                    # Each question is added to a list under the paragraph's ID
                    if p.paragraph_id in questions.keys():
                        questions[p.paragraph_id][q.question_id] = q
                    else:
                        questions[p.paragraph_id] = {q.question_id: q}

                    # Add values to options dictionary { qid, [<option1>, <option2> ... ] }
                    # The options dict will be by question ID, but append each option to a list held in each key
                    if q.question_id in options.keys():
                        options[q.question_id].append(o)
                    else:
                        options[q.question_id] = [o]

        return render_template('review.html', paragraphs=paragraphs, questions=questions, options=options,
                               userdata=userdata, submitAction=None, isPractice=None)
