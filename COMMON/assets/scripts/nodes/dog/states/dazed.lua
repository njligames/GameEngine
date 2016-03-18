local startDazedTimer = function(self)
 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()

 local dogParams = nodeObject:getMovingEntityParams()

 self:getDazedTimer():start(dogParams.DazedTime)
end

local getDazedTimer = function(self)
 assert(self.dazedTimer, "self.dazedTimer is nil.")

 return self.dazedTimer
end



local getNodeState = function(self)
 assert(self.nodeState, "self.nodeState is nil.")

 return self.nodeState
end

local getNodeObject = function(self)
 assert(self.nodeObject, "self.nodeObject is nil.")
 
 return self.nodeObject
end

local push = function(self)
 

 self:getNodeObject():getNode():getStateMachine():pushState(self:getNodeState())
end

local isIn = function(self)
 

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

 nodeObject:getMovingEntity():setVelocity(bullet.btVector3(0,0,0))
 node:getPhysicsBody():setVelocity(bullet.btVector3(0,0,0))

 nodeObject:setFrameActionName("idle")

 self:startDazedTimer()
end

local update = function(self, timeStep)
 

 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()

 if self:getDazedTimer():isFinished() then
 nodeObject:run()
 else
 self:getDazedTimer():tick()
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
 
 local nodeObject = self:getNodeObject()
 local node = nodeObject:getNode()
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

 njli.Timer.destroy(self:getDazedTimer())
end

local methods = 
{
 startDazedTimer = startDazedTimer,
 getDazedTimer = getDazedTimer,

 

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


 local dazedTimer = njli.Timer.create()

 local properties = 
 {
 nodeState = nodeState,

 dazedTimer = dazedTimer,



 nodeObject = nodeObject,
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
