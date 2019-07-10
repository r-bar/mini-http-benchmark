import falcon


class HelloWorld:
    def on_get(self, req, resp):
        resp.media = {'message': 'Hello World!'}


app = falcon.API()
app.add_route('/', HelloWorld())
