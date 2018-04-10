from flask import redirect, url_for, render_template, request, session, flash

from app import app
from core.models import User
from core.routes.auth import userLoggedIn, verifyUserSession
from core.routes.tests import suggestTests


@app.route("/")
def main():
    loggedIn = userLoggedIn()
    return render_template('index.html', loggedIn=loggedIn)


@app.route('/signup', methods=['GET'])
def showSignUp():
    if userLoggedIn():
        return redirect(url_for('logout'))
    return render_template('signup.html')


@app.route('/user', methods=['GET'])
def showUser():
    verify = verifyUserSession('showUser')
    if verify:
        return verify
    else:
        ID = session['user']
        user = User.query.filter_by(user_id=ID).first()
        suggs = suggestTests()
        return render_template('user.html', user=user, suggestions=suggs)


@app.route('/practice', methods=['GET'])
def showPracticePage():
    verify = verifyUserSession('showPracticePage')
    if verify:
        return verify
    else:
        return render_template('practice.html')
