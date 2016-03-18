






local addUserData = function(self, key, value)
 self.userdata[key] = value
end

local getUserData = function(self, key)
 return self.userdata[key]
end

local push = function(self)
 njli.World.getInstance():getScene():getStateMachine():pushState(self.sceneState)
end

local renderHUD = function(self)
end

local pause = function(self)
end

local unPause = function(self)
end

local enter = function(self, scene)
 

 print("enter (" .. self.sceneState:getName() .. ") - START")

 self.currentFunctionIndex = 1

 

 
 
 
 
 

















 

 if self.createLevel then
 local gameMode = _currentLevel.gameMode
 local gameBoard = _currentLevel.gameBoard
 local gameLevel = _gameLevels[_currentLevel.gameLevelNumber]
 self.world.level:loadLevel(gameMode, gameBoard, gameLevel)
 self.world.level:createNodes(self.world, self.world.tileSpriteAtlas, self.world.tileGeometry)
 local points = self.world:translateDogWayPoints(self.world.level.dogWayPoints)
 self.world.theDog = self.world:createDogNode(points)
 self.world.theDog:start()

 self.createLevel = false

 self.world:playGameSong()

 if self.world.level:isTimeAttack() then
 self.world.level.spawnMachine:startTimer(1000 * 60 * 1)
 elseif self.world.level:isSurvival() then
 self.world.level.spawnMachine:startStopWatch()
 end
 end

 if self.world.level:isTimeAttack() then

 self.world:drawTimeAttackTime(self.world.level.spawnMachine:getTimerMilliseconds())

 elseif self.world.level:isArcade() then

 self.world:drawNumberBirdsLeft(self.world.level.spawnMachine:birdsLeft())

 elseif self.world.level:isSurvival() then

 self.world:drawSurvivalTime(self.world.level.spawnMachine:getStopWatchMilliseconds())

 end

 print("enter (" .. self.sceneState:getName() .. ") - END")
end

local update = function(self, scene, timeStep)

 if self.currentFunctionIndex <= #self.loadingFunctions then
 self.loadingFunctions[self.currentFunctionIndex](self)
 self.currentFunctionIndex = self.currentFunctionIndex + 1
 else
 
 njli.World.getInstance():setBackgroundColor(self.world.level.backgroundColor)

 self.world.level.spawnMachine:tick(timeStep, self.world)

 if self.world.level:isTimeAttack() then

 self.world:drawTimeAttackTime(self.world.level.spawnMachine:getTimerMilliseconds())

 if self.world.level.spawnMachine:isTimerFinished() then
 self.createLevel=true
 pushSceneState(_gameSceneStateNames.win)
 end

 if self.world.theDog and self.world.theDog:isCaptured() then
 
 self.createLevel=true
 pushSceneState(_gameSceneStateNames.lose)
 
 end

 elseif self.world.level:isArcade() then

 self.world:drawNumberBirdsLeft(self.world.level.spawnMachine:birdsLeft())

 if self.world.level.spawnMachine:killedAllBirds() then
 self.createLevel=true
 pushSceneState(_gameSceneStateNames.win)
 end

 if self.world.theDog and self.world.theDog:isCaptured() then
 
 self.createLevel=true
 pushSceneState(_gameSceneStateNames.lose)
 
 end

 elseif self.world.level:isSurvival() then

 self.world:drawSurvivalTime(self.world.level.spawnMachine:getStopWatchMilliseconds())

 if self.world.theDog and self.world.theDog:isCaptured() then
 
 self.createLevel=true
 pushSceneState(_gameSceneStateNames.win)
 
 end

 end
 end
end

local exit = function(self, scene)

 local sceneName = self.sceneState:getName()

 print("exit (" .. sceneName .. ") - START")

 

 getNodeObject('text_YOU_LOSE').node:hide(getOrthoCamera())
 getNodeObject('text_YOU_WIN').node:hide(getOrthoCamera())

 for k,v in pairs(self.nodes) do
 removeNodeObject(self.nodes[k])
 end
 self.nodes = {}

 
 
 

 

 print("exit (" .. sceneName .. ") - END")
end

local onMessage = function(self, scene, message)
end

local touchDown = function(self, touches)

 
 
 
 

 
 
 
 
 
 

 
 
 
 
 
 
 

 projectile = self.world:createWaterBalloonNode((touches[1]:getPosition():x() * touches[1]:getScale()) , (touches[1]:getPosition():y() * touches[1]:getScale()) )
 projectile:start()
 

 local direction = bullet.btVector3(0, 0, 1)
 local magnitude = self.world.Prm.Projectile["WaterBalloon"].Magnitude
 local azimuth = self.world.Prm.Projectile["WaterBalloon"].Azimuth


 local x = projectile.node:getWorldTransform():getOrigin():x()
 local y = projectile.node:getWorldTransform():getOrigin():y()
 local z = projectile.node:getWorldTransform():getOrigin():z()

 direction = direction:rotate(bullet.btVector3(-1,0,0), math.atan(azimuth, z))
 direction = direction:rotate(bullet.btVector3(0,1,0), math.atan(x, z))
 direction = direction:rotate(bullet.btVector3(-1,0,0), math.atan(y, z))

 

 projectile.node:getPhysicsBody():applyForce(direction * magnitude, true)
 projectile.node:show(getPerspectiveCamera())
 
end

local touchUp = function(self, touches)
end

local touchMove = function(self, touches)
end

local touchCancelled = function(self, touches)
end

local delete = function(self)
 local sceneName = self.sceneState:getName()

 print("delete (" .. sceneName .. ") - START")

 njli.SceneState.destroy(self.sceneState)
 self.sceneState = nil

 print("delete (" .. sceneName .. ") - END")
end

local methods = 
{



 addUserData = addUserData,
 getUserData = getUserData,

 push = push,
 renderHUD = renderHUD,
 pause = pause,
 unPause = unPause,
 enter = enter,
 update = update,
 exit = exit,
 onMessage = onMessage,

 touchDown = touchDown,
 touchUp = touchUp,
 touchMove = touchMove,
 touchCancelled = touchCancelled,
 __gc = delete
}

local new = function(name, world)
 print("new (" .. name .. ") - START")

 local sceneState = njli.SceneState.create()
 sceneState:setName(name)

 local yappyBirdLevelLoader = require "yappyBirdLevelLoader"
 world.level = yappyBirdLevelLoader.new(world)

 local loadingFunctions =
 {
 function(self)
 
 end,
 }

 local properties = 
 {
 sceneState = sceneState,
 nodes = {},
 userdata = {},
 loadingFunctions = loadingFunctions,

 

 world = world,

 createLevel = false,
 
 }

 print("new (" .. name .. ") - END")

 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
