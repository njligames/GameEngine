local arg={...}
local allStates = nil
local theNode = nil



function createPushDownAction()
    local action = njli.Action.create()
    action:setName('DownAction')
    action:setDuration(.1)
    action:setRepeat(0)
    return action
end

function createPushUpAction()
    local action = njli.Action.create()
    action:setName('UpAction')
    action:setDuration(.1)
    action:setRepeat(0)
    return action
end

function DownActionUpdate(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    -- print(action:getName() .. ' ' .. action:getClassName() .. ' - ' .. step .. ' / ' .. timeLeft .. ' Repeats: ' .. action:getRepeatCount())

    theNode:getStateMachine():pushState(allStates.on)
end

function UpActionUpdate(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    -- print(action:getName() .. ' ' .. action:getClassName() .. ' - ' .. step .. ' / ' .. timeLeft .. ' Repeats: ' .. action:getRepeatCount())

    theNode:getStateMachine():pushState(allStates.off)
end

local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local toggle = function(self)
    if self:isOn() then
        self:off()
    else
        self:on()
    end
end

local isDisabled = function(self)
    return self.node:getStateMachine():getState():getName() == self.nodeStateNames.dis
end

local isOn = function(self)
    return self.node:getStateMachine():getState():getName() == self.nodeStateNames.on
end

local on = function(self)
    if not self:isOn() and not self:isDisabled()then
        self.node:getStateMachine():pushState(self.nodeStates.on)
    end
end

local off = function(self)
    if self:isOn() then
        self.node:getStateMachine():pushState(self.nodeStates.off)
    end
end

local disable = function(self)
    self.node:getStateMachine():pushState(self.nodeStates.dis)
end

local getRect = function(self)
    local name = self.nodeStates.off:getName()--self.node:getStateMachine():getState():getName()
    return self.spriteAtlas:getFrame(name)
end

----------------------------------------------

local enter = function(self)
	local nodeStateName = self.node:getStateMachine():getState():getName()
	self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, nodeStateName, true)
    local dimSprite = self.node:getGeometry():getDimensions(self.node)
	local d = bullet.btVector2( (dimSprite:x() * self.menuScale), (dimSprite:y() * self.menuScale) )
	self.node:getGeometry():setDimensions(self.node, d)

    -- self.node:show(getOrthoCamera())

    self.physicsShape:setHalfExtends(bullet.btVector3( (dimSprite:x() * self.menuScale) * .25, (dimSprite:y() * self.menuScale)* .25, 1 ))

end

local update = function(self, timeStep)
    local nodeStateName = self.node:getStateMachine():getState():getName()

    if self.toggler then
        if self.justSwitchedTouched then
            self:toggle()
            self.justSwitchedTouched = false
        end
    else
        if not self.node:isTouched() then
            self:off()
        elseif self.node:isTouched() then
            self:on()
        end
    end

end

local exit = function(self)
    local nodeStateName = self.node:getStateMachine():getState():getName()
end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
end

local near = function(self, otherNode)
end

local touchDown = function(self, rayContact)
    self.justSwitchedTouched = true
    self.sound:play()
end

local touchUp = function(self, rayContact)
    if not self:isDisabled() then
        self.fun()
    end
end

local touchMove = function(self, rayContact)
end

local touchCancelled = function(self, rayContact)
end

local delete = function(self)
    
    njli.Sound.destroy(self.sound)
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
    toggle = toggle,
    isDisabled = isDisabled,
    isOn = isOn,
    on = on,
    off = off,
    disable = disable,
    getRect = getRect,
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

local new = function(name, root, geometry, spriteAtlas, scale, fun, toggler, soundPath, disabled)
	local node = njli.Node.create()
    node:setName(name)

    local names =
    {
    	off = "butn_" .. root .. "_off",
    	on = "butn_" .. root .. "_on",
        dis = "butn_" .. root .. "_dis",
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

    if disabled then
        node:getStateMachine():pushState(nodeStates.dis)
    else
        node:getStateMachine():pushState(nodeStates.off)
    end

    

    local sound = njli.Sound.create()

    njli.World.getInstance():getWorldResourceLoader():load(soundPath, sound)

    local properties = 
    {
    	node = node,
    	nodeStates = nodeStates,
        nodeStateNames = names,
        rigidBody = rigidBody,
        physicsShape = physicsShape,
    	spriteAtlas = spriteAtlas,
    	menuScale = scale,
        fun = fun,
        toggler = toggler,
        isTouched = false,
        justSwitchedTouched = false,

        instanceName = name,

        sound = sound,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
