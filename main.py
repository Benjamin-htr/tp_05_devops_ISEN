import requests
from flask import Flask, jsonify, render_template, request

app = Flask(__name__)


# Define your endpoint to render the chatbot interface
@app.route("/millem2")
def chat():
    return render_template("index.html")


# Define the endpoint to handle chatbot requests
@app.route("/api/generate", methods=["POST"])
def generate():
    try:
        response = requests.post(json=request.json)
        return jsonify(response.json()), response.status_code
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(port=5001)
