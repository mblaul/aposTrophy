import os
from flask import Flask
from core import config

app = Flask('aposTrophy')
app.secret_key = os.urandom(24)

# MySQL config
app.config.from_object(config)


import core.routes.main
import core.routes.auth
import core.routes.tests
