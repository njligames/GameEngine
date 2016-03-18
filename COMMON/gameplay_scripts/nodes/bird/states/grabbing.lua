local function getRootName(name)
  return string.sub(name, string.find(name, "/") + 1)
end

local function getFrameName(name, frameAction, frameSide, frameNumber)
    local folderName = getRootName(name) .. "_" .. frameAction .. "_" .. frameSide
    local fileName = folderName .. "_" .. string.format("%.5d", frameNumber)

    return folderName .. "/" .. fileName
end

--##############################################################

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
    -- print(self:getNodeState():getName() .. " actionUpdate for " .. self:getNodeObject():getNode():getName())
end

local actionComplete = function(self, action)
    -- print(self:getNodeState():getName() .. " actionComplete for " .. self:getNodeObject():getNode():getName())
end

local enter = function(self)
    -- print(self:getNodeState():getName() .. " enter for " .. self:getNodeObject():getNode():getName())

    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    nodeObject:setFrameActionName("grab")
    nodeObject:setFrameIncrement(1)

    nodeObject:getMovingEntity():setVelocity(bullet.btVector3(0,0,0))
    node:getPhysicsBody():setVelocity(bullet.btVector3(0,0,0))

    node:getPhysicsBody():setCollisionMask(CollisionMasks.birdGrabbing)
    node:getPhysicsBody():setDynamicPhysics()

    nodeObject:getBeakNodeObject():getNode():hide(getPerspectiveCamera())
    
    local frameName = getFrameName(nodeObject:getNode():getName(), nodeObject:getFrameActionName(), nodeObject:getFrameSideName(), nodeObject:getFrameNumber())
    setupSpriteFrame(frameName, nodeObject:getNode(), nodeObject:getSheetInfo(), nodeObject:getSpriteAtlas(), nodeObject:getGeometry())
end

local update = function(self, timeStep)
    -- print(self:getNodeState():getName() .. " update for " .. self:getNodeObject():getNode():getName())

    local nodeObject = self:getNodeObject()

    if not nodeObject:getDog():getStateObject("Caught"):isIn() then
        nodeObject:getDog():getStateObject("Caught"):push()
    else
        nodeObject:createConstraint()
        self:getNodeObject():getStateObject("Grabbed"):push()
    end
end

local exit = function(self)
    -- print(self:getNodeState():getName() .. " exit for " .. self:getNodeObject():getNode():getName())
end

local onMessage = function(self, message)
    -- print(self:getNodeState():getName() .. " onMessage for " .. self:getNodeObject():getNode():getName())
end

local render = function(self)
    -- print(self:getNodeState():getName() .. " render for " .. self:getNodeObject():getNode():getName())
end

local collide = function(self, otherNode, collisionPoint)
    -- print(self:getNodeState():getName() .. " collide for " .. self:getNodeObject():getNode():getName())
    
    local myGroup = self:getNodeObject():getNode():getPhysicsBody():getCollisionGroup()
    local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()

    if bit.band(otherGroup, CollisionGroups.projectile) ~= 0 then
        self:getNodeObject():getStateObject("Hit"):push()
    elseif bit.band(otherGroup, CollisionGroups.dog) ~= 0 then
    end
end

local near = function(self, otherNode)
    -- print(self:getNodeState():getName() .. " near for " .. self:getNodeObject():getNode():getName())
end

local touchDown = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchDown for " .. self:getNodeObject():getNode():getName())
end

local touchUp = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchUp for " .. self:getNodeObject():getNode():getName())
end

local touchMove = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchMove for " .. self:getNodeObject():getNode():getName())
end

local touchCancelled = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchCancelled for " .. self:getNodeObject():getNode():getName())
end

local delete = function(self)
    njli.NodeState.destroy(self:getNodeState())
end

local methods = 
{
    
    --##############################################################

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

--shared

        nodeObject = nodeObject,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
