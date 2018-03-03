##Guides used:
## FLASK SESSIONS:          https://www.tutorialspoint.com/flask/flask_sessions.htm
## PYTHON/FLASK/MYSQL STACK TUT:  https://code.tutsplus.com/tutorials/creating-a-web-app-from-scratch-using-python-flask-and-mysql--cms-22972


import os
from flask import Flask, render_template, json, request, session, redirect, url_for
from flask.ext.mysql import MySQL
from werkzeug import generate_password_hash, check_password_hash



app = Flask(__name__)
app.secret_key = os.urandom(24)
mysql = Flask(__name__)


#MySQL connection configuration
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'mblaulou'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'apostrophy'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)


@app.route("/")
def main():
    return render_template('index.html')

      
@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')
    
@app.route('/showLogIn')
def showLogIn():
    return render_template('login.html')
    
@app.route('/logIn', methods = ['GET', 'POST'])
def login():

    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
    
    #Validate values
    if _email and _password:
        
        conn = mysql.connect()
        cursor = conn.cursor()
        _hashed_password = _password
        cursor.callproc('sp_authenticateUser',(_email,_hashed_password))
        data = cursor.fetchall()
        
        if len(data) is 0:
            conn.commit()
            session['user'] = _email
            return json.dumps({'html':'<span>Logged in!</span>'})
        else:
            return json.dumps({'error':str(data[0])})
    else:
        return json.dumps({'html':'<span>Please enter the required fields.</span>'})
    
    if _email == session['user']:
        return redirect(url_for('showDashboard'))
	
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
    
@app.route('/signUp', methods=['POST'])
def signUp():
    
    #Read vlaues from UI
    _fname = request.form['inputFName']
    _lname = request.form['inputLName']
    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
    
    #Validate values
    if _fname and _lname and _email and _password:
        
        conn = mysql.connect()
        cursor = conn.cursor()
        _hashed_password = generate_password_hash(_password)
        cursor.callproc('sp_createUser',(_fname,_lname,_email,_hashed_password))
        data = cursor.fetchall()
        
        if len(data) is 0:
            conn.commit()
            return redirect('showDashboard')
            return json.dumps({'html':'<span>All fields are a go!</span>'})
        else:
            return json.dumps({'error':str(data[0])})
    else:
        return json.dumps({'html':'<span>Please enter the required fields.</span>'})
        
        
@app.route('/showDashboard')
def showDashboard():
    return render_template('dashboard/dashboard.html')

    
if __name__ == "__main__":
    app.run(debug=True,host=os.getenv('IP', '0.0.0.0'),port=int(os.getenv('PORT', 8080)))