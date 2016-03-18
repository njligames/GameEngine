import sys
import os.path
import untangle

folder = '../doc/doxygen/xml/'
#out_folder = './jli_completions/'
out_folder = "/Users/jamesfolk/Library/Application Support/Sublime Text 2/Packages/Lua JLI/Lua/"

files = {}

class UniqueDict(dict):
	def __setitem__(self, key, value):
		if key not in self:
			dict.__setitem__(self, key, value)

snippets = UniqueDict()

def reverse_string(a_string):
	return a_string[::-1]

def parsefunction(memberdef, classname, isStatic):
	functionname = memberdef.name.cdata
	returntype = "RETURNTYPE"
	if hasattr(memberdef.type, 'ref'):
#		returntype = memberdef.type.ref.cdata + ' ' + memberdef.type.cdata
		returntype = memberdef.type.cdata
	else:
		returntype = memberdef.type.cdata
	params = []
	if hasattr(memberdef, 'param'):
		for param in memberdef.param:
			if hasattr(param, 'type') and hasattr(param, 'declname'):
				parameter = {}
				if hasattr(param.type, 'ref'):
					parameter['type'] = param.type.cdata
					parameter['typeref'] = param.type.ref.cdata
				else:
					parameter['type'] = param.type.cdata
					parameter['typeref'] = ""

				parameter['declname'] = param.declname.cdata
				params.append(parameter)
				#print(param.type.cdata + '' + param.declname.cdata)
	string = "JLI." + classname + "." + functionname + "("
	i = 0
	key = classname 
	if isStatic:
		key = key + "."
	else:
		key = key + ":"
	key = key + functionname
	for param in params:
		string = string + param['type'] + ' ' + param['declname']
		key = key + param['type']
		i = i + 1
		if i < len(params):
			string = string + ","
	string = string + ")"


	#print(string)
	return {"class":classname, "return":returntype, "function":functionname, "params":params, "key":key}

def createStaticFunctionSnippet(ret, isStatic):
	content = "<![CDATA["
	if isStatic:
		content = content + "JLI." + ret["class"] + "." + ret["function"] + "("
	else:
		content = content + ret["function"] + "("

	i = 0
	for param in ret["params"]:
		paramcount = str(i + 1)
		content = content + "${" + paramcount + ":" + param["type"] + "}"
		i = i + 1
		if i < len(ret["params"]):
			content = content + ","
	content = content + ")"
	content = content + "]]>"


	scope = "_"
	if isStatic:
		scope = "__"
	tabTrigger = ret["class"] + scope + ret["function"]

	prepend = ""
	if isStatic:
		prepend = "static "
	description = prepend + ret["return"] + " " + ret["class"] + "::" + ret["function"] + "("

	i = 0
	for param in ret["params"]:
		paramcount = str(i + 1)
		description = description + param["type"] + " " + param["declname"]
		i = i + 1
		if i < len(ret["params"]):
			description = description + ","
	description = description + ")"

	return {"content":content,"tabTrigger":tabTrigger,"description":description}
	#print(description)

	#test = "JLI." + ret["class"] + "." + ret["function"] + "("
	#i = 0
	#for param in ret["params"]:
		#test = test + param["type"] + " " + param["declname"]
		#i = i + 1
		#if i < len(ret["params"]):
			#test = test + ","
	#test = test + ")"
	#print(test)
if __name__ == '__main__':

	for filename in os.listdir (folder):
		with open(folder + filename) as current_file:
			s = current_file.read();
			refid = filename[0:filename.find(".")]
			#print('parsing ' + refid)
			files[refid] = untangle.parse(s)
			
	o = untangle.parse(open(folder + 'index.xml').read())



	filecount = 0
	for compound in o.doxygenindex.compound:
		if compound['kind'] == 'class':
			if hasattr(compound, 'member'):
				for member in compound.member:
					if member['kind'] == 'function':
						#print("\t" + member.name.cdata + "\t" + member['refid']);
						#print("building... (" + folder + compound['refid'] + ".xml")
						cls = files[compound['refid']]
						classname = reverse_string(cls.doxygen.compounddef.compoundname.cdata)
						classname = classname[0:classname.find(":")]
						classname = reverse_string(classname)
						for sectiondef in cls.doxygen.compounddef.sectiondef:
							#print(sectiondef['kind'])
							if sectiondef['kind'] == 'public-static-func':
								if hasattr(sectiondef, 'memberdef'):
									for memberdef in sectiondef.memberdef:
										if memberdef['kind'] == 'function':
											functionDict = parsefunction(memberdef, classname, True)
											snippet = createStaticFunctionSnippet(functionDict, True)
											output = "<snippet>\n"
											output = output + "\t<content>" + snippet["content"] + "</content>\n"
											output = output + "\t<tabTrigger>" + snippet["tabTrigger"] + "</tabTrigger>\n"
											output = output + "\t<scope>source.lua</scope>\n"
											output = output + "\t<description>" + snippet["description"] + "</description>\n"
											output = output + "</snippet>\n"
											key = functionDict["key"]
											key = key.replace(" ", "")
											key = key.replace("*", "")
											key = key.replace("&", "")

											snippets[key] = output

							if sectiondef['kind'] == 'public-func':
								if hasattr(sectiondef, 'memberdef'):
									for memberdef in sectiondef.memberdef:
										if memberdef['kind'] == 'function':
											functionDict = parsefunction(memberdef, classname, False)
											functionName = functionDict["function"]
											if -1 == functionName.find('operator', 0):
												snippet = createStaticFunctionSnippet(functionDict, False)
												output = "<snippet>\n"
												output = output + "\t<content>" + snippet["content"] + "</content>\n"
												output = output + "\t<tabTrigger>" + snippet["tabTrigger"] + "</tabTrigger>\n"
												output = output + "\t<scope>source.lua</scope>\n"
												output = output + "\t<description>" + snippet["description"] + "</description>\n"
												output = output + "</snippet>\n"
												key = functionDict["key"]

												key = key.replace(" ", "")
												key = key.replace("*", "")
												key = key.replace("&", "")
												snippets[key] = output

#print(str(snippets))
filecount = 0
for k,v in snippets.items():
	f = open(out_folder + str(k) + ".sublime-snippet", "w")
	filecount = filecount + 1
	f.write(snippets[k])
	#f.close()
	#print(out_folder + str(filecount) + ".sublime-snippet")
	#print(k)
	#print(snippets[k] + "\n")



	#for k,v in files.items():
		#print k, 'corresponds to', v
