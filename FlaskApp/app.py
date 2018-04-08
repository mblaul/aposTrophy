##Guides used:
## FLASK SESSIONS:          https://www.tutorialspoint.com/flask/flask_sessions.htm
## PYTHON/FLASK/MYSQL STACK TUT:  https://code.tutsplus.com/tutorials/creating-a-web-app-from-scratch-using-python-flask-and-mysql--cms-22972


import os
from flask import Flask, render_template, json, jsonify, request, session, redirect, url_for
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash
from core import config


app = Flask(__name__)
app.secret_key = os.urandom(24)


#MySQL connection configuration
app.config.from_object(config)
mysql = MySQL(app)


def userLoggedIn():
    return 'user' in session


# If the user is not logged in, redirect to login page
def verifyUserSession(redir_method=None):
    if not userLoggedIn():
        return redirect(url_for('login', redir=redir_method))
    else:
        return None


@app.route("/")
def main():

    print(getPracTestAvg('Grammar', 1))  # TODO removeme

    loggedIn = userLoggedIn()
    return render_template('index.html', loggedIn=loggedIn)


@app.route('/login', methods= ['GET'])
def showLogIn():
    redir_method = request.args.get('redir', default=None)
    return render_template('login.html', redir=redir_method)


def authenticateUser(email, password):
    cursor = mysql.connection.cursor()
    cursor.execute('''SELECT user_username, user_password FROM tbl_user WHERE user_username=\'{}\''''.format(email))
    rv = cursor.fetchall()
    if len(rv) > 0:
        return check_password_hash(rv[0][1], password)
    else:
        return False


def get_user_id(email):
    cur = mysql.connection.cursor()
    cur.execute('''SELECT user_id FROM tbl_user WHERE user_username=\'{}\''''.format(email))

    ID = cur.fetchall()

    if len(ID) > 0:
        return ID[0]
    else:
        return None


@app.route('/login', methods=['POST'])
def login():

    redir_method = request.args.get('redir', default=None)

    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
    
    # Validate values
    if _email and _password:

        # If data is returned something went wrong, if data was not returned then the user was authenticated
        if authenticateUser(_email, _password):

            # Set session variable to userid
            session['user'] = get_user_id(_email)

            if redir_method:
                return redirect(url_for(redir_method))
            else:
                return redirect(url_for('showDashboard'))  # just go to the dashboard by default
        else:
            return json.dumps({'error':'Not authenticated'}) #str(data[0])})
    else:
        return json.dumps({'html':'<span>Please enter the required fields.</span>'})

   
@app.route('/logout')
def logout():
   # remove the username from the session if it is there
   session.pop('user', None)
   return redirect(url_for('main'))


@app.route('/signup', methods=['GET'])
def showSignUp():
    if userLoggedIn():
        return redirect(url_for('logout'))
    return render_template('signup.html')


@app.route('/signup', methods=['POST'])
def signUp():
    
    # Read vlaues from UI
    _fname = request.form['inputFName']
    _lname = request.form['inputLName']
    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
    
    # Validate values
    if _fname and _lname and _email and _password:

        _hashed_pass = generate_password_hash(_password)

        conn = mysql.connection
        cursor = conn.cursor()
        cursor.callproc('sp_createUser',(_fname, _lname, _email, _hashed_pass))
        data = cursor.fetchall()

        # If data is returned something went wrong, if data was not returned then the user was created
        if len(data) is 0:
            mysql.connection.commit()
            return render_template('login.html')
        else:
            return json.dumps({'error':str(data[0])})
    else:
        return json.dumps({'html':'<span>Please enter the required fields.</span>'})


def getPracTestAvg(area, skill):

    uid = get_user_id('matt@blaul2.com') # session['user'])

    cursor = mysql.connection.cursor()

    cursor.execute( '''     SELECT result.TEST_AREA, result.TEST_SKILL_LVL, AVG(options.is_correct)     
                            FROM options JOIN result_line 
                                ON result_line.option_id = options.option_id 
                                AND options.question_id = result_line.question_id 
                            JOIN result 
                                ON result_line.result_id = result.result_id
                            WHERE RESULT.TEST_TYPE='PRAC' AND RESULT.TEST_AREA='{}' AND RESULT.TEST_SKILL_LVL={} AND result.user_id={} GROUP BY result.RESULT_ID;
                    '''.format(area, skill, uid))

    ret = cursor.fetchall()
    return ret



@app.route('/dashboard', methods=["GET"])
def showDashboard():
    verify = verifyUserSession('showDashboard')
    if verify:
        return verify
    else:
        # Let's suggest some tests to take

        cursor = mysql.connection.cursor()

        # The lowest skill not completed for each area
        lowestArea = {'Grammar': 1, 'Comprehension': 1}

        for area in lowestArea.keys():

            cursor.execute('''
                    SELECT TEST_SKILL_LVL
                    FROM result
                    WHERE TEST_TYPE='PRAC' AND TEST_AREA='{}'
                    ORDER BY TEST_SKILL_LVL ASC
                    '''.format(area))

            # Look at the score for each area's skill level. If the avg score is below a certain threshold, recommend it
            data = cursor.fetchall()
            datalen = len(data)
            if datalen > 0:
                # They've at least practiced something, suggest the next test to take
                ## NOTE from mb: for other loops through cursors I used for row in range(len(data))
                ## that may help here
                for skill in range(1, 4):

                    if skill in data:  # TODO: may be problematic, may have to loop through each row manually
                        lowestArea[area] = skill + 1
                    else:
                        # They didn't take this one, recommend it and get out of here
                        lowestArea[area] = skill
                        break
            else:
                # They never practiced! Nothing to do here, just suggest the first skill
                pass

        print("Suggesting to take Grammar")

        return render_template('dashboard/dashboard.html')


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


def submitTest(type, skill, area, form):
    # Set variables for insertions into the tables
    userid = str(session['user'])

    # Create a new result entry
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.callproc('sp_newResult', (userid, type, skill, area))
    # data = cursor.fetchall()
    mysql.connection.commit()

    # Create result lines for each selection
    for selection in form:
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.callproc('sp_newResultLine', (form.get(selection), str(selection)))
        # data = cursor.fetchall()
        mysql.connection.commit()

    return json.dumps({'Code':'Success!'})


@app.route('/simulation', methods=['GET'])
def showSimExam():
    verify = verifyUserSession('showSimExam')
    if verify:
        return verify
    else:
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.callproc('sp_generateSimExam')
        data = cursor.fetchall()

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


@app.route('/results', methods=['GET'])
def showResults():
    verify = verifyUserSession('showResults')
    if verify:
        return verify
    else:
        userid = str(session['user'])
        dates = {}
        resids = {}
        scores = {}
        types = {}
        areas = {}

        conn = mysql.connection
        cursor = conn.cursor()
        cursor.callproc('sp_getResults', (userid,))
        data = cursor.fetchall()

        for row in range(len(data)):
            dates[row] = data[row][0]
            resids[row] = data[row][1]
            types[row] = data[row][2]
            areas[row] = data[row][3]
            scores[row] = "{:.2%}".format(data[row][4])

        return render_template('results.html', dates=dates, scores=scores, types=types, areas=areas, resids=resids)


@app.route('/review', methods=['POST'])
def showReview():
    resultid = request.form['resultId']

    verify = verifyUserSession('/results')
    if verify:
        return verify
    else:

        data = []

        cur = mysql.connection.cursor()
        cur.execute(
            '''
            SELECT * FROM result_line
            WHERE result_id={}
            ORDER by question_id ASC
            '''.format(resultid)
        )
        userdata = list(cur.fetchall())

        cur.execute('''SELECT  PARAGRAPH.PARAGRAPH_ID, 
                    PARAGRAPH.PARAGRAPH_TEXT, 
                    QUESTION.QUESTION_ID, 
                    QUESTION.QUESTION_TEXT, 
                    QUESTION.SKILL_LVL, 
                    QUESTION.AREA, 
                    OPTIONS.OPTION_ID, 
                    OPTIONS.OPTION_TEXT, 
                    OPTIONS.IS_CORRECT
                    
                    FROM    apostrophy.PARAGRAPH
                    RIGHT JOIN apostrophy.QUESTION ON QUESTION.PARAGRAPH_ID = PARAGRAPH.PARAGRAPH_ID
                    RIGHT JOIN apostrophy.OPTIONS ON OPTIONS.QUESTION_ID = QUESTION.QUESTION_ID
                    ORDER BY apostrophy.QUESTION.QUESTION_ID ASC;
                    '''
        )
        quesdata = list(cur.fetchall())

        for testrow in range(len(quesdata)):
            for userrow in range(len(userdata)):
                if userdata[userrow][3] == quesdata[testrow][2]:
                    data.append(quesdata[testrow])

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


        return render_template('review.html', paragraphs=paragraphs, questions=questions, options=options, userdata=userdata, submitAction=None, isPractice=None)


def getPracticeExam(area, skill=None):
    cur = mysql.connection.cursor()
    limiter = 'WHERE AREA=\'{}\''.format(area)
    if skill is not None:
        limiter += ' AND SKILL_LVL={}'.format(skill)

    cur.execute('''SELECT 
            PARAGRAPH.PARAGRAPH_ID, 
            PARAGRAPH.PARAGRAPH_TEXT, 
            QUESTION.QUESTION_ID, 
            QUESTION.QUESTION_TEXT, 
            QUESTION.SKILL_LVL, 
            QUESTION.AREA, 
            OPTIONS.OPTION_ID, 
            OPTIONS.OPTION_TEXT, 
            OPTIONS.IS_CORRECT
        FROM apostrophy.PARAGRAPH
        RIGHT JOIN apostrophy.QUESTION ON QUESTION.PARAGRAPH_ID = PARAGRAPH.PARAGRAPH_ID
        RIGHT JOIN apostrophy.OPTIONS ON OPTIONS.QUESTION_ID = QUESTION.QUESTION_ID
        {} ORDER BY apostrophy.QUESTION.QUESTION_ID ASC;'''.format(limiter))
    return cur.fetchall()


@app.route('/practice', methods=['GET'])
def showPracticePage():
    verify = verifyUserSession('showPracticePage')
    if verify:
        return verify
    else:
        return render_template('practice.html')


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


if __name__ == "__main__":
    app.run(debug=True,host=os.getenv('IP', '0.0.0.0'),port=int(os.getenv('PORT', 8080)))