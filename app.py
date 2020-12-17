from flask import Flask

app = Flask(__name__)

import subprocess
import os
subprocess.run(["df", "-h"])
print(os.listdir('/mnt/workspace'))
print(os.stat('/mnt/workspace'))

@app.route('/2016-08-15/proxy/sounbum/ubuntu_flask/', methods=['GET'])
def hello():
    return 'Hello FunctionCompute, http function\n'

@app.route('/invoke', methods=['POST'])
def invoke():
	return 'Hello FunctionCompute, event function\n'

if __name__ == '__main__':
    app.run(debug=True)

