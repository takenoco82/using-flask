from flask import Blueprint


app = Blueprint('v2_aha', __name__)


@app.route('/aha', methods=['GET'])
def aha():
    return "ahaha", 200
