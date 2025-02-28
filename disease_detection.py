from __future__ import division, print_function
import pandas as pd
import os
import numpy as np
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D, BatchNormalization, Flatten, Dense, Dropout
from keras.preprocessing import image
from flask import Flask, request, render_template, jsonify
from werkzeug.utils import secure_filename

app = Flask(__name__)

# Load the pesticide dataset
pesticides_df = pd.read_csv("data/Pesticides dataset/Pesticide.csv")

MODEL_PATH = r'Model.hdf5'
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Define the model architecture
print(" ** Model Building **")
model = Sequential([
    Conv2D(96, (11, 11), strides=(4, 4), padding='valid', activation='relu', input_shape=(224, 224, 3)),
    MaxPooling2D(pool_size=(2, 2), strides=(2, 2), padding='valid'),
    BatchNormalization(axis=-1, momentum=0.99, epsilon=0.001),
    Conv2D(256, (11, 11), strides=(1, 1), padding='valid', activation='relu'),
    MaxPooling2D(pool_size=(2, 2), strides=(2, 2), padding='valid'),
    BatchNormalization(axis=-1, momentum=0.99, epsilon=0.001),
    Conv2D(384, (3, 3), strides=(1, 1), padding='valid', activation='relu'),
    BatchNormalization(axis=-1, momentum=0.99, epsilon=0.001),
    Conv2D(384, (3, 3), strides=(1, 1), padding='valid', activation='relu'),
    BatchNormalization(axis=-1, momentum=0.99, epsilon=0.001),
    Conv2D(256, (3, 3), strides=(1, 1), padding='valid', activation='relu'),
    MaxPooling2D(pool_size=(2, 2), strides=(2, 2), padding='valid'),
    BatchNormalization(axis=-1, momentum=0.99, epsilon=0.001),
    Flatten(),
    Dense(4096, activation='relu'),
    Dropout(0.4),
    BatchNormalization(axis=-1, momentum=0.99, epsilon=0.001),
    Dense(4096, activation='relu'),
    Dropout(0.4),
    BatchNormalization(axis=-1, momentum=0.99, epsilon=0.001),
    Dense(1000, activation='relu'),
    Dropout(0.2),
    BatchNormalization(axis=-1, momentum=0.99, epsilon=0.001),
    Dense(38, activation='softmax')
])

# Load weights from the HDF5 file
print(" ** Loading Weights **")
try:
    model.load_weights(MODEL_PATH)
    print(" ** Model Loaded Successfully **")
except Exception as e:
    print(f"Error loading weights: {e}")
    exit()

def model_predict(img_path, model):
    try:
        img = image.load_img(img_path, target_size=(224, 224))
        x = image.img_to_array(img)
        x = np.expand_dims(x, axis=0)
        x = x / 255.0

        preds = model.predict(x)
        d = preds.flatten()
        j = d.max()

        li = [
            "Strawberry___healthy", 'Apple___Black_rot', 'Apple___Cedar_apple_rust', 'Apple___healthy',
            'Blueberry___healthy', 'Cherry_(including_sour)___Powdery_mildew', 'Cherry_(including_sour)___healthy',
            'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot', 'Corn_(maize)___Common_rust_',
            'Corn_(maize)___Northern_Leaf_Blight', 'Corn_(maize)___healthy', 'Grape___Black_rot',
            'Grape___Esca_(Black_Measles)', 'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)', 'Grape___healthy',
            'Orange___Haunglongbing_(Citrus_greening)', 'Peach___Bacterial_spot', 'Peach___healthy',
            'Pepper,_bell___Bacterial_spot', 'Pepper,_bell___healthy', 'Potato___Early_blight',
            'Potato___Late_blight', 'Potato___healthy', 'Raspberry___healthy', 'Soybean___healthy',
            'Squash___Powdery_mildew', 'Strawberry___Leaf_scorch', 'Apple___Apple_scab',
            'Tomato___Bacterial_spot', 'Tomato___Early_blight', 'Tomato___Late_blight', 'Tomato___Leaf_Mold',
            'Tomato___Septoria_leaf_spot', 'Tomato___Spider_mites Two-spotted_spider_mite', 'Tomato___Target_Spot',
            'Tomato___Tomato_Yellow_Leaf_Curl_Virus', 'Tomato___Tomato_mosaic_virus', 'Tomato___healthy'
        ]

        for index, item in enumerate(d):
            if item == j:
                class_name = li[index].split('___')
                return class_name
    except Exception as e:
        return f"Prediction error: {str(e)}"
    return None

@app.route('/ping', methods=['GET'])
def ping():
    return jsonify({"message": "Server is running!", "status": "success"})

@app.route('/', methods=['GET'])
def main():
    return jsonify({"message": "Server is working!", "status": "success"})

@app.route('/disease', methods=['GET'])
def disease_index():
    return render_template('index.html')

@app.route('/disease/predict', methods=['POST'])
def disease_upload():
    if 'file' not in request.files:
        return jsonify({"error": "No file uploaded", "status": "error"}), 400
    
    f = request.files['file']
    if f.filename == '':
        return jsonify({"error": "No file selected", "status": "error"}), 400
    
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename))
    f.save(file_path)
    
    # Predict disease
    class_name = model_predict(file_path, model)
    
    if isinstance(class_name, list) and len(class_name) == 2:
        crop, disease = class_name
        disease_name = disease.title().replace('_', ' ')
        
        # Fetch pesticides for the predicted disease
        pesticides = pesticides_df[pesticides_df["Disease"] == disease][["Organic_Pesticide", "Inorganic_Pesticide"]]
        
        if not pesticides.empty:
            organic = pesticides["Organic_Pesticide"].iloc[0] if pd.notna(pesticides["Organic_Pesticide"].iloc[0]) else "Not specified"
            inorganic = pesticides["Inorganic_Pesticide"].iloc[0] if pd.notna(pesticides["Inorganic_Pesticide"].iloc[0]) else "Not specified"
        else:
            organic = "Sorry, we don’t have related data for this disease."
            inorganic = "Sorry, we don’t have related data for this disease."
        
        result = {
            "crop": crop,
            "disease": disease_name,
            "organic_pesticide": organic,
            "inorganic_pesticide": inorganic,
            "status": "success"
        }
    else:
        result = {
            "error": str(class_name),
            "status": "error"
        }
    
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)