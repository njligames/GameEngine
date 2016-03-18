




local getVelocity = function(self)
 return self.vVelocity
end

local setVelocity = function(self, velocity) 
 self.vVelocity = velocity
end







local getMass = function(self)
 return self.node:getPhysicsBody():getMass()
end



local getPos = function(self)
 return self.node:getWorldTransform():getOrigin()
end



local setPos = function(self, pos)
 return self.node:setOrigin(pos)
end



local getSideVector = function(self)
 return self.sideVector
end



local getMaxSpeed = function(self)
 return self.maxSpeed
end



local setMaxSpeed = function(self, maxSpeed)
 self.maxSpeed = maxSpeed
end



local getMaxForce = function(self)
 return self.maxForce
end



local setMaxForce = function(self, maxForce)
 self.maxForce = maxForce
end



local isSpeedMaxedOut = function(self)
 local maxSpeedSq = (self.maxSpeed * self.maxSpeed)
 return (maxSpeedSq >= self:getVelocity():length2())
end



local getSpeed = function(self)
 return self:getVelocity():length()
end



local getSpeedSq = function(self)
 return self:getVelocity():length2()
end



local getHeadingVector = function(self)
 return self.headingVector
end



local setHeadingVector = function(self, heading)

 assert( (heading:length2() - 1.0) < 0.00001, "")

 self.headingVector = heading

 self.sideVector = self.headingVector:cross(self.upVector)

end



local rotateHeadingVectorToFacePosition = function(self, target)
 assert(false, "not implemented...")
end



local getMaxTurnRate = function(self)
 return self.maxTurnRate
end



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
 

 local acceleration = steeringForce / self:getMass()
 

 self:setVelocity(self:getVelocity() + acceleration * timeStep)
 

 self:setVelocity(Truncate(self:getVelocity(), self:getMaxSpeed()))
 

 local newPos = self:getPos() + self:getVelocity() * timeStep
 
 
 self:setPos(newPos)

 if self:getVelocity():length() > 0.00000001 then
 self:setHeadingVector(self:getVelocity():normalized())
 end

 if self:isSmoothingOn() then
 
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
 
end

local methods = 
{
 

 getVelocity = getVelocity,
 setVelocity = setVelocity,
 
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