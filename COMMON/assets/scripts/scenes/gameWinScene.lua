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

 print("enter (" .. self.sceneState:getName() .. ")")

 self.currentFunctionIndex = 1

 njli.World.getInstance():getScene():getPhysicsWorld():enablePause()
 njli.World.getInstance():enablePauseAnimation()
 getNodeObject('text_YOU_WIN').node:show(getOrthoCamera())
 self.clock:reset()

 


 
 local lvl = tonumber(self.world.level:currentLevel()) + 1
 if lvl < 20 then
 levelFileData:completeLevel(self.world.level:currentMode(), lvl+1)
 end
 

 

 return self.nodes
end

local update = function(self, scene, timeStep)

 if self.currentFunctionIndex <= #self.loadingFunctions then
 self.loadingFunctions[self.currentFunctionIndex](self)
 self.currentFunctionIndex = self.currentFunctionIndex + 1
 else
 

 local sceneName = self.sceneState:getName()

 

 self.totalMilliseconds = self.clock:getTimeMilliseconds()

 

 local totalTimeToWait = 3 * 1000
 if self.showedThanks then
 totalTimeToWait = 10 * 1000
 end

 if self.totalMilliseconds >= (totalTimeToWait) then
 
 

 local beatAllBoards = levelFileData:allLevelsComplete()

 
 
 

 if beatAllBoards and not self.showedThanks then

 self.showedThanks = true
 self.clock:reset()

 local imageNode = require "nodes.imageNode"

 local name = "ui_thanks"
 self.nodes[name] = imageNode.new(name, self.world.menuGeometry, self.world.menuSpriteAtlas)
 insertNodeObject(self.nodes[name], name)
 njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

 local dimScreen = njli.World.getInstance():getViewportDimensions()
 local origin = bullet.btVector3(dimScreen:x()*.5, dimScreen:y()*.5, 0)

 self.nodes[name].node:setOrigin(origin)
 local menuScale = self.nodes[name]:shouldScale()
 self.nodes[name]:setScale(menuScale)


 self.loadingScreen = self.nodes[name]
 self.loadingScreen.node:show(getOrthoCamera())

 getNodeObject('text_YOU_WIN').node:hide(getOrthoCamera())

 else
 self.world:destroyAllPlayableNodes()
 
 if self.showedThanks then
 pushSceneState(_menuSceneStateNames.menu)
 else
 pushSceneState(_menuSceneStateNames.boardselect)
 end
 
 end
 
 end
 
 end

 return self.nodes
end

local exit = function(self, scene)
 local sceneName = self.sceneState:getName()

 getNodeObject('text_YOU_WIN').node:hide(getOrthoCamera())
 njli.World.getInstance():enablePauseAnimation(false)
 njli.World.getInstance():getScene():getPhysicsWorld():enablePause(false)

 for k,v in pairs(self.nodes) do
 removeNodeObject(self.nodes[k])
 end
 self.nodes = {}

 print("exit (" .. sceneName .. ")")

 return self.nodes
end

local onMessage = function(self, scene, message)
end

local touchDown = function(self, touches)
end

local touchUp = function(self, touches)
end

local touchMove = function(self, touches)
end

local touchCancelled = function(self, touches)
end

local delete = function(self)
 local sceneName = self.sceneState:getName()

 njli.Clock.destroy(self.clock)

 njli.SceneState.destroy(self.sceneState)
 self.sceneState = nil

 print("delete (" .. sceneName .. ")")
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
 print("new (" .. name .. ")")

 local sceneState = njli.SceneState.create()
 sceneState:setName(name)

 local clock = njli.Clock.create()

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

 clock = clock,
 world = world,

 showedThanks = false,
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
