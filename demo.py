from keras.models import load_model
import h5py

MODEL_PATH = r'Model.hdf5'

with h5py.File(MODEL_PATH, 'r') as f:
    print("Model config:", f.attrs.get('model_config'))
    print("Layer names:", list(f['model_weights'].keys()))