from flask import redirect, url_for, render_template, request, session

from FlaskApp.app import app
from FlaskApp.core.models import User
from FlaskApp.core.routes.auth import userLoggedIn, verifyUserSession
from FlaskApp.core.routes.tests import suggestTests


@app.route("/")
def main():
    loggedIn = userLoggedIn()
    return render_template('index.html', loggedIn=loggedIn)


@app.route('/login', methods=['GET'])
def showLogIn():
    redir_method = request.args.get('redir', default=None)
    return render_template('login.html', redir=redir_method)


@app.route('/signup', methods=['GET'])
def showSignUp():
    if userLoggedIn():
        return redirect(url_for('logout'))
    return render_template('signup.html')


@app.route('/dashboard', methods=["GET"])
def showDashboard():
    verify = verifyUserSession('showDashboard')
    if verify:
        return verify
    else:
        # Let's suggest some tests to take
        suggs = suggestTests()

        return render_template('dashboard.html', suggestions=suggs)


@app.route('/user', methods=['GET'])
def showUser():
    verify = verifyUserSession('showUser')
    if verify:
        return verify
    else:
        ID = session['user']
        user = User.query.filter_by(user_id=ID).first()
        return render_template('user.html', user=user)


@app.route('/practice', methods=['GET'])
def showPracticePage():
    verify = verifyUserSession('showPracticePage')
    if verify:
        return verify
    else:
        return render_template('practice.html')
