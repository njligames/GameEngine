local bmf = require 'bitmapFontLoader'

local printf = function(self, string)
	local origin = self.node:getOrigin()

	self.text = string

	local node, rect = bmf.newString(self.bmflabel, self.text, self.material, self.geometry, self.shaderProgram)

	node:setOrigin(origin)
	node:setRenderCategory(self.node)
	node:getStateMachine():pushState(self.nodeStates.display)
 njli.World.getInstance():getScene():getRootNode():addChildNode(node)

 njli.Node.destroy(self.node, true)

 self.node = node
 self.rect = rect
end



local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local hide = function(self, camera)
 self.node:hide(camera)
end

local enter = function(self)
 local nodeName = self.node:getName()

 print("enter (" .. nodeName .. ") - START")
 print("enter (" .. nodeName .. ") - END")

end

local update = function(self, timeStep)
 
 

end

local exit = function(self)

 local nodeName = self.node:getName()

 print("exit (" .. nodeName .. ") - START")
 print("exit (" .. nodeName .. ") - END")

end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
end

local near = function(self, otherNode)
end

local touchDown = function(self, rayContact)
end

local touchUp = function(self, rayContact)
end

local touchMove = function(self, rayContact)
end

local touchCancelled = function(self, rayContact)
end

local delete = function(self)
 local nodeName = self.node:getName()

 print("delete (" .. nodeName .. ") - START")

 
 self.node:getStateMachine():pushState(nil)

 njli.Node.destroy(self.node, true)
 self.node = nil

 for k,v in pairs(self.nodeStates) do
 njli.NodeState.destroy(self.nodeStates[k])
 self.nodeStates[k] = nil
 end
 self.nodeStates = nil

 print("delete (" .. nodeName .. ") - END")
end

local methods = 
{
	printf = printf,

	

 actionUpdate = actionUpdate,
 actionComplete = actionComplete,
 hide = hide,
 enter = enter,
 update = update,
 exit = exit,
 onMessage = onMessage,
 collide = collide,
 near = near,
 touchDown = touchDown,
 touchUp = touchUp,
 touchMove = touchMove,
 touchCancelled = touchCancelled,
 __gc = delete
}

local new = function(name, bmflabel, material, geometry, shaderProgram)
	print("new (" .. name .. ") - START")

	

	local node, rect = bmf.newString(bmflabel, name, material, geometry, shaderProgram)

	local names =
 {
 display = name,
 }
 local nodeStates = {}

 for k,v in pairs(names) do
 nodeStates[k] = njli.NodeState.create()
 nodeStates[k]:setName(names[k])
 end

 node:setOrigin(bullet.btVector3(0,0,0))

 node:getStateMachine():pushState(nodeStates.display)

 njli.World.getInstance():getScene():getRootNode():addChildNode(node)

 
 
 local properties = 
 {
 node = node,
 rect = rect,
 nodeStates = nodeStates,
 nodeStateNames = names,

 text = name,
 bmflabel = bmflabel,

 material = material, 
 geometry = geometry,
 shaderProgram = shaderProgram,

 instanceName = name,
 }

 print("new (" .. name .. ") - END")

 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
