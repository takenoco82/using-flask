from flask import Blueprint


app = Blueprint('aha', __name__)


@app.route('/aha', methods=['GET'])
def aha():
    return "aha", 200
