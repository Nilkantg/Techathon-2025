from __future__ import division, print_function
import os
import numpy as np
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D, BatchNormalization, Flatten, Dense, Dropout
from keras.preprocessing import image
from flask import Flask, request, render_template, redirect, url_for
from werkzeug.utils import secure_filename

app = Flask(__name__)

MODEL_PATH = r'Model.hdf5'

# Define the model architecture exactly as in the HDF5 config
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

@app.route('/disease')
def disease_index():
    return render_template('index.html')

@app.route('/disease/predict', methods=['GET', 'POST'])
def disease_upload():
    if request.method == 'POST':
        if 'file' not in request.files:
            return "Error: No file uploaded"
        f = request.files['file']
        if f.filename == '':
            return "Error: No file selected"
        basepath = os.path.dirname(__file__)
        file_path = os.path.join(basepath, 'uploads', secure_filename(f.filename))
        f.save(file_path)
        class_name = model_predict(file_path, model)
        if isinstance(class_name, list) and len(class_name) == 2:
            result = f"Predicted Crop: {class_name[0]}  Predicted Disease: {class_name[1].title().replace('_', ' ')}"
        else:
            result = f"Error: {class_name}"
        return render_template('result.html', result=result)
    return redirect(url_for('disease_index'))

if __name__ == '__main__':
    os.makedirs(os.path.join(os.path.dirname(__file__), 'uploads'), exist_ok=True)
    app.run(debug=True)