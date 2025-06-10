from flask import Flask, request, jsonify
last_command = "none"
app = Flask(__name__)
@app.route('/move', methods=['POST','GET'])

def move():
    global last_command
    if request.method == 'POST':
        last_command = request.data.decode("utf-8").strip()
        return f"Command received: {last_command}"
    return f"Last command: {last_command}"
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
