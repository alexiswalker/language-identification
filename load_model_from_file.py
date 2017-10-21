from sklearn.externals import joblib
import numpy as np
from dataset import fetch_code, distribution
import cPickle


import pickle

# and later you can load it
with open('filename1.pkl', 'rb') as f:
    clf = pickle.load(f)

folder = '/home/alexis/Escritorio/tesis/data/codes/'

test_dataset = fetch_code('test', folder)
predicted = clf.predict(test_dataset.data)

print np.mean(predicted == test_dataset.language)
