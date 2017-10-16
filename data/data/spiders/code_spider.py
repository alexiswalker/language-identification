from scrapy import Spider, Request
from bs4 import BeautifulSoup
import string
import random

class DataSpider(Spider):
    name = 'data'
    allowed_domains = ['snipplr.com']

    start_urls = [
        "http://snipplr.com/all/page/1/",
        "http://snipplr.com/all/page/2/",
        "http://snipplr.com/all/page/3/",
    ]

    def parse(self, response):
        soup = BeautifulSoup(response.body, 'html.parser')
        for ol in soup.find_all('ol'):
            for li in ol.find_all('li'):
                links = li.find_all('a')
                view_number = links[1].get('href').split('/')[2]
                url_with_plain_code =  'http://snipplr.com/view.php?codeview&id=' + view_number
                #language = links[2].text
                yield Request(url=url_with_plain_code, callback=self.parse_code)

    def parse_code(self, response):
        self.log(response.meta)
        code = BeautifulSoup(response.body, 'html.parser')
        t = code.find(id="viewsource").find_all('textarea')[0].text
        language = code.find_all("div", "rgt")[0].find_all('a')[0].text
        filename = '/home/alexis/Escritorio/tesis/data/data/codes/code-%s.%s' % (self.random_string(), language)
        with open(filename, 'wb') as f:
            f.write(t)
        self.log('Saved file %s' % filename)

    def random_string(self):
        return ''.join([random.choice(string.ascii_uppercase + string.digits) for _ in range(5)])
