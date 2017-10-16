import os
from shutil import move
import collections

class Data:
    data = []
    language = []
    language_name = []
    filename = []

def fetch_code(subset='train', folder='/home/alexis/Escritorio/tesis/data/codes/'):
    data = Data()

    search_in = folder + subset + '/'

    for i, file_name in enumerate(os.listdir(search_in)):
        with file(search_in + file_name) as f:
            s = f.read()
        data.data.append(s)
        data.language_name.append(file_name.split('.')[1])
        data.filename.append(file_name)

    return data

def distribution(subset='train', folder='/home/alexis/Escritorio/tesis/data/codes/'):
    data = fetch_code(subset, folder)
    frecuency = collections.Counter([i for i in data.language_name])
    return frecuency

if __name__ == '__main__':
    print distribution()
