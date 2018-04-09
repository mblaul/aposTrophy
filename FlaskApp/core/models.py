from sqlalchemy import func

from FlaskApp.core import app
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects.mysql import *

db = SQLAlchemy(app)


class User(db.Model):
    __tablename__ = 'user'

    user_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    user_fname = db.Column(TEXT())
    user_lname = db.Column(TEXT())
    user_username = db.Column(TEXT(), nullable=False)
    user_password = db.Column(TEXT(), nullable=False)
    user_school = db.Column(TEXT())


class Paragraph(db.Model):
    __tablename__ = 'paragraph'

    paragraph_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    paragraph_text = db.Column(TEXT(), nullable=False)
    questions = db.relationship('Question', backref='paragraph')


class Question(db.Model):
    __tablename__ = 'question'

    question_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    paragraph_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('paragraph.paragraph_id'))
    question_text = db.Column(TEXT(), nullable=False)
    skill_lvl = db.Column(INTEGER(unsigned=True), nullable=False)
    area = db.Column(TEXT(), nullable=False)


class Option(db.Model):
    __tablename__ = 'options'

    option_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    question_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('question.question_id'))
    option_text = db.Column(TEXT(), nullable=False)
    is_correct = db.Column(BOOLEAN(), nullable=False)


class Result(db.Model):
    __tablename__ = 'result'

    result_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    user_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('user.user_id'))
    result_date = db.Column(DATETIME(), default=func.utc_timestamp())
    test_type = db.Column(VARCHAR(4))
    test_skill_lvl = db.Column(INTEGER())
    test_area = db.Column(TEXT(), nullable=False)
    result_lines = db.relationship('ResultLine', backref='Result', lazy=True)


class ResultLine(db.Model):
    __tablename__ = 'result_line'

    result_line_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    result_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('result.result_id'))
    # The option they selected
    option_id = db.Column(INTEGER(unsigned=True))
    question_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('question.question_id'))
