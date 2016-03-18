


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
 
end

local actionComplete = function(self, action)
 
end

local enter = function(self)
 

 if self:getNodeObject():getBirdNodeObject():playTauntSound() then
 self:getNodeObject():setFrameActionName("idle")
 self:getNodeObject():setFrameNumber(0)
 self:getNodeObject():setFrameIncrement(1)
 else

 end
end

local update = function(self, timeStep)
 
 if not self:getNodeObject():getBirdNodeObject():isPlayingSound() then
 self:getNodeObject():getStateObject("Idle"):push()
 end
end

local exit = function(self)
 
end

local onMessage = function(self, message)
 
end

local render = function(self)
 
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
