# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split, GridSearchCV, RandomizedSearchCV
from sklearn.metrics import mean_squared_error, r2_score

from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import LabelEncoder

import warnings
warnings.filterwarnings('ignore')

df = pd.read_csv("/content/Cost_data.csv")

sorted_df = df.sort_values(by="Crop_type")

sorted_df['Cost'] = sorted_df.groupby('Crop_type')['Cost'].transform(lambda x: x.fillna(x.mean()))

# Data Preprocessing
def preprocess_data(df):
    # Convert Time_Period to numeric (extract year)
    df['Year'] = df['Time_Period'].apply(lambda x: int(x.split('_')[0]))

    # Encode categorical variables
    le = LabelEncoder()
    df['Crop_type_encoded'] = le.fit_transform(df['Crop_type'])

    # Create feature matrix X and target variable y
    X = df[['Year', 'Crop_type_encoded', "Cost_of_Production", "Operational_Cost", "Fixed_Cost"]]
    y = df['Cost']

    return X, y, le

X, y, label_encoder = preprocess_data(sorted_df)

# # Split the data
# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

def Hypertuning(train_inputs, train_targets):
  params = {
      'n_estimators': [75, 100],
      'max_depth': [None, 1, 2, 3],
      'min_samples_split': [2, 3, 4, 5]
  }

  cv = 5
  rf_regressor = RandomForestRegressor()

  rf_grid = GridSearchCV(estimator= rf_regressor, param_grid=params, cv=cv, scoring='neg_mean_squared_error', n_jobs=-1)

  rf_grid.fit(train_inputs, train_targets)

  return rf_grid.best_params_

def train_and_evaluate_model(X, y, random_state=369):

    # Perform hyperparameter tuning
    best_params = Hypertuning(X, y)
    print(f"Best parameters: {best_params}")

    # Scale the features
    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X)
    # X_test_scaled = scaler.transform(X_test)

    # Train model using best parameters
    rf_model = RandomForestRegressor(**best_params, random_state=random_state)
    rf_model.fit(X_train_scaled, y)

    # Make predictions
    y_train_pred = rf_model.predict(X_train_scaled)
    # y_test_pred = rf_model.predict(X_test_scaled)

    # Calculate metrics
    train_mse = mean_squared_error(y, y_train_pred)
    # test_mse = mean_squared_error(y_test, y_test_pred)
    train_r2 = r2_score(y, y_train_pred)
    # test_r2 = r2_score(y_test, y_test_pred)

    return rf_model, scaler, train_r2

model, scaler, r2 = train_and_evaluate_model(X, y)

def analyze_feature_importance(model, feature_names):
    importances = model.feature_importances_
    importance_df = pd.DataFrame({
        'Feature': feature_names,
        'Importance': importances
    })
    return importance_df.sort_values('Importance', ascending=False)

def predict_crop_cost(model, scaler, le, year, crop_type, Cost_of_Production, Operational_Cost, Fixed_Cost):
    crop_encoded = le.transform([crop_type])[0]
    features = np.array([[year, crop_encoded, Cost_of_Production, Operational_Cost, Fixed_Cost]])
    features_scaled = scaler.transform(features)
    prediction = model.predict(features_scaled)[0]

    return prediction

year = input("Enter the year: ")
crop_type = input("Enter the crop type: ")
Cost_of_Production = float(input("Enter the cost of production: "))
Operational_Cost = float(input("Enter the operational cost: "))
Fixed_Cost = float(input("Enter the fixed cost: "))

prediction = predict_crop_cost(model, scaler, label_encoder, year, crop_type, Cost_of_Production, Operational_Cost, Fixed_Cost)

print(f"\nPredicted cost for {crop_type} in {year}: ₹{prediction:.2f}")