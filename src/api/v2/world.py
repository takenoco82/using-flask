from flask import Blueprint


app = Blueprint('world', __name__)


@app.route('/world', methods=['GET'])
def world():
    return 'World!'
