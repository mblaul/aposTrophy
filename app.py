import os
from core import app

__author__ = 'mblaul, gocnak, janelyousif'

if __name__ == "__main__":
    app.run(debug=True, host=os.getenv('IP', '0.0.0.0'), port=int(os.getenv('PORT', 8080)))
