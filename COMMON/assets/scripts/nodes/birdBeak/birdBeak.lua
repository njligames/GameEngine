local function getRootName(name)
 return string.sub(name, string.find(name, "/") + 1)
end

local function getFrameName(name, frameAction, frameSide, frameNumber)
 local folderName = getRootName(name) .. "_" .. frameAction .. "_" .. frameSide
 local fileName = folderName .. "_" .. string.format("%.5d", frameNumber)

 return folderName .. "/" .. fileName
end

local function createActionValues()
 local action = njli.Action.create()
 action:setName('ForwardFly')
 action:setRepeatForever()

 local frameActionName = "idle"
 local frameNumber = 0
 local frameIncrement = 1
 local frameSideName = "front"

 return action, frameActionName, frameSideName, frameNumber, frameIncrement
end

local function createStateObjects(self)
 self.stateNames = {}
 self.stateObjects = {}

 self:addStateObject("Grab", require "nodes.birdBeak.states.grab")
 self:addStateObject("Idle", require "nodes.birdBeak.states.idle")
 self:addStateObject("Hit", require "nodes.birdBeak.states.hit")
 self:addStateObject("Yap", require "nodes.birdBeak.states.yap")

 local frameName = getFrameName(self:getNode():getName(), self:getFrameActionName(), self:getFrameSideName(), self:getFrameNumber())
 setupSpriteFrame(frameName, self:getNode(), self:getSheetInfo(), self:getSpriteAtlas(), self:getGeometry())

 
 
 

 self.paused = false
end

local getBirdNodeObject = function(self)
 return self.birdNodeObject
end

local setBirdNodeObject = function(self, birdNodeObject)
 assert(birdNodeObject, "birdNodeObject must not be nil")

 self.birdNodeObject = birdNodeObject
end

local setHitFrame = function(self, hitFrame)
 self.hitFrame = hitFrame
end

local getHitFrame = function(self)
 assert(self.hitFrame, "self.hitFrame is nil")

 return self.hitFrame
end



local pause = function(self)
 self.paused = true
 
 
end

local unPause = function(self)
 self.paused = false
 
end

local isPaused = function(self)
 return self.paused
end

local getAnimationClock = function(self)
 return self.animationClock
end

local getNode = function(self)
 assert(self.node, "self.node is nil.")
 
 return self.node
end

local hasStateObject = function(self, stateName)
 return (self.stateObjects[stateName] ~= nil)
end

local getStateObject = function(self, stateName)
 assert(self.stateObjects, "self.stateObjects is nil")
 assert(self.stateObjects[stateName], "self.stateObjects[stateName] is nil.")

 return self.stateObjects[stateName]
end

local addStateObject = function(self, stateName, nodeStateObject)

 assert(self.stateObjects, "node state is nil")
 assert(self.stateNames[stateName] == nil, "Already contains a state with name (" .. stateName .. ")")

 self.stateNames[stateName] = getRootName(self:getNode():getName()) .. stateName
 self.stateObjects[stateName] = nodeStateObject.new(stateName, self)

end

local getAction = function(self)
 assert(self.action, "self.action is nil.")

 return self.action
end

local getFrameActionName = function(self)
 assert(self.frameActionName, "self.frameActionName is nil")

 return self.frameActionName
end

local setFrameActionName = function(self, name)
 self.frameActionName = name
end

local getFrameSideName = function(self)
 assert(self.frameSideName, "self.frameSideName is nil")
 
 return self.frameSideName
end

local incrementFrame = function(self)
 self.frameNumber = self:getFrameNumber() + self:getFrameIncrement()
 if self:getFrameNumber() > 8 then
 self.frameNumber = 0
 end
end

local getFrameNumber = function(self)
 assert(self.frameNumber, "self.frameNumber is nil")
 
 return self.frameNumber
end

local setFrameNumber = function(self, frameNumber)
 assert(type(frameNumber) == "number", "setFrameNumber expects a number.")
 
 self.frameNumber = frameNumber
end

local getFrameIncrement = function(self)
 assert(self.frameIncrement, "self.frameIncrement is nil")
 
 return self.frameIncrement
end

local setFrameIncrement = function(self, increment)
 assert(type(increment) == "number", "setFrameIncrement expects a number.")

 self.frameIncrement = increment
end

local getSheetInfo = function(self)
 assert(self.sheetInfo, "self.sheetInfo is nil")
 
 return self.sheetInfo
end

local getSpriteAtlas = function(self)
 assert(self.spriteAtlas, "self.spriteAtlas is nil")
 
 return self.spriteAtlas
end

local getGeometry = function(self)
 assert(self.geometry, "self.geometry is nil")
 
 return self.geometry
end

local start = function(self)
 createStateObjects(self)
 
end

local getCurrentStateName = function(self)
 if self:getNode() and 
 self:getNode():getStateMachine() and 
 self:getNode():getStateMachine():getState() and 
 self:getNode():getStateMachine():getState():getName() then
 return self:getNode():getStateMachine():getState():getName()
 end
 return nil
end

local actionUpdate = function(self, action, timeStep)
 if not self:isPaused() then

 local node = action:getParent()
 local nodeName = node:getName()
 local nodeStateName = node:getStateMachine():getState():getName()

 if (self:getAnimationClock():getTimeMilliseconds() / 1000) > (1.0/30.0) then
 self:getAnimationClock():reset()

 self:incrementFrame()

 local frameName = getFrameName(self:getNode():getName(), self:getFrameActionName(), self:getFrameSideName(), self:getFrameNumber())

 setupSpriteFrame(frameName, self:getNode(), self:getSheetInfo(), self:getSpriteAtlas(), self:getGeometry())

 local AabbMin, AabbMax = self.node:getGeometry():getAabb(self:getNode())

 AabbMax = AabbMax * self:getNode():getScale()
 AabbMax:setZ(1.0)

 
 end



 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):actionUpdate(action, timeStep)
 end

 end

end

local actionComplete = function(self, action)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):actionComplete(action)
 end

end

local enter = function(self)

 self:getNode():runAction(self:getAction())
 
 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):enter()
 end

end

local update = function(self, timeStep)
 if not self:isPaused() then

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):update(timeStep)
 end

 end
end

local exit = function(self)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):exit()
 end

end

local onMessage = function(self, message)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):onMessage(message)
 end

end

local render = function(self)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):render()
 end

end

local collide = function(self, otherNode, collisionPoint)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):collide(otherNode, collisionPoint)
 end

end

local near = function(self, otherNode)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):near(otherNode)
 end

end

local touchDown = function(self, rayContact)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):touchDown(rayContact)
 end

end

local touchUp = function(self, rayContact)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):touchUp(rayContact)
 end

end

local touchMove = function(self, rayContact)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):touchMove(rayContact)
 end

end

local touchCancelled = function(self, rayContact)

 local stateName = self:getCurrentStateName()

 if self:hasStateObject(stateName) then
 self:getStateObject(stateName):touchCancelled(rayContact)
 end

end

local delete = function(self)
 self:getNode():getStateMachine():pushState(nil)
 
 njli.Clock.destroy(self.animationClock)

 njli.Action.destroy(self.action)
 self.action = nil

 njli.PhysicsShapeCylinder.destroy(self.physicsShape)
 self.physicsShape = nil

 
 

 njli.Node.destroy(self.node)
 self.node = nil

 for k,v in pairs(self.stateObjects) do
 self.stateObjects[k] = nil
 end
 self.stateObjects = nil
end

local methods = 
{
 getBirdNodeObject = getBirdNodeObject,
 setBirdNodeObject = setBirdNodeObject,
 setHitFrame = setHitFrame,
 getHitFrame = getHitFrame,



 pause = pause,
 unPause = unPause,
 isPaused = isPaused,
 getAnimationClock = getAnimationClock,
 getNode = getNode,
 hasStateObject = hasStateObject,
 getStateObject = getStateObject,
 addStateObject = addStateObject,
 getAction = getAction,
 getFrameActionName = getFrameActionName,
 setFrameActionName = setFrameActionName,
 getFrameSideName = getFrameSideName,
 incrementFrame = incrementFrame,
 getFrameNumber = getFrameNumber,
 setFrameNumber = setFrameNumber,
 getFrameIncrement = getFrameIncrement,
 setFrameIncrement = setFrameIncrement,
 getSheetInfo = getSheetInfo,
 getSpriteAtlas = getSpriteAtlas,
 getGeometry = getGeometry,

 start = start,
 getCurrentStateName = getCurrentStateName,
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

local new = function(name, sheetInfo, spriteAtlas, geometry)
 local node = njli.Node.create()
 node:setName(name)

 local stateNames = nil
 local stateObjects = nil

 
 
 

 
 

 local action, frameActionName, frameSideName, frameNumber, frameIncrement = createActionValues(getRootName(name))

 

 local properties = 
 {
 instanceName = name,
 

 node = node,
 stateNames = stateNames,
 stateObjects = stateObjects,
 
 physicsShape = physicsShape,
 action = action,
 frameActionName = frameActionName,
 frameSideName = frameSideName,
 frameNumber = frameNumber,
 frameIncrement = frameIncrement,
 paused = false,
 animationClock = njli.Clock.create(),

 hitFrame = hitFrame,



 sheetInfo = sheetInfo, 
 spriteAtlas = spriteAtlas, 
 geometry = geometry, 
 birdNodeObject = nil,
 
 }

 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
