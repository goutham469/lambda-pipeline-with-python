# This is a demo Flask application that will be deployed to AWS Lambda using the Serverless Framework.

import flask

app = flask.Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World 123 from AWS Lambda!"

@app.route("/add", methods=["POST"])
def add():
    data = flask.request.get_json()
    num1 = data.get("num1")
    num2 = data.get("num2")
    result = num1 + num2
    return {"result": result}

if __name__ == '__main__':
    app.run(debug=True, host='<IP_ADDRESS>', port=5000)