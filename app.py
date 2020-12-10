from flask import Flask

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello():
    return 'Hello FunctionCompute, http function\n'

@app.route('/invoke', methods=['POST'])
def invoke():
	return 'Hello FunctionCompute, event function\n'

if __name__ == '__main__':
    app.run(debug=True)

