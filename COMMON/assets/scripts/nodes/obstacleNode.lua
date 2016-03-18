local arg={...}

local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local setScaleFactor = function(self, scale)
 self.scaleFactor = scale
end

local hide = function(self, camera)
 self.node:hide(camera)
end

local enter = function(self)

 local nodeStateName = self.node:getStateMachine():getState():getName()
 self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, nodeStateName, false)
end

local update = function(self, timeStep)
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

 
 self.node:getStateMachine():pushState(nil)

 njli.PhysicsShape.destroy(self.physicsShape)
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
end

local methods = 
{
 actionUpdate = actionUpdate,
 actionComplete = actionComplete,
 setScaleFactor = setScaleFactor,
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

local new = function(name, spriteAtlas, geometry)

 local node = njli.Node.create()
 node:setName(name)

 local idx = string.find(name, "/")

 local names =
 {
 display = string.sub(name, idx + 1),
 }
 
 
 
 local nodeStates = {}

 for k,v in pairs(names) do
 nodeStates[k] = njli.NodeState.create()
 nodeStates[k]:setName(names[k])
 end

 node:addGeometry(geometry)
 
 local rigidBody = njli.PhysicsBodyRigid.create()
 rigidBody:setStaticPhysics()

 rigidBody:setCollisionGroup(CollisionGroups.tile)
 rigidBody:setCollisionMask(CollisionMasks.tile)

 local physicsShape = njli.PhysicsShapeBox.create()
 physicsShape:setMargin(1)
 

 rigidBody:addPhysicsShape(physicsShape)

 node:addPhysicsBody(rigidBody)

 

 node:getStateMachine():pushState(nodeStates.display)

 local properties = 
 {
 node = node,
 nodeStateNames = names,
 nodeStates = nodeStates,
 rigidBody = rigidBody,
 physicsShape = physicsShape,

 
 geometry = geometry,
 spriteAtlas = spriteAtlas,

 instanceName = name,
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
