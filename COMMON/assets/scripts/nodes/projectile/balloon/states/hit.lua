

local getNodeState = function(self)
 return self.nodeState
end

local getNodeObject = function(self)
 return self.nodeObject
end

local push = function(self)
 assert(self:getNodeObject(), "self:getNodeObject() must not be nil in " .. self:getNodeState():getName())

 self:getNodeObject():getNode():getStateMachine():pushState(self:getNodeState())
end

local isIn = function(self)
 assert(self:getNodeObject(), "self:getNodeObject() must not be nil in " .. self:getNodeState():getName())

 return self:getNodeState():getName() == self:getNodeObject():getNode():getStateMachine():getState():getName()
end

local actionUpdate = function(self, action, timeStep)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local actionComplete = function(self, action)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local enter = function(self)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()

 nodeObject:getSound():play()
end

local update = function(self, timeStep)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()

 if not nodeObject:getSound():isPlaying() then
 nodeObject:getOwner():destroyProjectileNode(nodeObject)
 
 end
end

local exit = function(self)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local onMessage = function(self, message)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local render = function(self)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local collide = function(self, otherNode, collisionPoint)
 
 
 local myGroup = self:getNodeObject():getNode():getPhysicsBody():getCollisionGroup()
 local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()

end

local near = function(self, otherNode)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local touchDown = function(self, rayContact)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local touchUp = function(self, rayContact)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local touchMove = function(self, rayContact)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local touchCancelled = function(self, rayContact)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
end

local delete = function(self)
 njli.NodeState.destroy(self:getNodeState())
end

local methods = 
{
 
 

 getNodeState = getNodeState,
 getNodeObject = getNodeObject,
 push = push,
 isIn = isIn,
 actionUpdate = actionUpdate,
 actionComplete = actionComplete,
 enter = enter,
 update = update,
 exit = exit,
 onMessage = onMessage,
 render = render,
 collide = collide,
 near = near,
 touchDown = touchDown,
 touchUp = touchUp,
 touchMove = touchMove,
 touchCancelled = touchCancelled,
 __gc = delete
}

local new = function(name, nodeObject)

 local nodeState = njli.NodeState.create()
 nodeState:setName(name)

 local properties = 
 {
 nodeState = nodeState,



 nodeObject = nodeObject,
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
