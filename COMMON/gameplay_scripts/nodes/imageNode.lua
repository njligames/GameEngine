local arg={...}

local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local shouldScale = function(self)
    return self.toScale
end

local setScale = function(self, scale)
    self.menuScale = scale
end

local enter = function(self)
	local nodeStateName = self.node:getStateMachine():getState():getName()
	self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, nodeStateName, true)
    self.dimSprite = self.node:getGeometry():getDimensions(self.node)
	local d = bullet.btVector2( (self.dimSprite:x() * self.menuScale), (self.dimSprite:y() * self.menuScale) )
	self.node:getGeometry():setDimensions(self.node, d)
    -- self.node:show(getOrthoCamera())
end

local update = function(self, timeStep)
    local d = bullet.btVector2( (self.dimSprite:x() * self.menuScale), (self.dimSprite:y() * self.menuScale) )
    self.node:getGeometry():setDimensions(self.node, d)
end

local exit = function(self)
end

local onMessage = function(self, message)
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

    -- self:exit()
    self.node:getStateMachine():pushState(nil)

    njli.PhysicsShape.destroy(self.physicsShape)
    self.physicsShape = nil

    njli.PhysicsBody.destroy(self.rigidBody)
    self.rigidBody = nil

    for k,v in pairs(self.nodeStates) do
        njli.NodeState.destroy(self.nodeStates[k])
        self.nodeStates[k] = nil
    end
    self.nodeStates = nil

    njli.Node.destroy(self.node)
    self.node = nil
end

local methods = 
{
    actionUpdate = actionUpdate,
    actionComplete = actionComplete,
    shouldScale = shouldScale,
    setScale = setScale,
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

local new = function(name, geometry, spriteAtlas)
	local node = njli.Node.create()
    node:setName(name)

    local names =
    {
    	display = name,
	}
    local nodeStates = {}

    for k,v in pairs(names) do
    	nodeStates[k] = njli.NodeState.create()
    	nodeStates[k]:setName(names[k])
    end

    node:addGeometry(geometry)
    
    local rigidBody = njli.PhysicsBodyRigid.create()
    rigidBody:setStaticPhysics()

    local physicsShape = njli.PhysicsShapeBox.create()
    rigidBody:addPhysicsShape(physicsShape)

    node:addPhysicsBody(rigidBody)

    local dimScreen = njli.World.getInstance():getViewportDimensions()

    node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas, name, true)
    local dimSprite = node:getGeometry():getDimensions(node)

    local scale = 1
    local xscale = dimScreen:x() / dimSprite:x()
    local yscale = dimScreen:y() / dimSprite:y()

    if xscale > yscale then
        scale = xscale
    else
        scale = yscale
    end

    node:getStateMachine():pushState(nodeStates.display)

    local properties = 
    {
    	node = node,
    	nodeStates = nodeStates,
        nodeStateNames = names,
        rigidBody = rigidBody,
        geometry = geometry,
        physicsShape = physicsShape,
    	spriteAtlas = spriteAtlas,
        menuScale = 1,
        dimSprite = nil,
        toScale = scale * 2.0,

        instanceName = name,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
