from flask import Flask

app = Flask(__name__)

@app.route("/")
@app.route("/product")
def home():
    return "Product Service Running"

app.run(host="0.0.0.0", port=5001)
