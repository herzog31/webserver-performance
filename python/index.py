from tornado.httpserver import HTTPServer
from tornado.ioloop import IOLoop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    @tornado.web.asynchronous
    def get(self):
        self.write("Hello World!")
        self.finish()

application = tornado.web.Application([
    (r"/", MainHandler),
])

if __name__ == "__main__":
    server = HTTPServer(application)
    server.bind(80)
    server.start(1)
    IOLoop.instance().start()
