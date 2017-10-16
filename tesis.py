from sklearn.feature_extraction.text import CountVectorizer, TfidfTransformer
from dataset import fetch_code, distribution

folder = '/home/alexis/Escritorio/tesis/data/codes/'

train_dataset = fetch_code('train', folder)
count_vect = CountVectorizer()
X_train_counts = count_vect.fit_transform(train_dataset.data)

tfidf_transformer = TfidfTransformer()
X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)

print X_train_tfidf.shape
