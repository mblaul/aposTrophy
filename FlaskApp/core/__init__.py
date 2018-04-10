import os
from flask import Flask
from FlaskApp.core import config

app = Flask('aposTrophy')
app.secret_key = os.urandom(24)

# MySQL config
app.config.from_object(config)


import FlaskApp.core.routes.main
import FlaskApp.core.routes.auth
import FlaskApp.core.routes.tests
