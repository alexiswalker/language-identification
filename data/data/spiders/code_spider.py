from scrapy import Spider, Request
import urlparse

class DataSpider(Spider):
    name = 'data'
    allowed_domains = ['pastebin.com']

    def start_requests(self):
        urls = [
            "http://snipplr.com/all/page/1/",
            "http://snipplr.com/all/page/2/",
            "http://snipplr.com/all/page/3/",
        ]
        for url in urls:
            yield Request(url=url, callback=self.parse)

    def parse(self, response):
        page = response.url.split("/")[-2]
        filename = '/home/alexis/Escritorio/tesis/data/data/codes/code-%s.html' % page
        with open(filename, 'wb') as f:
            f.write(response.body)
        self.log('Saved file %s' % filename)
