from sklearn.feature_extraction.text import CountVectorizer, TfidfTransformer
from sklearn.naive_bayes import MultinomialNB
from sklearn.linear_model import SGDClassifier
from sklearn.pipeline import Pipeline
import numpy as np

from dataset import fetch_code, distribution

folder = '/home/alexis/Escritorio/tesis/data/codes/'

train_dataset = fetch_code('train', folder)

#text_clf = Pipeline([('vect', CountVectorizer()), ('tfidf', TfidfTransformer()),('clf', MultinomialNB())])

text_clf = Pipeline([('vect', CountVectorizer()), ('tfidf', TfidfTransformer()),('clf',  SGDClassifier(loss='hinge', penalty='l2', alpha=1e-3, random_state=42, max_iter=5, tol=None))])
text_clf.fit(train_dataset.data, train_dataset.language)

test_dataset = fetch_code('test', folder)
docs_test = test_dataset.data
predicted = text_clf.predict(docs_test)

print np.mean(predicted == test_dataset.language)

'''
count_vect = CountVectorizer()
X_train_counts = count_vect.fit_transform(train_dataset.data)

tfidf_transformer = TfidfTransformer()
X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)

clf = MultinomialNB().fit(X_train_tfidf, train_dataset.language)

docs_new = ['def ale(): return None']
X_new_counts = count_vect.transform(docs_new)
X_new_tfidf = tfidf_transformer.transform(X_new_counts)

predicted = clf.predict(X_new_tfidf)

for doc, category in zip(docs_new, predicted):
    print('%r => %s' % (doc, train_dataset.unique_languages_names[category]))
'''
