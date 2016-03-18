--##############################################################

local getNodeState = function(self)
    assert(self.nodeState, "self.nodeState is nil.")

    return self.nodeState
end

local getNodeObject = function(self)
    assert(self.nodeObject, "self.nodeObject is nil.")
    
    return self.nodeObject
end

local push = function(self)
    -- assert(self:getNodeObject(), "self:getNodeObject() must not be nil in " .. self:getNodeState():getName())

    self:getNodeObject():getNode():getStateMachine():pushState(self:getNodeState())
end

local isIn = function(self)
    -- assert(self:getNodeObject(), "self:getNodeObject() must not be nil in " .. self:getNodeState():getName())

    return self:getNodeState():getName() == self:getNodeObject():getNode():getStateMachine():getState():getName()
end

local actionUpdate = function(self, action, timeStep)
    -- print(self:getNodeState():getName() .. " actionUpdate for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local actionComplete = function(self, action)
    -- print(self:getNodeState():getName() .. " actionComplete for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local enter = function(self)
    -- print(self:getNodeState():getName() .. " enter for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()


    node:getPhysicsBody():setCollisionGroup(CollisionGroups.dog)
    node:getPhysicsBody():setCollisionMask(CollisionMasks.dog)
    node:getPhysicsBody():enableHandleCollideCallback()
    node:getPhysicsBody():setKinematicPhysics()

    nodeObject:setFrameActionName("run")
    nodeObject:setFrameIncrement(1)

    nodeObject:getMovingEntity():getSteeringBehaviors():setFollowPathOn(nodeObject:getPath(), nodeObject:getMovingEntity():getSteeringBehaviors().Deceleration.slow)


end

local update = function(self, timeStep)
    -- print(self:getNodeState():getName() .. " update for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local exit = function(self)
    -- print(self:getNodeState():getName() .. " exit for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    nodeObject:getMovingEntity():getSteeringBehaviors():setFollowPathOff()
end

local onMessage = function(self, message)
    -- print(self:getNodeState():getName() .. " onMessage for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local render = function(self)
    -- print(self:getNodeState():getName() .. " render for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local collide = function(self, otherNode, collisionPoint)
    -- print(self:getNodeState():getName() .. " collide for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    nodeObject:getStateObject("Dazed"):push()
end

local near = function(self, otherNode)
    -- print(self:getNodeState():getName() .. " near for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local touchDown = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchDown for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local touchUp = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchUp for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local touchMove = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchMove for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
end

local touchCancelled = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchCancelled for " .. self:getNodeObject():getNode():getName())
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
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
