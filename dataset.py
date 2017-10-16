import os
from shutil import move
import collections

class Data:
    data = []
    language = []
    language_name = []
    filename = []
    unique_languages_names=[]

def fetch_code(subset='train', folder='/home/alexis/Escritorio/tesis/data/codes/'):
    data = Data()

    search_in = folder + subset + '/'

    for i, file_name in enumerate(os.listdir(search_in)):
        with file(search_in + file_name) as f:
            s = f.read()
        data.data.append(s)
        data.language.append(0)
        data.language_name.append(file_name.split('.')[1])
        data.filename.append(file_name)

    data.unique_languages_names = list(set(data.language_name))

    for i in range(len(data.language_name)):
        data.language[i] = data.unique_languages_names.index(data.language_name[i])

    return data

def distribution(subset='train', folder='/home/alexis/Escritorio/tesis/data/codes/'):
    data = fetch_code(subset, folder)
    frecuency = collections.Counter([i for i in data.language_name])
    return frecuency

if __name__ == '__main__':
    d = fetch_code(subset='test')
    for i in range(20):
        print d.language[i], d.language_name[i]
