from scrapy import Spider, Request
from bs4 import BeautifulSoup
import string
import random

class DataSpider(Spider):
    name = 'data'
    allowed_domains = ['pastebin.com']

    start_urls = [
        "http://pastebin.com/archive/c/",
        "http://pastebin.com/archive/cpp/",
        "http://pastebin.com/archive/csharp/",
        "http://pastebin.com/archive/clojure/",
        "http://pastebin.com/archive/coffeescript/",
        "http://pastebin.com/archive/css/",
        "http://pastebin.com/archive/diff/",
        "http://pastebin.com/archive/erlang/",
        "http://pastebin.com/archive/haskell/",
        "http://pastebin.com/archive/java/",
        "http://pastebin.com/archive/javascript/",
        "http://pastebin.com/archive/json/",
        "http://pastebin.com/archive/lua/",
        "http://pastebin.com/archive/php/",
        "http://pastebin.com/archive/perl/",
        "http://pastebin.com/archive/python/",
        "http://pastebin.com/archive/ruby/",
        "http://pastebin.com/archive/rust/",
        "http://pastebin.com/archive/scala/",
        "http://pastebin.com/archive/smalltalk/",
        "http://pastebin.com/archive/sql/",
        "http://pastebin.com/archive/vbscript/",
        "http://pastebin.com/archive/xml/",
    ]

    def parse(self, response):
        soup = BeautifulSoup(response.body, 'html.parser')
        table = soup.find_all("table", "maintable")[0]
        rows = table.find_all("tr")

        for i in rows[1:]:
            url_with_plain_code = 'https://pastebin.com/raw' + i.find_all("a")[0].get('href')
            yield Request(url=url_with_plain_code, callback=self.parse_code)

    def parse_code(self, response):
        self.log(response.meta)
        language = 'python'
        filename = '/home/alexis/Escritorio/tesis/data/data/codes/code-%s.%s' % (self.random_string(), language)
        with open(filename, 'wb') as f:
            f.write(response.body)
        self.log('Saved file %s' % filename)

    def random_string(self):
        return ''.join([random.choice(string.ascii_uppercase + string.digits) for _ in range(5)])
