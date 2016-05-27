

local function getRootName(name)
  return string.sub(name, string.find(name, "/") + 1)
end

local function getFrameName(name, frameAction, frameSide, frameNumber, color)
    local folderName = getRootName(name) .. color .. "_" .. frameAction .. "_" .. frameSide
    local fileName = folderName .. "_" .. string.format("%.5d", frameNumber)

    local frameName = folderName .. "/" .. fileName

    return frameName
end

local function createActionValues()
    local action = njli.Action.create()
    action:setName('animateSprite')
    action:setRepeatForever()

    local frameActionName = "thrown"
    local frameNumber = 0
    local frameIncrement = 1
    local frameSideName = "front"

    return action, frameActionName, frameSideName, frameNumber, frameIncrement
end

local function createStateObjects(self)
  self.stateNames = {}
  self.stateObjects = {}

  self:addStateObject("Hit",    require "nodes.projectile.balloon.states.hit")
  self:addStateObject("Thrown", require "nodes.projectile.balloon.states.thrown")

  self:getNode():getPhysicsBody():setDynamicPhysics()
  self:getNode():getPhysicsBody():enableHandleCollideCallback()
  self:getNode():getPhysicsBody():setCollisionGroup(CollisionGroups.projectile)
  self:getNode():getPhysicsBody():setCollisionMask(CollisionMasks.projectile)

  self.physicsShape:setHalfExtentsZ(bullet.btVector3( 4.5, 3, 1 ))
  
  local frameName = getFrameName(self:getNode():getName(), self:getFrameActionName(), self:getFrameSideName(), self:getFrameNumber(), self:getColor())
  setupSpriteFrame(frameName, self:getNode(), self:getSheetInfo(), self:getSpriteAtlas(), self:getGeometry())

  -- njli.World.getInstance():getScene():getRootNode():addChildNode(self:getNode())

  if self:hasStateObject("Thrown") then
    self:getStateObject("Thrown"):push()
  end

  self.paused = false
end

local setFPS = function(self, fps)
    assert(fps>=1 and fps<=60)
    self.fps = fps
end

local getColor = function(self)
  return self.color
end

local getOwner = function(self)
  assert(self.owner, "self.owner is nil")
  
  return self.owner
end

local getSound = function(self)
  assert(self.sound, "self.sound is nil")
  
  return self.sound
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
  if self:getFrameNumber() > 2 then
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

local getParams = function(self)
  return self.params
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
  self:setFPS(self.params.FramesPerSecond)

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

    if (self:getAnimationClock():getTimeMilliseconds() / 1000) > (1.0/self.fps) then
      self:getAnimationClock():reset()

      self:incrementFrame()

      local frameName = getFrameName(node:getName(), self:getFrameActionName(), self:getFrameSideName(), self:getFrameNumber(), self:getColor())
      setupSpriteFrame(frameName, node, self:getSheetInfo(), self:getSpriteAtlas(), self:getGeometry())

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

        brightnessForNode(self.node)
        self.node:setColorTransform(self.node:getColorTransform() * self.hueTransform)
        
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
  njli.Sound.destroy(self.sound)

  self:getNode():getStateMachine():pushState(nil)
  
  njli.Clock.destroy(self.animationClock)

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
    setFPS = setFPS,
  getColor = getColor,
  getOwner = getOwner,
  getSound = getSound,

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
  getParams = getParams,
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

local new = function(name, sheetInfo, spriteAtlas, geometry, particleGeometry, owner)
  local node = njli.Node.create()
  node:setName(name)

  local physicsBody = njli.PhysicsBodyRigid.create()
  local physicsShape = njli.PhysicsShapeCylinder.create()
  physicsShape:setMargin(1)

  physicsBody:addPhysicsShape(physicsShape)
  node:addPhysicsBody(physicsBody)

  local action, frameActionName, frameSideName, frameNumber, frameIncrement = createActionValues(getRootName(name))

  local assetPath = njli.ASSET_PATH("scripts/Params.lua")
  local params = loadfile(assetPath)().Projectile.WaterBalloon

  local fps = params.FramesPerSecond

  assert(params.ScaleMin <= params.ScaleMax)
  --local randomScale = math.random(params.ScaleMin, params.ScaleMax)
  --local randomScale = params.ScaleMax
  --local randomScale = params.ScaleMin
  math.randomseed(os.time())
  local randomScale = params.ScaleMin + math.random()  * (params.ScaleMax - params.ScaleMin)
  print("new scale", randomScale)
  node:setScale(randomScale)
  local animationClock = njli.Clock.create()

  local sound = njli.Sound.create()
  njli.World.getInstance():getWorldResourceLoader():load(_SOUNDPATHS.gameplay.effects.projectile.balloon.die, sound)

  math.randomseed( os.time() )
  --local colorIndex = math.random(1, 5)

  local color = "Red"


  math.randomseed(os.time())
  local idx = math.random(1, #params.Hues)
  print("rotate hue to:", params.Hues[idx])
  local hueTransform = njli.ColorUtil.createHueRotationMatrix(params.Hues[idx])
  --node:setColorTransform(transform)

  --if colorIndex == 1 then
  --    color = "Blue"
  --elseif colorIndex == 2 then
  --    color = "Green"
  --elseif colorIndex == 3 then
  --    color = "Purple"
  --elseif colorIndex == 4 then
  --    color = "Red"
  --elseif colorIndex == 5 then
  --    color = "Yellow"
  --end
  

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

    paused = false,

    params = params,
    fps = fps,

    animationClock = animationClock,

    sound = sound,

    color = color,
    hueTransform = hueTransform,
--Shared
    sheetInfo = sheetInfo, 
    spriteAtlas = spriteAtlas, 
    geometry = geometry,
    owner = owner,
  }

  return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}


