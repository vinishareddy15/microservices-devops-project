from flask import Flask

app = Flask(__name__)

@app.route("/")
@app.route("/order")
def home():
    return "Order Service Running"

app.run(host="0.0.0.0", port=5002)
