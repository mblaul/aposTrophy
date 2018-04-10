from flask import request, render_template, redirect, url_for, session, json, flash
from werkzeug.security import check_password_hash, generate_password_hash

from FlaskApp.app import app
from FlaskApp.core.models import User, db


def authenticateUser(email, password):
    found = User.query.filter_by(user_username=email).first()
    if found:
        return check_password_hash(found.user_password, password)
    else:
        return None


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


@app.route('/login', methods=['GET'])
def showLogIn():
    redir_method = request.args.get('redir', default=None)
    return render_template('login.html', redir=redir_method)


@app.route('/login', methods=['POST'])
def login():
    redir_method = request.args.get('redir', default=None)

    _email = request.form['inputEmail']
    _password = request.form['inputPassword']

    # Validate values
    if _email and _password:

        # If data is returned something went wrong, if data was not returned then the user was authenticated
        resp = authenticateUser(_email, _password)
        if resp is not None:

            if resp:
                # Set session variable to userid
                session['user'] = get_user_id(_email)

                if redir_method:
                    return redirect(url_for(redir_method))
                else:
                    return redirect(url_for('showUser'))  # just go to the dashboard by default
            else:
                # Incorrect password
                flash('Failed to login: password incorrect.', 'danger')
                return render_template('login.html', redir=redir_method)
        else:
            # None means the account isn't found
            flash('Failed to authenticate: User email not found!', 'danger')
            return render_template('login.html', redir=redir_method)
    else:
        flash('Please enter a username and password.', 'danger')
        return render_template('login.html', redir=redir_method)


@app.route('/logout')
def logout():
    # remove the username from the session if it is there
    session.pop('user', None)
    return redirect(url_for('main'))


@app.route('/signup', methods=['POST'])
def signUp():
    # Read values from UI
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
            flash('A user account already exists for this email!', 'danger')
            return render_template('signup.html')

        try:
            newuser = User(user_fname=_fname, user_lname=_lname, user_username=_email, user_password=_hashed_pass,
                           user_school=_school)
            db.session.add(newuser)
            db.session.commit()
            flash('User account created, you may now log in!', 'success')
            return render_template('login.html')
        except:
            flash('Failed to create the new user due to an internal exception!', 'danger')
            return render_template('signup.html')
    else:
        flash('Please enter all of the required fields.', 'danger')
        return render_template('signup.html')
