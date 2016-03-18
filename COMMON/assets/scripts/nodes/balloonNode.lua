local arg={...}

local function getFrameName(rootName, frameNumber)
 local folderName = rootName
 local fileName = folderName .. "_" .. string.format("%.5d", frameNumber)

 return folderName .. "/" .. fileName
end


local function createParticleEmitter(originNode, geometry)

 local particleEmitterNode = njli.Node.create()
 local particleEmitterNodeState = njli.NodeState.create()
 particleEmitterNode:show(getPerspectiveCamera())

 particleEmitterNode:getStateMachine():pushState(particleEmitterNodeState)

 njli.World.getInstance():getScene():getRootNode():addChildNode(particleEmitterNode)
 
 local particleEmitter = njli.ParticleEmitter.create()
 if njli.World.getInstance():getWorldResourceLoader():load("particles/particle_water_splash.pex", particleEmitter) then

 particleEmitterNode:addParticleEmitter(particleEmitter)

 particleEmitter:setup(njli.World.getInstance():getScene():getRootNode(), geometry)
 
 end

 particleEmitterNode:setOrigin(originNode:getOrigin())
 particleEmitter:start()

 particleEmitter:setScale(1)

 return particleEmitterNode, particleEmitterNodeState
end

local pause = function(self)
 
 self.paused = true
 self.pausedVelocity = bullet.btVector3(self.rigidBody:getVelocity())
 self.rigidBody:setVelocity(bullet.btVector3(0,0,0))

 

end

local unPause = function(self)
 self.paused = false
 self.rigidBody:applyForce(self.pausedVelocity, true)
end



local actionUpdate = function(self, action, timeStep)

 if (self.clock:getTimeMilliseconds() / 1000) > (1.0/30.0) then
 self.clock:reset()

 self.frameNumber = self.frameNumber + 1
 if self.frameNumber > 2 then
 self.frameNumber = 0
 end

 self.frameName = getFrameName(self.rootName, self.frameNumber)

 setupSpriteFrame(self.frameName, self.node, self.characterSheetInfo, self.spriteAtlas, self.geometry)
 end

end

local actionComplete = function(self, action)
end

local hide = function(self, camera)
 self.node:hide(camera)
end

local enter = function(self)
 local nodeStateName = self.node:getStateMachine():getState():getName()
 
 if self.nodeStates.display:getName() == nodeStateName then

 self.frameName = getFrameName(self.rootName, self.frameNumber)
 setupSpriteFrame(self.frameName, self.node, self.characterSheetInfo, self.spriteAtlas, self.geometry)

 self.node:runAction(self.animateAction)

 elseif self.nodeStates.pop:getName() == nodeStateName then

 self.sound:play()

 end
end

local update = function(self, timeStep)
 if self.paused then
 return
 end

 local nodeStateName = self.node:getStateMachine():getState():getName()


 if self.nodeStates.display:getName() == nodeStateName then

 if self.node:getOrigin():y() < self.Prm.Projectile.DieY then
 self.node:getStateMachine():pushState(self.nodeStates.pop)
 end

 elseif self.nodeStates.pop:getName() == nodeStateName then

 if not self.sound:isPlaying() then
 self.owner:destroyProjectileNode(self)
 end

 end

end

local exit = function(self)
 local nodeStateName = self.node:getStateMachine():getState():getName()

 if self.nodeStates.display:getName() == nodeStateName then
 elseif self.nodeStates.pop:getName() == nodeStateName then

 

 end
end

local onMessage = function(self, message)
 local nodeStateName = self.node:getStateMachine():getState():getName()
 if self.nodeStates.display:getName() == nodeStateName then
 elseif self.nodeStates.pop:getName() == nodeStateName then
 end
end

local collide = function(self, otherNode, collisionPoint)
 local nodeStateName = self.node:getStateMachine():getState():getName()

 if self.nodeStates.display and self.nodeStates.display:getName() == nodeStateName then
 
 self.node:hide()
 self.rigidBody:setCollisionMask(CollisionMasks.dead)
 self.node:getStateMachine():pushState(self.nodeStates.pop)

 

 elseif self.nodeStates.pop and self.nodeStates.pop:getName() == nodeStateName then
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

 njli.Sound.destroy(self.sound)

 self.node:getStateMachine():pushState(nil)

 self.node:hide()

 if self.particleEmitterNode ~= nil then
 njli.ParticleEmitter.destroy(self.particleEmitterNode:getParticleEmitter())
 njli.ParticleEmitter.destroy(self.particleEmitterNode)
 self.particleEmitterNode = nil
 end

 njli.Clock.destroy(self.clock)
 self.clock = nil

 njli.Action.destroy(self.animateAction)
 self.animateAction = nil

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
 pause = pause,
 unPause = unPause,



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

local new = function(owner, name, characterSheetInfo, spriteAtlas, geometry, particleGeometry)

 local node = njli.Node.create()
 node:setName(name)


 local idx = string.find(name, "/")
 local rootName = string.sub(name, idx + 1)
 local names =
 {
 display = rootName,
 pop = rootName .. "_pop",
 }

 local nodeStates = {}

 for k,v in pairs(names) do
 nodeStates[k] = njli.NodeState.create()
 nodeStates[k]:setName(names[k])
 end

 local rigidBody = njli.PhysicsBodyRigid.create()
 rigidBody:setDynamicPhysics()
 rigidBody:enableHandleCollideCallback()
 rigidBody:setCollisionGroup(CollisionGroups.projectile)
 rigidBody:setCollisionMask(CollisionMasks.projectile)

 local physicsShape = njli.PhysicsShapeCylinder.create()
 physicsShape:setHalfExtentsZ(bullet.btVector3( 4.5, 3, 1 ))
 physicsShape:setMargin(1)

 rigidBody:addPhysicsShape(physicsShape)

 node:addPhysicsBody(rigidBody)

 

 node:getStateMachine():pushState(nodeStates.display)

 local function createAnimateAction()
 local action = njli.Action.create()
 action:setName('animateSprite')
 action:setRepeatForever()
 return action
 end

 local animateAction = createAnimateAction()
 

 local assetPath = njli.ASSET_PATH("scripts/Params.lua")
 
 local Prm = loadfile(assetPath)()

 local clock = njli.Clock.create()
 clock:reset()

 local sound = njli.Sound.create()
 njli.World.getInstance():getWorldResourceLoader():load(_SOUNDPATHS.gameplay.effects.projectile.die, sound)

 local frameName = getFrameName(rootName, 0)

 setupSpriteFrame(frameName, node, characterSheetInfo, spriteAtlas, geometry)

 local properties = 
 {
 node = node,
 nodeStateNames = names,
 nodeStates = nodeStates,
 rigidBody = rigidBody,
 physicsShape = physicsShape,
 animateAction = animateAction,
 frameNumber = 0,

 frameName = frameName,

 rootName = rootName,

 clock = clock,

 sound = sound,

 
 geometry = geometry,
 spriteAtlas = spriteAtlas,
 shader = shader,

 particleGeometry = particleGeometry,

 instanceName = name,
 owner = owner,

 Prm = Prm,

 characterSheetInfo = characterSheetInfo,

 paused = false,
 pausedVelocity = bullet.btVector3(0,0,0),
 
 }

 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
