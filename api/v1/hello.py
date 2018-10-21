from flask import Blueprint


app = Blueprint('hello', __name__)


@app.route('/hello', methods=['GET'])
def hello():
    return "Hello", 200
