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


@app.route("/")
def main():
    if 'user' in session:
        return redirect(url_for('showDashboard'))
    return render_template('index.html')
    
@app.route('/login', methods= ['GET'])
def showLogIn():
    return render_template('login.html')


def authenticateUser(email, password):
    cursor = mysql.connection.cursor()
    cursor.execute('''SELECT user_username, user_password FROM tbl_user WHERE user_username=\'{}\' AND user_password=\'{}\''''.format(email, password))
    rv = cursor.fetchall()
    if len(rv) > 0:
        return True
    else:
        return False

def get_user_id(email):
    cur = mysql.connection.cursor()
    cur.execute('''SELECT user_id FROM tbl_user WHERE user_username=\'{}\''''.format(email))
    return cur.fetchone()

@app.route('/login', methods = ['POST'])
def login():

    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
    
    #Validate values
    if _email and _password:
        _hashed_password = _password

        # If data is returned something went wrong, if data was not returned then the user was authenticated
        if authenticateUser(_email, _hashed_password):

            data = get_user_id(_email)

            #Set session variable to userid
            session['user'] = data[0]

            return redirect(url_for('showDashboard'))
        else:
            return json.dumps({'error':'Not authenticated'}) #str(data[0])})
    else:
        return json.dumps({'html':'<span>Please enter the required fields.</span>'})

@app.route('/getSession')
def getsession():
    if 'user' in session:
        return session['user']
    return 'Not logged in!'
   
@app.route('/logout')
def logout():
   # remove the username from the session if it is there
   session.pop('username', None)
   return redirect(url_for('index'))

@app.route('/signup', methods=['GET'])
def showSignUp():
    return render_template('signup.html')

@app.route('/signup', methods=['POST'])
def signUp():
    
    #Read vlaues from UI
    _fname = request.form['inputFName']
    _lname = request.form['inputLName']
    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
    
    #Validate values
    if _fname and _lname and _email and _password:

        conn = mysql.connection
        cursor = conn.cursor()
        cursor.callproc('sp_createUser',(_fname, _lname, _email, _password))
        data = cursor.fetchall()

        # If data is returned something went wrong, if data was not returned then the user was created
        if len(data) is 0:
            mysql.connection.commit()
            return render_template('login.html')
        else:
            return json.dumps({'error':str(data[0])})
    else:
        return json.dumps({'html':'<span>Please enter the required fields.</span>'})
        
        
@app.route('/showDashboard', methods=["GET"])
def showDashboard():
    return render_template('dashboard/dashboard.html')
    
@app.route('/showSimExam')
def showTest():
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.callproc('sp_generateSimExam')
    data = cursor.fetchall()
    
    if len(data) > 0:
        
        #The print statement below allows you to select individual items from query
        #data[x] where x is the row itself
        #data[x][y] where y is the column
        
        paragraph = []
        question = {}
        option = {}

        #The first row, second column is the paragraph add that to the paragraph list
        paragraph.append(data[0][1])

        #Loop through each row of data returned from SQL query
        for row in range(len(data)):

            #Each row is an option so add that to the option dictionary
            option[str(data[row][2])+str(data[row][6])] = data[row][7]

            #Every 4th row will be a new question, add that to the question dictionary
            if row % 4 == 0:
                question[data[row][2]] = data[row][3]

    return render_template('test.html', paragraph=paragraph, question=question, option=option)


@app.route('/submitSimExam', methods=['POST'])
def submitSimExam():

    #Set variables for insertions into the tables
    userid = str(session['user'])
    testtype = 'SIM'
    testskilllevel = None
    testarea = None

    #Create a new result entry
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.callproc('sp_newResult', (userid, testtype, testskilllevel, testarea))
    data = cursor.fetchall()
    mysql.connection.commit()

    #Create result lines for each selection
    for selection in request.form:
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.callproc('sp_newResultLine', (request.form.get(selection), str(selection)))
        data = cursor.fetchall()
        mysql.connection.commit()

    return json.dumps({'Code':'Success!'})

@app.route('/showResults')
def showResults():

    userid = str(session['user'])
    dates = {}
    scores = {}
    results = {}

    conn = mysql.connection
    cursor = conn.cursor()
    cursor.callproc('sp_getResults', (userid,))
    data = cursor.fetchall()

    for row in range(len(data)):
        dates[row] = data[row][0]
        scores[row] = "{:.2%}".format(data[row][2])

    return render_template('results.html', dates=dates, scores=scores)

@app.route('/practice', methods=['GET'])
def showPracticeExam():
    pass

@app.route('/practice', methods=['POST'])
def submitPracticeExam():
    pass


if __name__ == "__main__":
    app.run(debug=True,host=os.getenv('IP', '0.0.0.0'),port=int(os.getenv('PORT', 8080)))