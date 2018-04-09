from flask import request, render_template, redirect, url_for, session, json
from werkzeug.security import check_password_hash, generate_password_hash

from FlaskApp.app import app
from FlaskApp.core.models import User, db


def authenticateUser(email, password):
    found = User.query.filter_by(user_username=email).first()
    if found:
        return check_password_hash(found.user_password, password)
    else:
        return False


def get_user_id(email):
    user = User.query.filter_by(user_username=email).first()
    if user:
        return user.user_id
    else:
        return None


# If the user is not logged in, redirect to login page
def verifyUserSession(redir_method=None):
    if not userLoggedIn():
        return redirect(url_for('login', redir=redir_method))
    else:
        return None


def userLoggedIn():
    return 'user' in session


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
            return json.dumps({'error': 'Not authenticated'})  # str(data[0])})
    else:
        return json.dumps({'html': '<span>Please enter the required fields.</span>'})


@app.route('/logout')
def logout():
    # remove the username from the session if it is there
    session.pop('user', None)
    return redirect(url_for('main'))



@app.route('/signup', methods=['POST'])
def signUp():
    # Read vlaues from UI
    _fname = request.form['inputFName']
    _lname = request.form['inputLName']
    _school = request.form['inputSchool']
    _email = request.form['inputEmail']
    _password = request.form['inputPassword']

    # Validate values
    if _fname and _lname and _email and _school and _password:

        _hashed_pass = generate_password_hash(_password)

        # Do preliminary check to see if this email is taken
        ID = get_user_id(_email)
        if ID:
            return json.dumps({'error': 'Account already exists under this email.'})

        try:
            newuser = User(user_fname=_fname, user_lname=_lname, user_username=_email, user_password=_hashed_pass,
                           user_school=_school)
            db.session.add(newuser)
            db.session.commit()
            return render_template('login.html')
        except:
            return json.dumps({'error': 'Failed to create the new user!'})
    else:
        return json.dumps({'html': '<span>Please enter the required fields.</span>'})