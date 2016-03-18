

local function getFrameName(rootName, frameAction, frameSide, frameNumber)
    local folderName = rootName .. "_" .. frameAction .. "_" .. frameSide
    local fileName = folderName .. "_" .. string.format("%.5d", frameNumber)

    return folderName .. "/" .. fileName
end

local function createAction()
    local action = njli.Action.create()
    action:setName('ForwardFly')
    action:setRepeatForever()

    local frameAction = "run"
    local frameNumber = 0
    local frameIncrement = 1
    local frameSide = "side"

    return action, frameAction, frameSide, frameNumber, frameIncrement
end

local function createMovingEntity(node)
    local assetPath = njli.ASSET_PATH("scripts/Params.lua")
    
    local Prm = loadfile(assetPath)()

    local maxSpeed = Prm.Dog.MaxSpeed
    local headingVector = njli.btVector3(0.0, 0.0, -1.0)
    local upVector = njli.btVector3(0.0, 1.0, 0.0)
    local turnRate = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber()
    local maxForce = Prm.Dog.MaxForce

    local me = require "steering.MovingEntity"
    local movingEntity = me.new(node, maxSpeed, headingVector, upVector, turnRate, maxForce)

    return movingEntity, Prm
end

local isCaptured = function(self)
    local currentY = self.node:getOrigin():y()
    return currentY > self.params.Dog.CapturedHeight
end


local pushRun = function(self)
	self.node:getStateMachine():pushState(self.nodeStates.run)
end

local pushDazed = function(self)
	self.node:getStateMachine():pushState(self.nodeStates.dazed)
end

local pushCaught = function(self)
	self.node:getStateMachine():pushState(self.nodeStates.caught)
end

local pushReleased = function(self)
	self.node:getStateMachine():pushState(self.nodeStates.released)
end

local pushLand = function(self)
	self.node:getStateMachine():pushState(self.nodeStates.land)
end



local isRunState = function(self)
	return self.nodeStates.run:getName() == self.node:getStateMachine():getState():getName()
end

local isDazedState = function(self)
	return self.nodeStates.dazed:getName() == self.node:getStateMachine():getState():getName()
end

local isCaughtState = function(self)
	return self.nodeStates.caught:getName() == self.node:getStateMachine():getState():getName()
end

local isReleasedState = function(self)
	return self.nodeStates.released:getName() == self.node:getStateMachine():getState():getName()
end

local isLandState = function(self)
	return self.nodeStates.land:getName() == self.node:getStateMachine():getState():getName()
end



local pause = function(self)
    self.paused = true
    self.pausedVelocity = njli.btVector3(self.physicsBody:getVelocity())
    self.physicsBody:setVelocity(njli.btVector3(0,0,0))
end

local unPause = function(self)
    self.paused = false
    self.physicsBody:applyForce(self.pausedVelocity, true)
end

--##############################################################

local actionUpdate = function(self, action, timeStep)
    local node = action:getParent()
    local nodeName = node:getName()
    local nodeStateName = node:getStateMachine():getState():getName()

    if (self.clock:getTimeMilliseconds() / 1000) > (1.0/30.0) then
        self.clock:reset()
        
        self.frameNumber = self.frameNumber + self.frameIncrement
        if self.frameNumber > 8 then
            self.frameNumber = 0
        end

        -- self.frameName = getFrameName(self.rootName, self.frameAction, self.frameSide, self.frameNumber)

        -- self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, self.frameName, false)

        -- local frameIndex = self.characterSheetInfo:getFrameIndex(self.frameName)
        -- local width = self.characterSheetInfo:getSheet().frames[frameIndex].width - 2
        -- local height = self.characterSheetInfo:getSheet().frames[frameIndex].height - 2
        -- local divisor = getGameViewDivisor()
        -- local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
        -- self.node:getGeometry():setDimensions(self.node, dimSprite)

        local frameName = getFrameName(self.rootName, self.frameAction, self.frameSide, self.frameNumber)
        setupSpriteFrame(frameName, self.node, self.characterSheetInfo, self.spriteAtlas, self.geometry)
        self.frameName = frameName

        local AabbMin, AabbMax = self.node:getGeometry():getAabb(self.node)

        AabbMax = AabbMax * self.node:getScale()
        AabbMax:setZ(1.0)
        self.physicsShape:setHalfExtentsZ(AabbMax)
    end
end

local actionComplete = function(self, action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()

    print("enter (" .. nodeName .. "->" .. nodeStateName .. ")")

    if self.nodeStates.spawn:getName() == nodeStateName then
        self.node:runAction(self.action)
        self:pushRun()
    elseif self.nodeStates.run:getName() == nodeStateName then

    	self.node:getPhysicsBody():setCollisionGroup(CollisionGroups.dog)
        self.node:getPhysicsBody():setCollisionMask(CollisionMasks.dog)
        self.node:getPhysicsBody():enableHandleCollideCallback()
        self.node:getPhysicsBody():setKinematicPhysics()

        self.frameAction = "run"
        self.frameIncrement = 1

    	self.movingEntity:getSteeringBehaviors():setFollowPathOn(self.path, self.movingEntity:getSteeringBehaviors().Deceleration.slow)

    elseif self.nodeStates.dazed:getName() == nodeStateName then

    	self.movingEntity:setVelocity(njli.btVector3(0,0,0))
        self.node:getPhysicsBody():setVelocity(njli.btVector3(0,0,0))

        -- self.node:getPhysicsBody():setStaticPhysics()

        self.totalIdleTime = 0

    elseif self.nodeStates.caught:getName() == nodeStateName then

        self.node:getPhysicsBody():setDynamicPhysics()
        self.node:getPhysicsBody():setCollisionMask(CollisionMasks.dogCaught)

    elseif self.nodeStates.released:getName() == nodeStateName then

        self.node:getPhysicsBody():setDynamicPhysics()
        self.movingEntity:setVelocity(njli.btVector3(0,0,0))
        self.node:getPhysicsBody():setVelocity(njli.btVector3(0,0,0))

    elseif self.nodeStates.land:getName() == nodeStateName then
    else
        assert(false, "unaccounted node state")
    end
end

local update = function(self, timeStep)
    if self.paused then
        return
    end

    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()

    -- print("update (" .. nodeName .. "->" .. nodeStateName .. ")")

    self.movingEntity:update(timeStep)
    
    local node = self.node
    local axis = njli.btVector3(0,1,0)
    local angle = njli.btRadians(180)

    -- print(self.movingEntity:getVelocity())
    if self.movingEntity:getVelocity():x() > 0 then
        angle = njli.btRadians(0)
        node:setRotation(njli.btQuaternion(axis, angle))
    elseif self.movingEntity:getVelocity():x() < 0 then
        node:setRotation(njli.btQuaternion(axis, angle))
    end

    if self.nodeStates.spawn:getName() == nodeStateName then
    elseif self.nodeStates.run:getName() == nodeStateName then
    elseif self.nodeStates.dazed:getName() == nodeStateName then
    	self.totalIdleTime = self.totalIdleTime + timeStep

        if self.totalIdleTime > self.params.Dog.DazedTime then
        	self:pushRun()
        end
    elseif self.nodeStates.caught:getName() == nodeStateName then
    elseif self.nodeStates.released:getName() == nodeStateName then
        local point, index = self.path:closestWaypoint(self.node:getOrigin())

        local direction = njli.btVector3(0, -1, 0)
        local magnitude = 6

        self.node:getPhysicsBody():applyForce(direction * magnitude, true)

        if self.node:getOrigin():y() < point:y() then
            self.path:setCurrentWaypointIndex(index)
            self:pushLand()
        end

    elseif self.nodeStates.land:getName() == nodeStateName then
        self:pushRun()
    else
        assert(false, "unaccounted node state")
    end

end

local exit = function(self)
    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()

    -- print("exit (" .. nodeName .. "->" .. nodeStateName .. ")")

    if self.nodeStates.spawn:getName() == nodeStateName then
    elseif self.nodeStates.run:getName() == nodeStateName then
    	self.movingEntity:getSteeringBehaviors():setFollowPathOff()
    elseif self.nodeStates.dazed:getName() == nodeStateName then
    elseif self.nodeStates.caught:getName() == nodeStateName then
    elseif self.nodeStates.released:getName() == nodeStateName then
    elseif self.nodeStates.land:getName() == nodeStateName then
    else
        assert(false, "unaccounted node state")
    end

end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
    local myGroup = self.node:getPhysicsBody():getCollisionGroup()
    local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()
    local nodeStateName = self.node:getStateMachine():getState():getName()
    local otherStateName = otherNode:getStateMachine():getState():getName()

    if bit.band(otherGroup, CollisionGroups.projectile) ~= 0 then
    elseif bit.band(otherGroup, CollisionGroups.bird) ~= 0 then

        if self.nodeStates.spawn:getName() == nodeStateName then
        elseif self.nodeStates.run:getName() == nodeStateName then
            self:pushDazed()
        elseif self.nodeStates.dazed:getName() == nodeStateName then
        elseif self.nodeStates.caught:getName() == nodeStateName then
        elseif self.nodeStates.released:getName() == nodeStateName then
        elseif self.nodeStates.land:getName() == nodeStateName then
        else
            assert(false, "unaccounted node state")
        end

    end
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

    self.node:getStateMachine():pushState(nil)

    njli.Clock.destroy(self.clock)
    self.clock = nil
    
    njli.Action.destroy(self.action)
    self.action = nil

    njli.PhysicsShapeCylinder.destroy(self.physicsShape)
    self.physicsShape = nil

    njli.PhysicsBody.destroy(self.rigidBody)
    self.rigidBody = nil

    njli.Node.destroy(self.node)
    self.node = nil

    for k,v in pairs(self.nodeStates) do
        njli.NodeState.destroy(self.nodeStates[k])
        self.nodeStates[k] = nil
    end
    self.nodeStates = nil

    print("delete (" .. nodeName .. ")")
end

local methods = 
{

	isCaptured = isCaptured,

	pushRun = pushRun,
	pushDazed = pushDazed,
	pushCaught = pushCaught,
	pushReleased = pushReleased,
	pushLand = pushLand,



	isRunState = isRunState,
	isDazedState = isDazedState,
	isCaughtState = isCaughtState,
	isReleasedState = isReleasedState,
	isLandState = isLandState,

    pause = pause,
    unPause = unPause,

--##############################################################

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

local new = function(name, characterSheetInfo, spriteAtlas, geometry, wayPoints)
    print("new (" .. name .. ")")

    

    local node = njli.Node.create()
    node:setName(name)

    node:setScale(0.5)

    local rootName = string.sub(name, string.find(name, "/") + 1)

    local names =
    {
        spawn = rootName .. "_spawn",
        run = rootName .. "_run",
        dazed = rootName .. "_dazed",
        caught = rootName .. "_caught",
        released = rootName .. "_released",
        land = rootName .. "_land",
    }
    local nodeStates = {}

    for k,v in pairs(names) do
        nodeStates[k] = njli.NodeState.create()
        nodeStates[k]:setName(names[k])
    end

    -- node:addGeometry(geometry)

    local physicsBody = njli.PhysicsBodyRigid.create()
    local physicsShape = njli.PhysicsShapeCylinder.create()
    
    physicsShape:setMargin(1)
    physicsBody:addPhysicsShape(physicsShape)

    node:addPhysicsBody(physicsBody)


    local action, frameAction, frameSide, frameNumber, frameIncrement = createAction()

    local Path = require "steering.Path"
    local path = Path.new(wayPoints)
    path:loopOn()

    local movingEntity, params = createMovingEntity(node)

    node:getStateMachine():pushState(nodeStates.spawn)

    njli.World.getInstance():getScene():getRootNode():addChildNode(node)
    
    local frameName = getFrameName(rootName, frameAction, frameSide, frameNumber)

    -- node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas, frameName, false)


    -- local frameIndex = characterSheetInfo:getFrameIndex(frameName)
    -- local width = characterSheetInfo:getSheet().frames[frameIndex].width - 2
    -- local height = characterSheetInfo:getSheet().frames[frameIndex].height - 2
    -- local divisor = getGameViewDivisor()
    -- local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    -- node:getGeometry():setDimensions(node, dimSprite)


    -- node:runAction(action)

    setupSpriteFrame(frameName, node, characterSheetInfo, spriteAtlas, geometry)

    local properties = 
    {
        node = node,
        nodeStates = nodeStates,
        nodeStateNames = names,

        physicsBody = physicsBody,
        physicsShape = physicsShape,

        action = action,
        frameName = frameName,
        frameAction = frameAction,
        frameSide = frameSide,
        frameNumber = frameNumber,
        frameIncrement = frameIncrement,
        path = path,
        movingEntity = movingEntity,
        params = params,

        clock = njli.Clock.create(),

        instanceName = name,
        rootName = rootName,

--Do not DELETE below this comment

        geometry = geometry,
        spriteAtlas = spriteAtlas,
        characterSheetInfo = characterSheetInfo,

        paused = false,
        pausedVelocity = njli.btVector3(0,0,0),

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
