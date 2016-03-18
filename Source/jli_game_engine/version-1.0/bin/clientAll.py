import socket
import sys
import datetime
from time import gmtime, strftime
import glob
# from subprocess import call
import os
import os, fnmatch


def find_files(directory, pattern):
    for root, dirs, files in os.walk(directory):
        for basename in files:
            if fnmatch.fnmatch(basename, pattern):
                filename = os.path.join(root, basename)
                yield filename


if(len(sys.argv)>1):
	directory = sys.argv[1]

allData = "<root>"

for filename in find_files(directory, '*.lua'):
	index = filename.index('gameplay_scripts/')
	
	if (not '_OLD/' in filename) or (not '_archive/' in filename):
		filename = filename[index+len('gameplay_scripts/'):len(filename)]
		
		fileData = os.popen("/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/bin/removeComments " + filename).read()
		currentData = "<lua type=\"build\" name=\"" + filename + "\">" + fileData + "</lua>"
		allData = allData + currentData

allData = allData + "</root>"

print allData

HOST, PORT = "localhost", 2223

# Create a socket (SOCK_STREAM means a TCP socket)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to server and send data
sock.connect((HOST, PORT))

#iam = strftime("%Y-%m-%d %H:%M:%S", gmtime())
#sock.send("iam:" + iam)

sock.send(allData)



# call(["ls", "-l"])

# if(len(sys.argv)>1):
# 	directory = sys.argv[1]

# luaFiles = glob.glob(directory + "*/*.lua")

# allData = "<root>"

# # /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/bin/removeComments $i | python /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/bin/client.py lua $i build
# for luaFile in luaFiles:
# 	# print luaFile
# 	# call(["cat", luaFile])
	
# 	index = luaFile.index('gameplay_scripts/')
# 	print luaFile[index+len('gameplay_scripts/'):len(luaFile)]
# 	print index, luaFile

# 	fileData = os.popen("/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/bin/removeComments " + luaFile).read()
# 	currentData = "<lua type=\"build\" name=\"" + luaFile + "\">" + fileData + "</lua>"
# 	allData = allData + currentData

# allData = allData + "<root>"

# print allData

# print directory