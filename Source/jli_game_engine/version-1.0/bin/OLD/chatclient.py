import socket
import sys
import datetime
from time import gmtime, strftime

content_type = sys.argv[1]
if(len(sys.argv)>2):
	content_name = sys.argv[2]

HOST, PORT = "localhost", 2223

# Create a socket (SOCK_STREAM means a TCP socket)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to server and send data
sock.connect((HOST, PORT))

#iam = strftime("%Y-%m-%d %H:%M:%S", gmtime())
#sock.send("iam:" + iam)

message =  sys.stdin.read()
if(len(sys.argv)>2):
	sock.send("<root><" + content_type + " name=\"" + content_name + "\">" + message + "</" + content_type + "></root>")
else:
	sock.send("<root><" + content_type + ">" + message + "</" + content_type + "></root>")
#while 1 == 1:
	#data = raw_input('--> ')
	#sock.send(data + "\n")

# Receive data from the server and shut down
#received = sock.recv(1024)
#sock.close()

#print "Sent:     %s" % data
#print "Received: %s" % received
