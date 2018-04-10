from sqlalchemy import func

from FlaskApp.core import app
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects.mysql import *

db = SQLAlchemy(app)


class User(db.Model):
    __tablename__ = 'user'

    user_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    user_fname = db.Column(TEXT(), nullable=False)
    user_lname = db.Column(TEXT(), nullable=False)
    user_username = db.Column(TEXT(), nullable=False)
    user_password = db.Column(TEXT(), nullable=False)
    user_school = db.Column(TEXT(), nullable=False)
    results = db.relationship('Result', backref='user', lazy=True)


class Paragraph(db.Model):
    __tablename__ = 'paragraph'

    paragraph_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    paragraph_text = db.Column(TEXT(), nullable=False)
    questions = db.relationship('Question', backref='paragraph', lazy=True)


class Question(db.Model):
    __tablename__ = 'question'

    question_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    paragraph_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('paragraph.paragraph_id'), nullable=False)
    question_text = db.Column(TEXT(), nullable=False)
    skill_lvl = db.Column(INTEGER(unsigned=True), nullable=False)
    area = db.Column(TEXT(), nullable=False)
    result_lines = db.relationship('ResultLine', backref='question', lazy=False)
    options = db.relationship('Option', backref='question', lazy=True)


class Option(db.Model):
    __tablename__ = 'options'

    option_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    question_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('question.question_id'),
                            nullable=False, primary_key=True)
    option_text = db.Column(TEXT(), nullable=False)
    is_correct = db.Column(BOOLEAN(), nullable=False)
    result_lines = db.relationship('ResultLine', backref='options', lazy=True)


class Result(db.Model):
    __tablename__ = 'result'

    result_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    user_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('user.user_id'), nullable=False)
    result_date = db.Column(DATETIME(), default=func.utc_timestamp(), nullable=False)
    # Simulation exams can null these
    test_type = db.Column(VARCHAR(4), nullable=True)
    test_skill_lvl = db.Column(INTEGER(), nullable=True)
    test_area = db.Column(TEXT(), nullable=False)
    result_lines = db.relationship('ResultLine', backref='result', lazy=True)


class ResultLine(db.Model):
    __tablename__ = 'result_line'

    result_line_id = db.Column(INTEGER(unsigned=True), primary_key=True)
    result_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('result.result_id'), nullable=False)
    # The option they selected
    option_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('options.option_id'), nullable=False)
    question_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('question.question_id'), nullable=False)
