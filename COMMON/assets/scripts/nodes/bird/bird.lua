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

local function createBirdMovingEntity(node, type)
 local assetPath = njli.ASSET_PATH("scripts/Params.lua")

 local movingEntityParams = loadfile(assetPath)()
 local movingEntityParams = movingEntityParams.Bird[type]

 local maxSpeed = movingEntityParams.MaxSpeed
 local headingVector = bullet.btVector3(0.0, 0.0, -1.0)
 local upVector = bullet.btVector3(0.0, 1.0, 0.0)
 local turnRate = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber()
 local maxForce = movingEntityParams.MaxForce

 local me = require "steering.MovingEntity"
 local movingEntity = me.new(node, maxSpeed, headingVector, upVector, turnRate, maxForce)

 return movingEntity, movingEntityParams
end

local function createStateObjects(self)
 self.stateNames = {}
 self.stateObjects = {}

 self:addStateObject("Spawn", require "nodes.bird.states.spawn")
 self:addStateObject("Fly", require "nodes.bird.states.fly")
 self:addStateObject("Pursue", require "nodes.bird.states.pursue")
 self:addStateObject("Hit", require "nodes.bird.states.hit")
 self:addStateObject("Grabbing", require "nodes.bird.states.grabbing")
 self:addStateObject("Grabbed", require "nodes.bird.states.grabbed")

 self:getNode():getPhysicsBody():setLinearFactor(bullet.btVector3(1,1,0))
 self:getNode():getPhysicsBody():setAngularFactor(bullet.btVector3(0,0,1))
 self:getNode():getPhysicsBody():setCollisionGroup(CollisionGroups.bird)
 self:getNode():getPhysicsBody():setCollisionMask(CollisionMasks.bird)
 self:getNode():getPhysicsBody():enableHandleCollideCallback()
 self:getNode():getPhysicsBody():setKinematicPhysics()

 local frameName = getFrameName(self:getNode():getName(), self:getFrameActionName(), self:getFrameSideName(), self:getFrameNumber())
 setupSpriteFrame(frameName, self:getNode(), self:getSheetInfo(), self:getSpriteAtlas(), self:getGeometry())

 

 if self:hasStateObject("Spawn") then
 self:getStateObject("Spawn"):push()
 end

 self.paused = false
end

local createConstraint = function(self)

 

 

 local birdNode = self:getNode()
 local dogNode = self:getDog():getNode()

 
 
 local birdNode_min, birdNode_max = birdNode:getAabb()
 local dogNode_min, dogNode_max = dogNode:getAabb()

 assert(birdNode:getPhysicsBody():isDynamicPhysics(), "bird must be in dynamic physics")
 assert(dogNode:getPhysicsBody():isDynamicPhysics(), "dog must be in dynamic physics")


 
 

 local constraint = njli.PhysicsConstraintPointToPoint.create()
 constraint:setNodes(birdNode, dogNode, 
 bullet.btVector3(0,birdNode_min:y(),0), bullet.btVector3(0,dogNode_max:y() - 3,1))

 self.constraint = constraint

 
 
 

 
end

local releaseDog = function(self)
 if self.constraint ~= nil then
 njli.PhysicsConstraintPointToPoint.destroy(self.constraint)
 self.constraint = nil

 self:getDog():getStateObject("Released"):push()
 end
end

local isBirdInFlockPlayingSound = function(self)
 for k,v in pairs(self.birdFlock) do
 if v:isPlayingSound() then
 return true
 end
 end
 return false
end

local isAllBirdsInFlockInFlyState = function(self)
 for k,v in pairs(self.birdFlock) do
 if not v:getStateObject("Fly"):isIn() then
 return false
 end
 if v:isPursueFlagged() then
 return false
 end
 end
 return true
end

local isPlayingSound = function(self)

 if self.currentSound and self.currentSound:isPlaying() then
 return true
 end

 return false

end

local playDieSound = function(self)

 if self:canPlaySound() then
 math.randomseed( os.time() )
 self.currentSound = self.dieSounds[math.random(1, #self.dieSounds)]
 self.currentSound:play()
 return true
 end

 return false

end

local playTauntSound = function(self)

 if self:canPlaySound() then
 math.randomseed( os.time() )
 self.currentSound = self.tauntSounds[math.random(1, #self.tauntSounds)]
 self.currentSound:play()
 return true
 end

 return false

end

local canPlaySound = function(self)

 if not self:isPlayingSound() then
 if not self:isBirdInFlockPlayingSound() then
 return true
 end
 end
 return false

end

local canPursue = function(self)
 return self:isAllBirdsInFlockInFlyState()
end

local pursue = function(self)
 if self:canPursue() then
 self:getStateObject("Pursue"):push()
 self:enablePursueFlagged(true)
 return true
 end
 return false
end


local setBirdFlock = function(self, birdFlock)
 self.birdFlock = birdFlock
end

local pause = function(self)
 self.paused = true
 self.pausedVelocity = bullet.btVector3(self.physicsBody:getVelocity())
 self.physicsBody:setVelocity(bullet.btVector3(0,0,0))
end

local unPause = function(self)
 self.paused = false
 self.physicsBody:applyForce(self.pausedVelocity, true)
end

local isPaused = function(self)
 return self.paused
end

local getAnimationClock = function(self)
 return self.animationClock
end

local isPursueFlagged = function(self)
 return self.flagAsPursuing
end

local enablePursueFlagged = function(self, enable)
 self.flagAsPursuing = enable
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

local getMovingEntity = function(self)
 assert(self.movingEntity, "self.movingEntity is nil")
 
 return self.movingEntity
end

local getMovingEntityParams = function(self)
 assert(self.movingEntityParams, "self.movingEntityParams is nil")
 
 return self.movingEntityParams
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
 
local getBirdType = function(self)
 assert(self.birdType, "self.birdType is nil")
 
 return self.birdType
end

local getDog = function(self)
 assert(self.dog, "self.dog is nil")
 
 return self.dog
end

local getOwner = function(self)
 assert(self.owner, "self.owner is nil")

 return self.owner
end

local getBeakNodeObject = function(self)
 assert(self.beakNode, "self.dog is nil")
 
 return self.beakNode
end

local start = function(self)

 createStateObjects(self)

 self.physicsBody:setAngularFactor(bullet.btVector3(0.0, 0.0, 0.0))

 self:getBeakNodeObject():setBirdNodeObject(self)
 self:getBeakNodeObject():start()
 self:getBeakNodeObject():getStateObject("Idle"):push()
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

 local frameName = getFrameName(node:getName(), self:getFrameActionName(), self:getFrameSideName(), self:getFrameNumber())
 setupSpriteFrame(frameName, node, self:getSheetInfo(), self:getSpriteAtlas(), self:getGeometry())

 local AabbMin, AabbMax = node:getGeometry():getAabb(node)

 AabbMax = AabbMax * node:getScale()
 AabbMax:setZ(1.0)

 self.physicsShape:setHalfExtentsZ(AabbMax)
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

 

 if self:getNode():getPhysicsBody():isKinematicPhysics() then
 self:getMovingEntity():update(timeStep)
 end

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
 local myGroup = self.node:getPhysicsBody():getCollisionGroup()
 local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()
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

 self.beakNode = nil

 if self.constraint ~= nil then
 njli.PhysicsConstraintPointToPoint.destroy(self.constraint)
 self.constraint = nil
 end

 njli.Clock.destroy(self.animationClock)

 for k,v in pairs(self.dieSounds) do
 njli.Sound.destroy(v)
 end
 self.dieSounds = nil

 for k,v in pairs(self.tauntSounds) do
 njli.Sound.destroy(v)
 end
 self.tauntSounds = nil

 

 njli.Action.destroy(self.action)
 self.action = nil

 njli.PhysicsShapeCylinder.destroy(self.physicsShape)
 self.physicsShape = nil

 njli.PhysicsBodyRigid.destroy(self.physicsBody)
 self.physicsBody = nil

 njli.Node.destroy(self.node)
 self.node = nil

 for k,v in pairs(self.stateObjects) do
 self.stateObjects[k] = nil
 end
 self.stateObjects = nil
end

local methods = 
{
 createConstraint = createConstraint,
 releaseDog = releaseDog,

 isBirdInFlockPlayingSound = isBirdInFlockPlayingSound,
 isAllBirdsInFlockInFlyState = isAllBirdsInFlockInFlyState,
 isPlayingSound = isPlayingSound,
 playDieSound = playDieSound,
 playTauntSound = playTauntSound,
 canPlaySound = canPlaySound,
 canPursue = canPursue,
 pursue = pursue,

 setBirdFlock = setBirdFlock,

 pause = pause,
 unPause = unPause,
 isPaused = isPaused,

 getAnimationClock = getAnimationClock,

 isPursueFlagged = isPursueFlagged,
 enablePursueFlagged = enablePursueFlagged,




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
 getMovingEntity = getMovingEntity,
 getMovingEntityParams = getMovingEntityParams,
 getSheetInfo = getSheetInfo,
 getSpriteAtlas = getSpriteAtlas,
 getGeometry = getGeometry,
 getBirdType = getBirdType,
 getDog = getDog,
 getOwner = getOwner,
 getBeakNodeObject = getBeakNodeObject,

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

local new = function(name, sheetInfo, spriteAtlas, geometry, birdType, dog, owner)
 local node = njli.Node.create()
 node:setName(name)

 local stateNames = nil
 local stateObjects = nil

 local physicsBody = njli.PhysicsBodyRigid.create()
 local physicsShape = njli.PhysicsShapeCylinder.create()
 physicsShape:setMargin(1)

 physicsBody:addPhysicsShape(physicsShape)
 node:addPhysicsBody(physicsBody)

 local action, frameActionName, frameSideName, frameNumber, frameIncrement = createActionValues(getRootName(name))
 local movingEntity, movingEntityParams = createBirdMovingEntity(node, birdType)

 local dieSounds = {}
 local tauntSounds = {}

 for k,v in pairs(_SOUNDPATHS.gameplay.effects.bird[birdType].die) do
 local sound = njli.Sound.create()
 njli.World.getInstance():getWorldResourceLoader():load(v, sound)
 table.insert(dieSounds, sound)
 end

 for k,v in pairs(_SOUNDPATHS.gameplay.effects.bird[birdType].taunt) do
 local sound = njli.Sound.create()
 njli.World.getInstance():getWorldResourceLoader():load(v, sound)
 table.insert(tauntSounds, sound)
 end

 local BirdBeak = require "nodes.birdBeak.birdBeak"
 beakNode = BirdBeak.new(name .. "_mouth", sheetInfo, spriteAtlas, geometry)

 node:addChildNode(beakNode:getNode())
 beakNode:getNode():setOrigin(bullet.btVector3(0,0,-0.01))
 insertNodeObject(beakNode, beakNode:getNode():getName())

 

 local properties = 
 {
 instanceName = name,
 node = node,
 stateNames = stateNames,
 stateObjects = stateObjects,
 physicsBody = physicsBody,
 physicsShape = physicsShape,

 action = action,
 frameActionName = frameActionName,
 frameSideName = frameSideName,
 frameNumber = frameNumber,
 frameIncrement = frameIncrement,

 movingEntity = movingEntity,
 movingEntityParams = movingEntityParams,

 dieSounds = dieSounds,
 tauntSounds = tauntSounds,

 currentSound = nil,

 birdFlock = {},

 paused = false,

 animationClock = njli.Clock.create(),

 beakNode = beakNode,

 flagAsPursuing = false,

 


 sheetInfo = sheetInfo, 
 spriteAtlas = spriteAtlas, 
 geometry = geometry, 
 birdType = birdType,
 dog = dog,
 owner = owner,
 }

 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}


