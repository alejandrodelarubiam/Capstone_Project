import logging
from flask import Flask
from flask import json
from flask.logging import create_logger
app = Flask(__name__)
LOG = create_logger(app)

@app.route('/status')
def healthcheck():
    response = app.response_class(
        response=json.dumps({"result":"OK - healthy"}),
        status=200,
        mimetype='application/json'
    )

    LOG.info('Status request successfull')
    return response

@app.route('/metrics')
def metrics():
    response = app.response_class(
        response=json.dumps({"status":"success", "code":0, "data":{"UserCount":140, "UserCountActive":23}}),
        status=200,
        mimetype='application/json'
    )

    LOG.info('Metrics request successfull')
    return response

@app.route("/")
def hello():
    LOG.info('Main request successfull')

    return "Hello World!"

if __name__ == "__main__":
    ## stream logs to a file
    logging.basicConfig(filename='app.log',level=logging.DEBUG)
    app.run(host='0.0.0.0', port=80)