
local startStopWatch = function(self)
	self.stopWatchTimer:stop();
	self.stopWatchTimer:start()
end

local getStopWatchMilliseconds = function(self)
	return self.stopWatchTimer:getMilliseconds()
end

local isTimerFinished = function(self)
	return self.countDownTimer:isFinished()
end

local startTimer = function(self, milliseconds)
	self.countDownTimer:start(milliseconds)
end

local getTimerMilliseconds = function(self)
	return self.countDownTimer:getTimeMillisecondsLeft()
end

local getArcadeSpawnPoint = function(self, id)
	return self.arcadeSpawnPoints[id]
end

local addArcadeSpawnPoint = function(self, spawnPoint)
	
	local point = {}
	point.spawnPoint = spawnPoint
	point.currentTick = spawnPoint.timeFrequency

	self.arcadeSpawnPoints[point.spawnPoint.id] = point

end

local getTimeAttackPoint = function(self, id)
	return self.timeAttackSpawnPoints[id]
end

local addTimeAttackSpawnPoint = function(self, spawnPoint)
	
	local point = {}
	point.spawnPoint = spawnPoint
	point.currentTick = spawnPoint.timeFrequency

	self.timeAttackSpawnPoints[point.spawnPoint.id] = point

end

local getSurvivalSpawnPoint = function(self, id)
	return self.survivalSpawnPoints[id]
end

local addSurvivalSpawnPoint = function(self, spawnPoint)
	
	local point = {}
	point.spawnPoint = spawnPoint
	point.currentTick = spawnPoint.timeFrequency

	self.survivalSpawnPoints[point.spawnPoint.id] = point

end

local clearPoints = function(self)
	self.arcadeSpawnPoints = {}
	self.timeAttackSpawnPoints = {}
	self.survivalSpawnPoints = {}
end

local tick = function(self, timeStep, scene)

	self.totalTicks = self.totalTicks + timeStep

	for k,v in pairs(self.arcadeSpawnPoints) do

 if self.totalTicks > self.arcadeSpawnPoints[k].spawnPoint.timeStart then
 self.arcadeSpawnPoints[k].currentTick = self.arcadeSpawnPoints[k].currentTick - timeStep
 if self.arcadeSpawnPoints[k].currentTick <= 0 then

 if scene:canCreateBirdNode() and self.arcadeSpawnPoints[k].spawnPoint.spawnAmount > 0 then
 local birdNodeObject = scene:createBirdNode(self.arcadeSpawnPoints[k].spawnPoint)
 birdNodeObject:start()

 self.arcadeSpawnPoints[k].spawnPoint.spawnAmount = self.arcadeSpawnPoints[k].spawnPoint.spawnAmount - 1
 self.arcadeSpawnPoints[k].currentTick = self.arcadeSpawnPoints[k].spawnPoint.timeFrequency
 if self.arcadeSpawnPoints[k].spawnPoint.spawnAmount <= 0 then
 self.arcadeSpawnPoints[k] = nil
 return
 end
 end
 end
 end
 
	end

	for k,v in pairs(self.timeAttackSpawnPoints) do

 if self.totalTicks > self.timeAttackSpawnPoints[k].spawnPoint.timeStart then
 self.timeAttackSpawnPoints[k].currentTick = self.timeAttackSpawnPoints[k].currentTick - timeStep
 if self.timeAttackSpawnPoints[k].currentTick <= 0 then

 if scene:canCreateBirdNode() and self.timeAttackSpawnPoints[k].spawnPoint.spawnAmount > 0 then
 scene:createBirdNode(self.timeAttackSpawnPoints[k].spawnPoint)

 self.timeAttackSpawnPoints[k].spawnPoint.spawnAmount = self.timeAttackSpawnPoints[k].spawnPoint.spawnAmount - 1
 self.timeAttackSpawnPoints[k].currentTick = self.timeAttackSpawnPoints[k].spawnPoint.timeFrequency
 if self.timeAttackSpawnPoints[k].spawnPoint.spawnAmount <= 0 then
 self.timeAttackSpawnPoints[k] = nil
 return
 end
 end
 end
 end
 
	end

	for k,v in pairs(self.survivalSpawnPoints) do

 if self.totalTicks > self.survivalSpawnPoints[k].spawnPoint.timeStart then
 self.survivalSpawnPoints[k].currentTick = self.survivalSpawnPoints[k].currentTick - timeStep
 if self.survivalSpawnPoints[k].currentTick <= 0 then

 if scene:canCreateBirdNode() and self.survivalSpawnPoints[k].spawnPoint.spawnAmount > 0 then
 scene:createBirdNode(self.survivalSpawnPoints[k].spawnPoint)

 self.survivalSpawnPoints[k].spawnPoint.spawnAmount = self.survivalSpawnPoints[k].spawnPoint.spawnAmount - 1
 self.survivalSpawnPoints[k].currentTick = self.survivalSpawnPoints[k].spawnPoint.timeFrequency
 if self.survivalSpawnPoints[k].spawnPoint.spawnAmount <= 0 then
 self.survivalSpawnPoints[k] = nil
 return
 end
 end
 end
 end
 
	end

	self.countDownTimer:tick()

end

local birdsKilled = function(self)
	return self.totalBirdsKilled
end

local killBird = function(self)
	self.totalBirdsKilled = self.totalBirdsKilled + 1
end

local killedAllBirds = function(self)
	
	
	return self.totalBirdsKilled >= self.numberBirdsToSpawn
end

local birdsLeft = function(self)
	return self.numberBirdsToSpawn - self.totalBirdsKilled
end

local restart = function(self)
	self.totalTicks = 0
	self.totalBirdsKilled = 0
end

local delete = function(self)
 
 njli.Timer.destroy(self.countDownTimer)
 njli.StopWatch.destroy(self.stopWatchTimer)
end

local methods = 
{
 


	startStopWatch = startStopWatch,
	getStopWatchMilliseconds = getStopWatchMilliseconds,


 isTimerFinished = isTimerFinished,
 startTimer = startTimer,
 getTimerMilliseconds = getTimerMilliseconds,
 
	getArcadeSpawnPoint = getArcadeSpawnPoint, 
	addArcadeSpawnPoint = addArcadeSpawnPoint, 

	getTimeAttackPoint = getTimeAttackPoint, 
	addTimeAttackSpawnPoint = addTimeAttackSpawnPoint, 

	getSurvivalSpawnPoint = getSurvivalSpawnPoint, 
	addSurvivalSpawnPoint = addSurvivalSpawnPoint,

	clearPoints = clearPoints,
 tick = tick,
 birdsKilled = birdsKilled,
 killBird = killBird,
 killedAllBirds = killedAllBirds,
 birdsLeft = birdsLeft,

 restart = restart,

 __gc = delete,
}

local new = function()
 

 local countDownTimer = njli.Timer.create()
 local stopWatchTimer = njli.StopWatch.create()

 local properties = 
 {
 
 arcadeSpawnPoints = {},
 timeAttackSpawnPoints = {},
 survivalSpawnPoints = {},
 totalTicks = 0,
 totalBirdsKilled = 0,
 numberBirdsToSpawn = 0,

 countDownTimer = countDownTimer,
 stopWatchTimer = stopWatchTimer,
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}

