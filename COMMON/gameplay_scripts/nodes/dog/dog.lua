

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
    action:setName('run')
    action:setRepeatForever()

    local frameActionName = "run"
    local frameNumber = 0
    local frameIncrement = 1
    local frameSideName = "side"

    return action, frameActionName, frameSideName, frameNumber, frameIncrement
end

local function createStateObjects(self)
  self.stateNames = {}
  self.stateObjects = {}

  self:addStateObject("Caught",   require "nodes.dog.states.caught")
  self:addStateObject("Dazed",    require "nodes.dog.states.dazed")
  self:addStateObject("Land",     require "nodes.dog.states.land")
  self:addStateObject("Released", require "nodes.dog.states.released")
  self:addStateObject("Run",      require "nodes.dog.states.run")
  self:addStateObject("Spawn",    require "nodes.dog.states.spawn")

  local frameName = getFrameName(self:getNode():getName(), self:getFrameActionName(), self:getFrameSideName(), self:getFrameNumber())
  setupSpriteFrame(frameName, self:getNode(), self:getSheetInfo(), self:getSpriteAtlas(), self:getGeometry())

  -- njli.World.getInstance():getScene():getRootNode():addChildNode(self:getNode())

  if self:hasStateObject("Spawn") then
    self:getStateObject("Spawn"):push()
  end

  self.paused = false
end

local function createDogMovingEntity(node, type)
    local assetPath = njli.ASSET_PATH("scripts/Params.lua")

    local movingEntityParams = loadfile(assetPath)()
    local movingEntityParams = movingEntityParams.Dog

    local maxSpeed = movingEntityParams.MaxSpeed
    local headingVector = bullet.btVector3(0.0, 0.0, -1.0)
    local upVector = bullet.btVector3(0.0, 1.0, 0.0)
    local turnRate = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber()
    local maxForce = movingEntityParams.MaxForce

    local me = require "steering.MovingEntity"
    local movingEntity = me.new(node, maxSpeed, headingVector, upVector, turnRate, maxForce)

    return movingEntity, movingEntityParams
end

local isCaptured = function(self)
    local currentY = self:getNode():getOrigin():y()
    return currentY > self:getMovingEntityParams().CapturedHeight
end

local getPath = function(self)
  assert(self.path, "self.path is nil.")

  return self.path
end

local run = function(self)
  local hasConstraint = self:getNode():getPhysicsBody():hasPhysicsConstraint()

  if not hasConstraint then
    self:getStateObject("Run"):push()
  end
end

--##############################################################

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
  assert(self.animationClock, "self.animationClock is nil")

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

local getBeakNodeObject = function(self)
  assert(self.beakNode, "self.dog is nil")
  
  return self.beakNode
end

local start = function(self)

  createStateObjects(self)

  self.physicsBody:setAngularFactor(bullet.btVector3(0.0, 0.0, 0.0))
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

    local axis = bullet.btVector3(0,1,0)
    local angle = bullet.btRadians(180)
    if self:getMovingEntity():getVelocity():x() > 0 then
        angle = bullet.btRadians(0)
        self:getNode():setRotation(bullet.btQuaternion(axis, angle))
        -- print(bullet.btQuaternion(axis, angle))
    elseif self:getMovingEntity():getVelocity():x() < 0 then
        self:getNode():setRotation(bullet.btQuaternion(axis, angle))
        -- print(bullet.btQuaternion(axis, angle))
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
  
  njli.Clock.destroy(self.animationClock)

  -- self.movingEntity = nil

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
  isCaptured = isCaptured,
  getPath = getPath,

  run = run,

--##############################################################

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
  getMovingEntity = getMovingEntity,
  getMovingEntityParams = getMovingEntityParams,
  getSheetInfo = getSheetInfo,
  getSpriteAtlas = getSpriteAtlas,
  getGeometry = getGeometry,
  getBirdType = getBirdType,
  getDog = getDog,
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

local new = function(name, sheetInfo, spriteAtlas, geometry, wayPoints)
  local node = njli.Node.create()
  node:setName(name)

  node:setScale(0.5)

  local physicsBody = njli.PhysicsBodyRigid.create()

  local physicsShape = njli.PhysicsShapeCylinder.create()
  physicsShape:setMargin(1)

  physicsBody:addPhysicsShape(physicsShape)
  node:addPhysicsBody(physicsBody)

  local action, frameActionName, frameSideName, frameNumber, frameIncrement = createActionValues(getRootName(name))
  local movingEntity, movingEntityParams = createDogMovingEntity(node, birdType)

  local Path = require "steering.Path"
  local path = Path.new(wayPoints)
  path:loopOn()

  local properties = 
  {
    instanceName = name,
    node = node,
    stateNames = nil,
    stateObjects = nil,
    physicsBody = physicsBody,
    physicsShape = physicsShape,

    action = action,
    frameActionName = frameActionName,
    frameSideName = frameSideName,
    frameNumber = frameNumber,
    frameIncrement = frameIncrement,

    movingEntity = movingEntity,
    movingEntityParams = movingEntityParams,
    paused = false,
    animationClock = njli.Clock.create(),

    path = path,

--Shared
    sheetInfo = sheetInfo, 
    spriteAtlas = spriteAtlas, 
    geometry = geometry,
  }

  return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}


