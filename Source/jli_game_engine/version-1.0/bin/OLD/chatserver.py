from twisted.internet.protocol import Protocol, Factory
from twisted.internet import reactor


class IphoneChat(Protocol):
	def connectionMade(self):
		#self.transport.write("""connected""")
		self.factory.clients.append(self)
		print "clients are ", self.factory.clients
	
	def connectionLost(self, reason):
		self.factory.clients.remove(self)
	
	def dataReceived(self, data):
		print data
		for c in self.factory.clients:
			c.message(data)

				
	def message(self, message):
		self.transport.write(message + '\n')


factory = Factory()
factory.protocol = IphoneChat
factory.clients = []

reactor.listenTCP(2223, factory)
def listening(): print 'Listening on port' , 2223
reactor.callWhenRunning(listening)
reactor.run()

