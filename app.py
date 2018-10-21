from flask import Flask

from api.v1 import apis as v1_apis
from api.v2 import apis as v2_apis


app = Flask(__name__)

# Blueprint の登録
for api in v1_apis:
    app.register_blueprint(api, url_prefix="/v1")
for api in v2_apis:
    app.register_blueprint(api, url_prefix="/v2")


if __name__ == '__main__':
    app.run('0.0.0.0', 8080, debug=True)
