local closestWaypoint = function(self, point)

 if #self.wayPoints > 0 then
 local closestPointIdx = 1
 local closestPointDistance = 999999
 local closestPoint = self.wayPoints[closestPointIdx]


 for i=1,#self.wayPoints do
 local currentPoint = self.wayPoints[i]
 local currentDistance = bullet.btDistance(point, currentPoint)

 if closestPointDistance > currentDistance then
 closestPoint = currentPoint
 closestPointDistance = currentDistance
 closestPointIdx = i
 end
 end

 return closestPoint, closestPointIdx
 end

 return point, 0
end

local setCurrentWaypointIndex = function(self, curWayPointIndex)
 local length = #self.wayPoints
 self.curWayPointIndex = curWayPointIndex

 if self.curWayPointIndex > length then
 if self.bLooped then
 self.curWayPointIndex = 1
 else
 self.curWayPointIndex = length
 end
 end

end

local currentWaypoint = function(self)
 return self.wayPoints[self.curWayPointIndex]
end

local isFinished = function(self)
 local length = #self.wayPoints

 if self.bLooped then
 return false
 end

 return (self.curWayPointIndex >= length)
end
 
local setNextWaypoint = function(self)
 self:setCurrentWaypointIndex(self.curWayPointIndex + 1)
end

local createRandomPath = function(self, numWaypoints, minX, minY, maxX, maxY)
	assert(false, "not implemented...")
end

local loopOn = function(self)
	self.bLooped = true
end

local loopOff = function(self)
	self.bLooped = false
end

local addWayPoint = function(self, new_point)
 local length = #self.wayPoints
 self.wayPoints[length + 1] = new_point

 local currentWaypoint = self:currentWaypoint()

 if currentWaypoint == nil then
 self.currentWaypoint = self.wayPoints[length + 1]
 end
end

local setPoints = function(self, points)
 for i=1,#points do
 self:addWayPoint(points[i])
 end

 self.currentWaypoint = points[0]
end

local setPath = function(self, path)
	assert(false, "not implemented...")
end

local clear = function(self)
	self.wayPoints = {}
 self.currentWaypoint = nil
end

local getPath = function(self)
	return self.wayPoints
end


local delete = function(self)
 
end

local methods = 
{
 
 closestWaypoint = closestWaypoint,
 setCurrentWaypointIndex = setCurrentWaypointIndex,

 currentWaypoint = currentWaypoint,
 isFinished = isFinished,
 setNextWaypoint = setNextWaypoint,
 createRandomPath = createRandomPath,
 loopOn = loopOn,
 loopOff = loopOff,
 addWayPoint = addWayPoint,
 setPoints = setPoints,
 setPath = setPath,
 clear = clear,
 getPath = getPath,


 __gc = delete
}

local new = function(points)
 

 local wayPoints = {}

 if points ~= nil then
 wayPoints = points
 end

 local curWayPointIndex = 1

 
 
 local bLooped = false

 local properties = 
 {
 

 wayPoints = wayPoints,
 curWayPointIndex = curWayPointIndex,
 bLooped = bLooped
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
