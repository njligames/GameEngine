
local isOn = function(self, behavior_type)
	return (bit.band(self.iFlags, behavior_type) == behavior_type)
end

local turnOn = function(self, behavior_type)
	self.iFlags = bit.bor(self.iFlags, behavior_type)
end

local turnOff = function(self, behavior_type)
	if self:isOn(behavior_type) then
 self.iFlags = bit.bxor(self.iFlags, behavior_type)
	end
end

local accumulateForce = function(self, runningTotal, forceToAdd)
	
	local magnitudeSoFar = runningTotal:length()

	
	local magnitudeRemaining = self.pVehicle:getMaxForce() - magnitudeSoFar

	
	if magnitudeRemaining <= 0.0 then
 return false, runningTotal
	end

	
	local magnitudeToAdd = forceToAdd:length()

	
	
	
	
	if magnitudeToAdd < magnitudeRemaining then
 runningTotal = runningTotal + forceToAdd
	end

	return true, runningTotal

end

local createFeelers = function(self)
	assert(false, "not implemented...")
end




local seek = function(self, targetPos)
	
	local desiredVelocity = (targetPos - self.pVehicle:getPos())
	return desiredVelocity - self.pVehicle:getVelocity()
end




local flee = function(self, targetPos)
	
	local desiredVelocity = (self.pVehicle:getPos() - targetPos)
	return desiredVelocity - self.pVehicle:getVelocity()
end






local arrive = function(self, targetPos, deceleration)
	
	local toTarget = (targetPos - self.pVehicle:getPos())
	local dist = toTarget:length()

	if dist > 0.2 then

 local decelerationTweaker = 0.3

 local speed = dist / (deceleration * decelerationTweaker)
 speed = math.min(speed, self.pVehicle:getMaxSpeed())

 local desiredVelocity = toTarget * speed / dist

 return desiredVelocity - self.pVehicle:getVelocity()
	end
	
	return bullet.btVector3(0,0,0)
end





local pursuit = function(self, evader)
	
	local toEvader = evader:getPos() - self.pVehicle:getPos()

	
	
	local threatRange = 100.0
	if toEvader:length2() > (threatRange * threatRange) then
 return bullet.btVector3(0, 0, 0)
	end

	

	local relativeHeading = self.pVehicle:getHeadingVector():dot(evader:getHeadingVector())

	
	if toEvader:dot(self.pVehicle:getHeadingVector()) > 0 and relativeHeading < -0.95 then
 return self:seek(evader:getPos())
	end

	local lookAheadTime = toEvader:length() / (self.pVehicle:getMaxSpeed() * evader:getSpeed())

	return self:seek(evader:getPos() + evader:getVelocity() * lookAheadTime)
end






local offsetPursuit = function(self, leader, offset)

	
	
	
	local offsetTransform = self:getOffsetPursueTransform(leader, offset)

	local worldOffset = offsetTransform:getOrigin()
	local toOffset = worldOffset - self.pVehicle:getPos()

	
	
	local threatRange = 100.0
	if toOffset:length2() > (threatRange * threatRange) then
 return bullet.btVector3(0, 0, 0)
	end

	local lookAheadTime = toOffset:length() / (self.pVehicle:getMaxSpeed() + leader:getSpeed())

	return self:arrive(worldOffset + leader:getVelocity() * lookAheadTime, self.Deceleration.fast)
end




local evade = function(self, pursuer)
	
	local toPursuer = pursuer:getPos() - self.pVehicle:getPos()

	
	
	
	if toPursuer:length2() > (self.dEvadeDistSq) then
 return bullet.btVector3(0, 0, 0)
	end

	

	
	
	
	local lookAheadTime = toPursuer:length() / (self.pVehicle:getMaxSpeed() + pursuer:getSpeed())

	return self:flee(pursuer:getPos() + pursuer:getVelocity() * lookAheadTime)
end



local wander = function(self)
	assert(false, "not implemented...")
end





local obstacleAvoidance = function(self, nodes)
	assert(false, "not implemented...")
end




local followPath = function(self, pathToFollow, deceleration, pointReachedFunction)
	
	if pathToFollow:currentWaypoint() ~= nil then
 if pathToFollow:currentWaypoint():distance2(self.pVehicle:getPos()) < self.dWaypointSeekDistSq then
 pathToFollow:setNextWaypoint()
 pointReachedFunction(self.pVehicle)
 end

 
 if not pathToFollow:isFinished() then
 return self:seek(pathToFollow:currentWaypoint())
 end
 return self:arrive(pathToFollow:currentWaypoint(), deceleration)
	end

	return bullet.btVector3(0, 0, 0)
end






local interpose = function(self, movingEntityA, movingEntityB)
	assert(false, "not implemented...")
end






local hide = function(self, hunter, obstacles)
	assert(false, "not implemented...")
end





local wallAvoidance = function(self, walls)
	assert(false, "not implemented...")
end

 

local cohesion = function(self, movingEntities)
	assert(false, "not implemented...")
end
 
local separation = function(self, neighbors)
	
	local steeringForce = bullet.btVector3(0, 0, 0)

	for k,v in pairs(neighbors) do
 
 if v.node ~= self.pVehicle.node and v.movingEntity:isTagged() then
 local toAgent = self.pVehicle:getPos() - v.movingEntity:getPos()

 local len2 = toAgent:length()

 if ((len2 > 0) and (len2 < self.dSeparationDistSq)) then
 local force = toAgent:normalized() / toAgent:length()
 steeringForce = steeringForce + force
 end
 
 end
	end

	return steeringForce
end

local alignment = function(self, movingEntities)
	assert(false, "not implemented...")
end

local cohesionPlus = function(self, movingEntities)
	assert(false, "not implemented...")
end
 
local separationPlus = function(self, movingEntities)
	assert(false, "not implemented...")
end

local alignmentPlus = function(self, movingEntities)
	assert(false, "not implemented...")
end

local calculateWeightedSum = function(self)
	self.vSteeringForce = bullet.btVector3(0,0,0)
	

	if self:isOn(self.BehaviorType.seek) then
 self.vSteeringForce = self.vSteeringForce + self:seek(self.seekPosition) * self.dWeightSeek
	end

	if self:isOn(self.BehaviorType.flee) then
 self.vSteeringForce = self.vSteeringForce + self:flee(self.fleePosition) * self.dWeightFlee
	end

	if self:isOn(self.BehaviorType.arrive) then
 self.vSteeringForce = self.vSteeringForce + self:arrive(self.arrivePosition, self.deceleration) * self.dWeightArrive
	end

	if self:isOn(self.BehaviorType.wander) then
 self.vSteeringForce = self.vSteeringForce + self:wander() * self.dWeightWander
	end

	if not self:isSpacePartitioningOn() then
 if self:isOn(self.BehaviorType.cohesion) then
 self.vSteeringForce = self.vSteeringForce + self:cohesion(self.cohesionMovingEntities) * self.dWeightCohesion
 end

 if self:isOn(self.BehaviorType.separation) then
 self.vSteeringForce = self.vSteeringForce + self:separation(self.separationMovingEntities) * self.dWeightSeparation
 end

 if self:isOn(self.BehaviorType.alignment) then
 self.vSteeringForce = self.vSteeringForce + self:alignment(self.alignmentMovingEntities) * self.dWeightAlignment
 end
	else
 if self:isOn(self.BehaviorType.cohesion) then
 self.vSteeringForce = self.vSteeringForce + self:cohesionPlus(self.cohesionMovingEntities) * self.dWeightCohesion
 end

 if self:isOn(self.BehaviorType.separation) then
 self.vSteeringForce = self.vSteeringForce + self:separationPlus(self.separationMovingEntities) * self.dWeightSeparation
 end

 if self:isOn(self.BehaviorType.alignment) then
 self.vSteeringForce = self.vSteeringForce + self:alignmentPlus(self.alignmentMovingEntities) * self.dWeightAlignment
 end
	end

	if self:isOn(self.BehaviorType.obstacleAvoidance) then
 self.vSteeringForce = self.vSteeringForce + self:obstacleAvoidance(self.obstaclesToAvoid) * self.dWeightObstacleAvoidance
	end

	if self:isOn(self.BehaviorType.wallAvoidance) then
 self.vSteeringForce = self.vSteeringForce + self:wallAvoidance(self.wallsToAvoid) * self.dWeightWallAvoidance
	end

	if self:isOn(self.BehaviorType.followPath) then
 self.vSteeringForce = self.vSteeringForce + self:followPath(self.pathToFollow, self.deceleration, self.pointReachedFunction) * self.dWeightFollowPath
	end

	if self:isOn(self.BehaviorType.pursuit) then
 self.vSteeringForce = self.vSteeringForce + self:pursuit(self.pursuitTarget) * self.dWeightPursuit
	end

	if self:isOn(self.BehaviorType.evade) then
 self.vSteeringForce = self.vSteeringForce + self:evade(self.evadeTarget) * self.dWeightEvade
	end

	if self:isOn(self.BehaviorType.interpose) then
 self.vSteeringForce = self.vSteeringForce + self:interpose(self.interposeEntityA, self.interposeEntityB) * self.dWeightInterpose
	end

	if self:isOn(self.BehaviorType.hide) then
 self.vSteeringForce = self.vSteeringForce + self:hide(self.hunterToHideFrom, self.hideObstacles) * self.dWeightHide
	end

	if self:isOn(self.BehaviorType.offsetPursuit) then
 self.vSteeringForce = self.vSteeringForce + self:offsetPursuit(self.offsetPursueTarget, self.offsetPursuePosition) * self.dWeightOffsetPursuit
	end

	self.vSteeringForce = Truncate(self.vSteeringForce, self.pVehicle:getMaxForce())

	
	return self.vSteeringForce
end

local calculatePrioritized = function(self)

	assert(false, "not implemented...")

end

local calculateDithered = function(self)

	assert(false, "not implemented...")
end







local getHidingPosition = function(self, posOb, radiusOb, posHunter)
	assert(false, "not implemented...")
end



















local calculate = function(self)
	self.vSteeringForce = bullet.btVector3(0, 0, 0)

	if self:isSpacePartitioningOn() then
 if self:isSeparationOn() or self:isAlignmentOn() or self:isCohesionOn() then
 
 assert(false, "not implemented...")
 end
	else
 if self:isSeparationOn() or self:isAlignmentOn() or self:isCohesionOn() then
 
 
 end
	end

	if self.summingMethod == self.SummingMethod.weightedAverage then
 self.vSteeringForce = self:calculateWeightedSum()
	elseif self.summingMethod == self.SummingMethod.prioritized then
 self.vSteeringForce = self:calculatePrioritized()
	elseif self.summingMethod == self.SummingMethod.dithered then
 self.vSteeringForce = self:calculateDithered()
	else
 self.vSteeringForce = bullet.btVector3(0, 0, 0)
	end

	return self.vSteeringForce
end




local forwardComponent = function(self)
	assert(false, "not implemented...")
end




local sideComponent = function(self)
	assert(false, "not implemented...")
end





















local getForce = function(self)
	return self.vSteeringForce
end

local toggleSpacePartitioningOnOff = function(self)
	self.bCellSpaceOn = not self.bCellSpaceOn
end

local isSpacePartitioningOn = function(self)
	return self.bCellSpaceOn
end

local setSummingMethod = function(self, summing_method)
	self.summingMethod = summing_method
end

local getOffsetPursueTransform = function(self, leader, offset)
	local theOffset = offset
	local theLeader = leader

	if leader == nil then
 theLeader = self.offsetPursueTarget
	end

	if offset == nil then
 theOffset = self.offsetPursuePosition
	end

	local offsetTransform = bullet.btTransform(bullet.btTransform.getIdentity())
	offsetTransform:setOrigin(theOffset)
	offsetTransform = offsetTransform * theLeader.node:getWorldTransform()
	return offsetTransform
end

local getOffsetPursueDistance = function(self, leader, offset)
	local theOffset = offset
	local theLeader = leader

	if leader == nil then
 theLeader = self.offsetPursueTarget
	end

	if offset == nil then
 theOffset = self.offsetPursuePosition
	end

	local offsetTransform = bullet.btTransform(bullet.btTransform.getIdentity())
	offsetTransform:setOrigin(theOffset)
	offsetTransform = offsetTransform * theLeader.node:getWorldTransform()

	local pos1 = offsetTransform:getOrigin()
	local pos2 = self.pVehicle.node:getOrigin()
	return bullet.btDistance(pos1, pos2)
end
















local setFleeOn = function(self, fleePosition)
	self:turnOn(self.BehaviorType.flee)

	if fleePosition ~= nil then
 self.fleePosition = fleePosition
	end
end

local setSeekOn = function(self, seekPosition)
	self:turnOn(self.BehaviorType.seek)

	if seekPosition ~= nil then
 self.seekPosition = seekPosition
	end
end

local setArriveOn = function(self, arrivePosition, deceleration)
	self:turnOn(self.BehaviorType.arrive)

	if arrivePosition ~= nil then
 self.arrivePosition = arrivePosition
	end
	
	if deceleration ~= nil then
 self.deceleration = deceleration
	end
end

local setWanderOn = function(self)
	self:turnOn(self.BehaviorType.wander)
end

local setPursuitOn = function(self, pursuitTarget)
	self:turnOn(self.BehaviorType.pursuit)
	
	if pursuitTarget ~= nil then
 self.pursuitTarget = pursuitTarget
	end
end

local setEvadeOn = function(self, evadeTarget)
	self:turnOn(self.BehaviorType.evade)
	
	if evadeTarget ~= nil then
 self.evadeTarget = evadeTarget
	end
end

local setCohesionOn = function(self, cohesionMovingEntities)
	self:turnOn(self.BehaviorType.cohesion)
	
	if cohesionMovingEntities ~= nil then
 self.cohesionMovingEntities = cohesionMovingEntities
	end
end

local setSeparationOn = function(self, separationMovingEntities)
	self:turnOn(self.BehaviorType.separation)
	
	if separationMovingEntities ~= nil then
 self.separationMovingEntities = separationMovingEntities
	end
end

local setAlignmentOn = function(self, alignmentMovingEntities)
	self:turnOn(self.BehaviorType.alignment)
	
	if alignmentMovingEntities ~= nil then
 self.alignmentMovingEntities = alignmentMovingEntities
	end
end

local setObstacleAvoidanceOn = function(self, obstaclesToAvoid)
	self:turnOn(self.BehaviorType.obstacleAvoidance)
	
	if obstaclesToAvoid ~= nil then
 self.obstaclesToAvoid = obstaclesToAvoid
	end
end

local setWallAvoidanceOn = function(self, wallsToAvoid)
	self:turnOn(self.BehaviorType.wallAvoidance)
	
	if wallsToAvoid ~= nil then
 self.wallsToAvoid = wallsToAvoid
	end
end

local setFollowPathOn = function(self, pathToFollow, deceleration, pointReachedFunction)
	self:turnOn(self.BehaviorType.followPath)
	
	if pathToFollow ~= nil then
 self.pathToFollow = pathToFollow
	end

	if deceleration ~= nil then
 self.deceleration = deceleration
	end

	if pointReachedFunction ~= nil then
 self.pointReachedFunction = pointReachedFunction
	end
end

local setInterposeOn = function(self, interposeEntityA, interposeEntityB)
	self:turnOn(self.BehaviorType.interpose)
	
	if interposeEntityA ~= nil then
 self.interposeEntityA = interposeEntityA
	end
	
	if interposeEntityB ~= nil then
 self.interposeEntityB = interposeEntityB
	end
end

local setHideOn = function(self, hunterToHideFrom, hideObstacles)
	self:turnOn(self.BehaviorType.hide)
	
	if hunterToHideFrom ~= nil then
 self.hunterToHideFrom = hunterToHideFrom
	end
	
	if hideObstacles ~= nil then
 self.hideObstacles = hideObstacles
	end
end

local setOffsetPursuitOn = function(self, offsetPursueTarget, offsetPursuePosition)
	self:turnOn(self.BehaviorType.offsetPursuit)
	
	if offsetPursueTarget ~= nil then
 self.offsetPursueTarget = offsetPursueTarget
	end
	
	if offsetPursuePosition ~= nil then
 self.offsetPursuePosition = offsetPursuePosition
	end
end

local setFlockingOn = function(self)
	self:setCohesionOn()
	self:setAlignmentOn()
	self:setSeparationOn()
end

local setFleeOff = function(self)
	self:turnOff(self.BehaviorType.flee)
end

local setSeekOff = function(self)
	self:turnOff(self.BehaviorType.seek)
end

local setArriveOff = function(self)
	self:turnOff(self.BehaviorType.arrive)
end

local setWanderOff = function(self)
	self:turnOff(self.BehaviorType.wander)
end

local setPursuitOff = function(self)
	self:turnOff(self.BehaviorType.pursuit)
end

local setEvadeOff = function(self)
	self:turnOff(self.BehaviorType.evade)
end

local setCohesionOff = function(self)
	self:turnOff(self.BehaviorType.cohesion)
end

local setSeparationOff = function(self)
	self:turnOff(self.BehaviorType.separation)
end

local setAlignmentOff = function(self)
	self:turnOff(self.BehaviorType.alignment)
end

local setObstacleAvoidanceOff = function(self)
	self:turnOff(self.BehaviorType.obstacleAvoidance)
end

local setWallAvoidanceOff = function(self)
	self:turnOff(self.BehaviorType.wallAvoidance)
end

local setFollowPathOff = function(self)
	self:turnOff(self.BehaviorType.followPath)
end

local setInterposeOff = function(self)
	self:turnOff(self.BehaviorType.interpose)
end

local setHideOff = function(self)
	self:turnOff(self.BehaviorType.hide)
end

local setOffsetPursuitOff = function(self)
	self:turnOff(self.BehaviorType.offsetPursuit)
end

local setFlockingOff = function(self)
	self:setCohesionOff()
	self:setAlignmentOff()
	self:setSeparationOff()
end

local isFleeOn = function(self)
	return self:isOn(self.BehaviorType.flee)
end

local isSeekOn = function(self)
	return self:isOn(self.BehaviorType.seek)
end

local isArriveOn = function(self)
	return self:isOn(self.BehaviorType.arrive)
end

local isWanderOn = function(self)
	return self:isOn(self.BehaviorType.wander)
end

local isPursuitOn = function(self)
	return self:isOn(self.BehaviorType.pursuit)
end

local isEvadeOn = function(self)
	return self:isOn(self.BehaviorType.evade)
end

local isCohesionOn = function(self)
	return self:isOn(self.BehaviorType.cohesion)
end

local isSeparationOn = function(self)
	return self:isOn(self.BehaviorType.separation)
end

local isAlignmentOn = function(self)
	return self:isOn(self.BehaviorType.alignment)
end

local isObstacleAvoidanceOn = function(self)
	return self:isOn(self.BehaviorType.obstacleAvoidance)
end

local isWallAvoidanceOn = function(self)
	return self:isOn(self.BehaviorType.wallAvoidance)
end

local isFollowPathOn = function(self)
	return self:isOn(self.BehaviorType.followPath)
end

local isInterposeOn = function(self)
	return self:isOn(self.BehaviorType.interpose)
end

local isHideOn = function(self)
	return self:isOn(self.BehaviorType.hide)
end

local isOffsetPursuitOn = function(self)
	return self:isOn(self.BehaviorType.offsetPursuit)
end



local dBoxLength = function(self)
	assert(false, "not implemented...")
end

local getFeelers = function(self)
	assert(false, "not implemented...")
end

local wanderJitter = function(self)
	assert(false, "not implemented...")
end

local wanderDistance = function(self)
	assert(false, "not implemented...")
end

local wanderRadius = function(self)
	assert(false, "not implemented...")
end

local separationWeight = function(self)
	assert(false, "not implemented...")
end

local alignmentWeight = function(self)
	assert(false, "not implemented...")
end

local cohesionWeight = function(self)
	assert(false, "not implemented...")
end

local addSeparationEntity = function(self, movingEntity)
	if movingEntity ~= nil then
 self.separationMovingEntities[movingEntity.node:getName()] = movingEntity
	end
end

local removeSeparationEntity = function(self, movingEntity)
	if movingEntity ~= nil then
 self.separationMovingEntities[movingEntity.node:getName()] = nil
	end
end

local getSeparationEntities = function(self)
	return self.separationMovingEntities
end



local delete = function(self)
 
end

local methods = 
{
 

 isOn = isOn,
 turnOn = turnOn,
 turnOff = turnOff, 

 accumulateForce = accumulateForce,
 createFeelers = createFeelers,
 seek = seek,
 flee = flee,
 arrive = arrive,
 pursuit = pursuit,
 offsetPursuit = offsetPursuit,
 evade = evade,
 wander = wander,
 obstacleAvoidance = obstacleAvoidance,
 followPath = followPath,
 interpose = interpose,
 hide = hide,
 wallAvoidance = wallAvoidance,
 cohesion = cohesion,
 separation = separation,
 alignment = alignment,
 cohesionPlus = cohesionPlus,
 separationPlus = separationPlus,
 alignmentPlus = alignmentPlus,
 calculateWeightedSum = calculateWeightedSum,
 calculatePrioritized = calculatePrioritized,
 calculateDithered = calculateDithered,
 getHidingPosition = getHidingPosition,
 calculate = calculate,
 forwardComponent = forwardComponent,
 sideComponent = sideComponent,
 
 
 
 
 
 getForce = getForce,
 toggleSpacePartitioningOnOff = toggleSpacePartitioningOnOff,
 isSpacePartitioningOn = isSpacePartitioningOn,
 setSummingMethod = setSummingMethod,
 getOffsetPursueTransform = getOffsetPursueTransform,
 getOffsetPursueDistance = getOffsetPursueDistance,

 setFleeOn = setFleeOn,
 setSeekOn = setSeekOn,
 setArriveOn = setArriveOn,
 setWanderOn = setWanderOn,
 setPursuitOn = setPursuitOn,
 setEvadeOn = setEvadeOn,
 setCohesionOn = setCohesionOn,
 setSeparationOn = setSeparationOn,
 setAlignmentOn = setAlignmentOn,
 setObstacleAvoidanceOn = setObstacleAvoidanceOn,
 setWallAvoidanceOn = setWallAvoidanceOn,
 setFollowPathOn = setFollowPathOn,
 setInterposeOn = setInterposeOn,
 setHideOn = setHideOn,
 setOffsetPursuitOn = setOffsetPursuitOn,

 setFlockingOn = setFlockingOn,
 setFleeOff = setFleeOff,
 setSeekOff = setSeekOff,
 setArriveOff = setArriveOff,
 setWanderOff = setWanderOff,
 setPursuitOff = setPursuitOff,
 setEvadeOff = setEvadeOff,
 setCohesionOff = setCohesionOff,
 setSeparationOff = setSeparationOff,
 setAlignmentOff = setAlignmentOff,
 setObstacleAvoidanceOff = setObstacleAvoidanceOff,
 setWallAvoidanceOff = setWallAvoidanceOff,
 setFollowPathOff = setFollowPathOff,
 setInterposeOff = setInterposeOff,
 setHideOff = setHideOff,
 setOffsetPursuitOff = setOffsetPursuitOff,
 setFlockingOff = setFlockingOff,

 isFleeOn = isFleeOn,
 isSeekOn = isSeekOn,
 isArriveOn = isArriveOn,
 isWanderOn = isWanderOn,
 isPursuitOn = isPursuitOn,
 isEvadeOn = isEvadeOn,
 isCohesionOn = isCohesionOn,
 isSeparationOn = isSeparationOn,
 isAlignmentOn = isAlignmentOn,
 isObstacleAvoidanceOn = isObstacleAvoidanceOn,
 isWallAvoidanceOn = isWallAvoidanceOn,
 isFollowPathOn = isFollowPathOn,
 isInterposeOn = isInterposeOn,
 isHideOn = isHideOn,
 isOffsetPursuitOn = isOffsetPursuitOn,

 dBoxLength = dBoxLength,
 getFeelers = getFeelers,
 wanderJitter = wanderJitter,
 wanderDistance = wanderDistance,
 wanderRadius = wanderRadius,
 separationWeight = separationWeight,
 alignmentWeight = alignmentWeight,
 cohesionWeight = cohesionWeight,



 addSeparationEntity = addSeparationEntity,
 removeSeparationEntity = removeSeparationEntity,
 getSeparationEntities = getSeparationEntities,




 __gc = delete
}

local new = function(movingEntity)
 

 njli.World.getInstance():getWorldLuaVirtualMachine():getMinNumber()

 local assetPath = njli.ASSET_PATH("scripts/steering/Params.lua")
 
 local Prm = loadfile(assetPath)()

 local BehaviorType =
 {
 none = (0x00000),
 seek = (0x00002),
 flee = (0x00004),
 arrive = (0x00008),
 wander = (0x00010),
 cohesion = (0x00020),
 separation = (0x00040),
 alignment = (0x00080),
 obstacleAvoidance = (0x00100),
 wallAvoidance = (0x00200),
 followPath = (0x00400),
 pursuit = (0x00800),
 evade = (0x01000),
 interpose = (0x02000),
 hide = (0x04000),
 flock = (0x08000),
 offsetPursuit = (0x10000)
	}

	local Deceleration = 
	{
 slow = 3, 
 normal = 2, 
 fast = .5
	}

	local SummingMethod = 
	{
 weightedAverage = 0, 
 prioritized = 1, 
 dithered = 2
	}


	
	
	local vSteeringForce = bullet.btVector3(0, 0, 0)
	
	
	
	local dDBoxLength = Prm.MinDetectionBoxLength
	local feelers = {}
	local dWallDetectionFeelerLength = Prm.WallDetectionFeelerLength

	local dWanderRadius = Prm.WanderRad
	local vWanderTarget = bullet.btVector3(0.0, 0.0, -1.0)

	local dWanderJitter = Prm.WanderJitterPerSec
	
	local dWanderDistance = Prm.WanderDist
	local dWeightSeparation = Prm.SeparationWeight
	local dWeightCohesion = Prm.CohesionWeight
	local dWeightAlignment = Prm.AlignmentWeight
	local dWeightWander = Prm.WanderWeight
	local dWeightObstacleAvoidance = Prm.ObstacleAvoidanceWeight
	local dWeightWallAvoidance = Prm.WallAvoidanceWeight
	local dWeightSeek = Prm.SeekWeight
	local dWeightFlee = Prm.FleeWeight
	local dWeightArrive = Prm.ArriveWeight
	local dWeightPursuit = Prm.PursuitWeight
	local dWeightOffsetPursuit = Prm.OffsetPursuitWeight
	local dWeightInterpose = Prm.InterposeWeight
	local dWeightHide = Prm.HideWeight
	local dWeightEvade = Prm.EvadeWeight
	local dWeightFollowPath = Prm.FollowPathWeight
	local dViewDistance = Prm.ViewDistance
	local dWaypointSeekDistSq = (Prm.WaypointSeekDist * Prm.WaypointSeekDist)
	local dSeparationDistSq = (Prm.SeparationDist * Prm.SeparationDist)
	local dEvadeDistSq = (Prm.EvadDist * Prm.EvadDist)
	local iFlags = BehaviorType.none

	local bCellSpaceOn = false
	local summingMethod = SummingMethod.weightedAverage

 local properties = 
 {
 
 Prm = Prm,
 BehaviorType = BehaviorType,
 Deceleration = Deceleration,
 SummingMethod = SummingMethod,

 pVehicle = movingEntity,
 vSteeringForce = vSteeringForce,
 
 
 target = target,
 dDBoxLength = dDBoxLength,
 feelers = feelers,
 dWallDetectionFeelerLength = dWallDetectionFeelerLength,
 vWanderTarget = vWanderTarget,
 dWanderJitter = dWanderJitter,
 dWanderRadius = dWanderRadius,
 dWanderDistance = m_dWanderDistance,
 dWeightSeparation = dWeightSeparation,
 dWeightCohesion = dWeightCohesion,
 dWeightAlignment = dWeightAlignment,
 dWeightWander = dWeightWander,
 dWeightObstacleAvoidance = dWeightObstacleAvoidance,
 dWeightWallAvoidance = dWeightWallAvoidance,
 dWeightSeek = dWeightSeek,
 dWeightFlee = dWeightFlee,
 dWeightArrive = dWeightArrive,
 dWeightPursuit = dWeightPursuit,
 dWeightOffsetPursuit = dWeightOffsetPursuit,
 dWeightInterpose = dWeightInterpose,
 dWeightHide = dWeightHide,
 dWeightEvade = dWeightEvade,
 dWeightFollowPath = dWeightFollowPath,
 dViewDistance = dViewDistance,
 dWaypointSeekDistSq = dWaypointSeekDistSq,
 dSeparationDistSq = dSeparationDistSq,
 dEvadeDistSq = dEvadeDistSq,
 iFlags = iFlags,

 bCellSpaceOn = bCellSpaceOn,
 summingMethod = summingMethod,


 seekPosition = movingEntity:getPos(),
 fleePosition = movingEntity:getPos(),
 arrivePosition = movingEntity:getPos(),
 deceleration = Deceleration.normal,
 obstaclesToAvoid = {},
 pathToFollow = {},
 pointReachedFunction = function(self) 
 
 end,
 pursuitTarget = movingEntity,
 evadeTarget = movingEntity,

 cohesionMovingEntities = {},
 separationMovingEntities = {},
 alignmentMovingEntities = {},

 interposeEntityA = interposeEntityA,
 interposeEntityB = interposeEntityB,

 hunterToHideFrom = movingEntity,
 hideObstacles = {},

 offsetPursueTarget = movingEntity,
 offsetPursuePosition = bullet.btVector3(0, 0, 0),
 wallsToAvoid = {}
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
