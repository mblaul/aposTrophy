from flask import redirect, url_for, render_template, request

from FlaskApp.app import app
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

        return render_template('dashboard/dashboard.html', suggestions=suggs)


@app.route('/user', methods=['GET'])
def showUser():
    verify = verifyUserSession('/user')

    if verify:
        return verify
    else:

        user = {}

        # TODO: CONVERTME
        # cur = mysql.connection.cursor()
        # cur.execute('''
        #                   SELECT *
        #                   FROM tbl_user
        #                   WHERE user_id = 10
        #             ''')
        #
        # data = cur.fetchall()
        #
        # for row in range(len(data)):
        #     user[row] = [data[row][1], data[row][2], data[row][5]]

        return render_template('user.html', user=user)


@app.route('/practice', methods=['GET'])
def showPracticePage():
    verify = verifyUserSession('showPracticePage')
    if verify:
        return verify
    else:
        return render_template('practice.html')