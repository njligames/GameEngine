import socket
import sys
import datetime
from time import gmtime, strftime

content_type = sys.argv[1]

baseDirectory = 'gameplay_scripts/'

if(len(sys.argv)>2):
	content_filename = sys.argv[2]
	index = content_filename.index(baseDirectory)
	content_filename = content_filename[index+len(baseDirectory):len(content_filename)]

if(len(sys.argv)>3):
	action_type = sys.argv[3]


HOST, PORT = "localhost", 2223

# Create a socket (SOCK_STREAM means a TCP socket)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to server and send data
sock.connect((HOST, PORT))

#iam = strftime("%Y-%m-%d %H:%M:%S", gmtime())
#sock.send("iam:" + iam)

message =  sys.stdin.read()
sockMessage = ""

if(len(sys.argv)>3):
	# sockMessage = "<root>{\
	#     \""+content_type+"\": {\
	#         \"type\": \""+action_type+"\",\
	#         \"name\": \""+content_filename+"\",\
	#         \"text\": \""+message+"\"\
	#     }\
	# }</root>"
	sockMessage = "<root><" + content_type + " type=\"" + action_type + "\" name=\"scripts/" + content_filename + "\">" + message + "</" + content_type + "></root>"
elif(len(sys.argv)>2):
	sockMessage = "<root><" + content_type + " name=\"" + content_filename + "\">" + message + "</" + content_type + "></root>"
else:
	sockMessage = "<root><" + content_type + ">" + message + "</" + content_type + "></root>"


sock.send(sockMessage)


#while 1 == 1:
	#data = raw_input('--> ')
	#sock.send(data + "\n")

# Receive data from the server and shut down
#received = sock.recv(1024)
#sock.close()

#print "Sent:     %s" % data
#print "Received: %s" % received
