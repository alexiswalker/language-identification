from sklearn.externals import joblib
import numpy as np
from dataset import fetch_code, distribution

text_clf = joblib.load('/home/alexis/Escritorio/tesis/filename.pkl')
folder = '/home/alexis/Escritorio/tesis/data/codes/'

test_dataset = fetch_code('test', folder)
docs_test = test_dataset.data
predicted = text_clf.predict(docs_test)

print np.mean(predicted == test_dataset.language)
