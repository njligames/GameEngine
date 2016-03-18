#References...
#http://www.raywenderlich.com/3932/networking-tutorial-for-ios-how-to-create-a-socket-based-iphone-app-and-server
#https://github.com/jdavisp3
#https://github.com/jdavisp3/twisted-intro/blob/master/twisted-client-2/get-poetry-simple.py
#http://krondo.com/?p=1522

from twisted.internet.protocol import Protocol, ClientFactory

class PoetryProtocol(Protocol):
    
    poem = ''
    
    def connectionMade(self):
        self.factory.clients.append(self)
    
    def dataReceived(self, data):
        self.poem += data
    
    def connectionLost(self, reason):
        self.factory.clients.remove(self)
        self.poemReceived(self.poem)
        for c in self.factory.clients:
            c.message(self.poem)
    
    def poemReceived(self, poem):
        self.factory.poem_finished(poem)

    def message(self, message):
        self.transport.write(message + '\n')


class PoetryClientFactory(ClientFactory):
    
    protocol = PoetryProtocol # tell base class what proto to build
    
    def __init__(self, poetry_count):
        self.poetry_count = poetry_count
        self.poems = []
    
    def poem_finished(self, poem=None):
        if poem is not None:
            self.poems.append(poem)
        
        self.poetry_count -= 1
        
        if self.poetry_count == 0:
            self.report()
            self.poetry_count = 1
            
#from twisted.internet import reactor
#reactor.stop()

    def report(self):
        for poem in self.poems:
            print poem
    
    def clientConnectionFailed(self, connector, reason):
        print 'Failed to connect to:', connector.getDestination()
        self.poem_finished()

factory = PoetryClientFactory(1)
factory.clients = []

from twisted.internet import reactor

port = 2223
reactor.listenTCP(port, factory)
def listening(): print 'Listening on port' , port
reactor.callWhenRunning(listening)
reactor.run()
