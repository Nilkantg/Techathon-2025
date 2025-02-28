import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns # type: ignore
import pickle as pkl
from sklearn.preprocessing import StandardScaler, LabelEncoder # type: ignore
from statsmodels.tsa.holtwinters import ExponentialSmoothing # type: ignore
from flask import Flask, render_template, request

app = Flask(__name__)

with open(r"Experiments\Andhra Pradesh\ap_scaler.pkl", "rb") as s:
    ap_scaler = pkl.load(s)

with open(r"Experiments\Andhra Pradesh\ap_model.pkl", "rb") as m:
    ap_model = pkl.load(m)


# Define available choices (states & crops)
STATES = ["Maharashtra", "Rajasthan", "Andhra Pradesh", "Uttar Pradesh", "Madhya Pradesh"]
CROPS = ["Wheat", "GroundNut", "Paddy", "Maize", "Sugarcane"]



@app.route("/", methods=["GET", "POST"])
def index():
    predicted_price = None
    if request.method == "POST":
        state = request.form["state"]
        crop = request.form["crop"]

        if (state == "Andhra Pradesh") & (crop == "Paddy"):

            # Predict the price
            scaled_price = ap_model.forecast(steps=1)

            scaled_price = np.array(scaled_price).reshape(-1, 1)

            predicted_price = ap_scaler.inverse_transform(scaled_price)[0][0]

    return render_template("index.html", states=STATES, crops=CROPS, predicted_price=predicted_price)

if __name__ == "__main__":
    app.run(debug=True)
