import requests
from HTMLParser import HTMLParser
from bs4 import BeautifulSoup
import string
import random


r = requests.get('http://snipplr.com/all/page/1/')
soup = BeautifulSoup(r.text, 'html.parser')

for ol in soup.find_all('ol'):
    for li in ol.find_all('li'):
        links = li.find_all('a')
        view_number = links[1].get('href').split('/')[2]

        url_with_plain_code =  'http://snipplr.com/view.php?codeview&id=' + view_number
        language = links[2].text
        html_plain_code = requests.get(url_with_plain_code)
        code = BeautifulSoup(html_plain_code.text, 'html.parser')
        t = code.find(id="viewsource").find_all('textarea')[0].text
        print code.find_all("div", "rgt")[0].find_all('a')[0].text
