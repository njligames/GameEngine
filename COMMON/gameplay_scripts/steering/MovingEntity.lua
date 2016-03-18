


--- Get the velocity of this moving entity
-- @return The MovingEntity's velocity of type: bullet.btVector3
local getVelocity = function(self)
    return self.vVelocity
end

local setVelocity = function(self, velocity) 
    self.vVelocity = velocity
end

-- local applyVelocity = function(self, velocity)
--     self.node:getPhysicsBody():applyForce(velocity, true)
-- end

--- Get the mass of this moving entity
-- @return The mass of this moving entity of type: number
local getMass = function(self)
    return self.node:getPhysicsBody():getMass()
end

--- Get the position of this moving entity
-- @return The origin of this entity of type: bullet.btVector3
local getPos = function(self)
    return self.node:getWorldTransform():getOrigin()
end

--- Set the position of this moving entity
-- @return The origin of this entity of type: bullet.btVector3
local setPos = function(self, pos)
    return self.node:setOrigin(pos)
end

--- Get the side vector of this moving entity
-- @return The MovingEntity's side vector of type: bullet.btVector3
local getSideVector = function(self)
    return self.sideVector
end

--- Get the maximum speed of this moving entity
-- @return The MovingEntity's maximum speed of type: number
local getMaxSpeed = function(self)
    return self.maxSpeed
end

--- Set the maximum speed of this moving entity
-- @param maxSpeed The MovingEntity's maximum speed of type: number
local setMaxSpeed = function(self, maxSpeed)
    self.maxSpeed = maxSpeed
end

--- Get the velocity of this moving entity
-- @return The MovingEntity's maximum force of type: number
local getMaxForce = function(self)
    return self.maxForce
end

--- Get the velocity of this moving entity
-- @param maxForce The MovingEntity's maximum force of type: number
local setMaxForce = function(self, maxForce)
    self.maxForce = maxForce
end

--- Determine if the speed has maxed out
-- @return true if the speed is maxed out, false otherwise.
local isSpeedMaxedOut = function(self)
    local maxSpeedSq = (self.maxSpeed * self.maxSpeed)
    return (maxSpeedSq >= self:getVelocity():length2())
end

--- Get the current speed of this moving entity
-- @return The MovingEntity's current speed of type: number
local getSpeed = function(self)
    return self:getVelocity():length()
end

--- Get the current speed squared of this moving entity
-- @return The MovingEntity's current speed squared of type: number
local getSpeedSq = function(self)
    return self:getVelocity():length2()
end

--- Get the normalized heading vector of this moving entity
-- @return The MovingEntity's normalized heading vector of type: bullet.btVector3
local getHeadingVector = function(self)
    return self.headingVector
end

--- Set the heading vector of this moving entity
-- @param heading The MovingEntity's heading vector of type: bullet.btVector3
local setHeadingVector = function(self, heading)

    assert( (heading:length2() - 1.0) < 0.00001, "")

    self.headingVector = heading

    self.sideVector = self.headingVector:cross(self.upVector)

end

--- Rotate this MovingEntity heading to face the target.
-- @param target The position to rotate this entity to of type: bullet.btVector3
local rotateHeadingVectorToFacePosition = function(self, target)
    assert(false, "not implemented...")
end

--- Get the max turn rate of this moving entity
-- @return The max turn rate of this entity of type: number
local getMaxTurnRate = function(self)
    return self.maxTurnRate
end

--- Set the max turn rate of this moving entity
-- @param maxTurnRate The max turn rate of this entity of type: number
local setMaxTurnRate = function(self, maxTurnRate)
    self.maxTurnRate = maxTurnRate
end


local getSmoothedHeading = function(self)
    return self.smoothedHeading
end

local isSmoothingOn = function(self)
    return self.smoothingOn
end

local smoothingOn = function(self)
    self.smoothingOn = true
end

local smoothingOff = function(self)
    self.smoothingOn = false
end

local toggleSmoothing = function(self)
    self.smoothingOn = not self.smoothingOn
end

local update = function(self, timeStep)
    if not njli.World.getInstance():getScene():getPhysicsWorld():isPaused() then
        local oldPos = self:getPos()

        local steeringForce = bullet.btVector3(0, 0, 0)

        steeringForce = self:getSteeringBehaviors():calculate()
        -- print(string.format("steeringForce %s", steeringForce))

        local acceleration = steeringForce / self:getMass()
        -- print(string.format("acceleration %s", acceleration))

        self:setVelocity(self:getVelocity() + acceleration * timeStep)
        -- print(string.format("velocity %s", self:getVelocity()))

        self:setVelocity(Truncate(self:getVelocity(), self:getMaxSpeed()))
        -- print(string.format("truncate-velocity %s\n", self:getVelocity()))

        local newPos = self:getPos() + self:getVelocity() * timeStep
        -- print(string.format("newPos %s", newPos))
        
        self:setPos(newPos)

        if self:getVelocity():length() > 0.00000001 then
            self:setHeadingVector(self:getVelocity():normalized())
        end

        if self:isSmoothingOn() then
            --m_vSmoothedHeading = m_pHeadingSmoother->Update(Heading());
        end
    end


    

end

local getSteeringBehaviors = function(self)
    if self.steeringBehavior == nil then
        local SB = require "steering.SteeringBehaviors"
        self.steeringBehavior = SB.new(self)
    end
    return self.steeringBehavior
end

local setTagged = function(self, tagged)
    self.tagged = tagged
end

local isTagged = function(self)
    return self.tagged
end




local delete = function(self)
    --TODO: clean up memory
end

local methods = 
{
    --TODO: Add functions here...

    getVelocity = getVelocity,
    setVelocity = setVelocity,
    -- applyVelocity = applyVelocity,
    getMass = getMass,
    getPos = getPos,
    setPos = setPos,
    getSideVector = getSideVector,
    getMaxSpeed = getMaxSpeed,
    setMaxSpeed = setMaxSpeed,
    getMaxForce = getMaxForce,
    setMaxForce = setMaxForce,
    isSpeedMaxedOut = isSpeedMaxedOut,
    getSpeed = getSpeed,
    getSpeedSq = getSpeedSq,
    getHeadingVector = getHeadingVector,
    setHeadingVector = setHeadingVector,
    rotateHeadingVectorToFacePosition = rotateHeadingVectorToFacePosition,
    maxTurnRate = maxTurnRate,
    setMaxTurnRate = setMaxTurnRate,


    getSmoothedHeading = getSmoothedHeading,
    isSmoothingOn = isSmoothingOn,
    smoothingOn = smoothingOn,
    smoothingOff = smoothingOff,
    toggleSmoothing = toggleSmoothing,
    update = update,

    getSteeringBehaviors = getSteeringBehaviors,

    setTagged = setTagged,
    isTagged = isTagged,

    __gc = delete
}

local new = function(node, maxSpeed, headingVector, upVector, turnRate, maxForce)
    --TODO: Implement the constructor for this object.

    local node = node
    local maxSpeed = maxSpeed
    local headingVector = headingVector
    local upVector = upVector
    local maxTurnRate = turnRate
    local maxForce = maxForce

    local headingSmoother = {}
    local smoothedHeading = bullet.btVector3(0,0,0)
    local smoothingOn = true

    local properties = 
    {
        --TODO: Add variables here...
        node = node,
        maxSpeed = maxSpeed,
        headingVector = headingVector,
        upVector = upVector,
        sideVector = headingVector:cross(upVector),
        maxTurnRate = maxTurnRate,
        maxForce = maxForce,

        headingSmoother = headingSmoother,
        smoothedHeading = smoothedHeading,
        smoothingOn = smoothingOn,

        steeringBehavior = nil,

        vVelocity = bullet.btVector3(0, 0, 0),

        tagged = false,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}