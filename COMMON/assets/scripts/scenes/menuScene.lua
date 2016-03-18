local arg={...}

local addUserData = function(self, key, value)
 self.userdata[key] = value
end

local getUserData = function(self, key)
 return self.userdata[key]
end

local pushButtonNode = require "nodes.pushButtonNode"
local imageNode = require "nodes.imageNode"

local push = function(self)
 njli.World.getInstance():getScene():getStateMachine():pushState(self.sceneState)
end

local renderHUD = function(self)
end

local pause = function(self)
 print("pause")
end

local unPause = function(self)
 print("unPause")
end

local enter = function(self, scene)
 print(getSceneStateName() .. " enter ")

 njli.World.getInstance():setBackgroundColor(bullet.btVector4(0,0,0,1))

	local stateName = scene:getStateMachine():getState():getName()

 local tbl = {}

 tbl[_menuSceneStateNames.menu] = 
 {
 {root = "PLAY", name = "PLAY", fun = function()
 pushSceneState(_menuSceneStateNames.boardselect)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select}, 
 
 
 
 
 
 
 
 
 
 
 
 
 }
 tbl[_menuSceneStateNames.settings] = 
 {
 {root = "SOUND_FX", name = "SOUND_FX", fun = function()
 
 end, toggle = true},
 {root = "MUSIC", name = "MUSIC", fun = function()
 
 end, toggle = true},
 {root = "ABOUT", name = "ABOUT", fun = function()
 pushSceneState(_menuSceneStateNames.about)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = false},
 {root = "LEADERBOARDS", name = "LEADERBOARDS", fun = function()
 pushSceneState(_menuSceneStateNames.leaderboards)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = false},
 {root = "ACHIEVEMENTS", name = "ACHIEVEMENTS", fun = function()
 pushSceneState(_menuSceneStateNames.achievements)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = false},
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.menu)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 }
 tbl[_menuSceneStateNames.store] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.menu)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 }
 tbl[_menuSceneStateNames.highScores] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.menu)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 }
 tbl[_menuSceneStateNames.characters] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.menu)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 }
 tbl[_menuSceneStateNames.about] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.settings)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 }
 tbl[_menuSceneStateNames.leaderboards] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.settings)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 }
 tbl[_menuSceneStateNames.achievements] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.settings)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 }
 tbl[_menuSceneStateNames.levelselect] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.menu)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 {root = "portrait_city", name = "portrait_city", fun = function()
 _currentLevel.gameBoard = _gameBoards.CITY
 pushSceneState(_menuSceneStateNames.boardselect)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = false},
 {root = "portrait_country", name = "portrait_country", fun = function()
 _currentLevel.gameBoard = _gameBoards.COUNTRY
 pushSceneState(_menuSceneStateNames.boardselect)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = false},
 }
 tbl[_menuSceneStateNames.modeselect] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.menu)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},
 {root = "TIME_ATTACK", name = "TIME_ATTACK", fun = function()
 _currentLevel.gameMode = _gameModes.TIMEATTACK,
 pushSceneState(_menuSceneStateNames.boardselect)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = false},
 {root = "ARCADE", name = "ARCADE", fun = function()
 _currentLevel.gameMode = _gameModes.ARCADE,
 pushSceneState(_menuSceneStateNames.boardselect)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = false},
 {root = "SURVIVAL", name = "SURVIVAL", fun = function()
 _currentLevel.gameMode = _gameModes.SURVIVAL,
 pushSceneState(_menuSceneStateNames.boardselect)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = false},
 }
 tbl[_menuSceneStateNames.boardselect] = 
 {
 {root = "BACK", name = "BACK", fun = function()
 pushSceneState(_menuSceneStateNames.menu)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.previous, disabled = false},


 {root = "stage", name = "stage1", fun = function()
 _currentLevel.gameLevelNumber = 1

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 1)},
 {root = "stage", name = "stage2", fun = function()
 _currentLevel.gameLevelNumber = 2

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 2)},
 {root = "stage", name = "stage3", fun = function()
 _currentLevel.gameLevelNumber = 3

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 3)},
 {root = "stage", name = "stage4", fun = function()
 _currentLevel.gameLevelNumber = 4

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 4)},
 {root = "stage", name = "stage5", fun = function()
 _currentLevel.gameLevelNumber = 5

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 5)},

















 {root = "stage", name = "stage6", fun = function()
 _currentLevel.gameLevelNumber = 6

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 6)},
 {root = "stage", name = "stage7", fun = function()
 _currentLevel.gameLevelNumber = 7

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 7)},
 {root = "stage", name = "stage8", fun = function()
 _currentLevel.gameLevelNumber = 8

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 8)},
 {root = "stage", name = "stage9", fun = function()
 _currentLevel.gameLevelNumber = 9

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 9)},
 {root = "stage", name = "stage10", fun = function()
 _currentLevel.gameLevelNumber = 10

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 10)},
















 {root = "stage", name = "stage11", fun = function()
 _currentLevel.gameLevelNumber = 11

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 11)},
 {root = "stage", name = "stage12", fun = function()
 _currentLevel.gameLevelNumber = 12

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 12)},
 {root = "stage", name = "stage13", fun = function()
 _currentLevel.gameLevelNumber = 13

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 13)},
 {root = "stage", name = "stage14", fun = function()
 _currentLevel.gameLevelNumber = 14

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 14)},
 {root = "stage", name = "stage15", fun = function()
 _currentLevel.gameLevelNumber = 15

 getSceneState(_gameSceneStateNames.play).createLevel = true
 pushSceneState(_gameSceneStateNames.play)
 end, toggle = false, soundPath = _SOUNDPATHS.interface.effects.select, disabled = not levelFileData:isLevelComplete(_gameModes.ARCADE, 15)},
 }

 local name = _menuNodeNames.ui_background
 self.nodes[name] = imageNode.new(name, self.geometry, self.spriteAtlas)
 insertNodeObject(self.nodes[name], name)
 njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

 local dimScreen = njli.World.getInstance():getViewportDimensions()
 local origin = bullet.btVector3(dimScreen:x()*.5, dimScreen:y()*.5, 0)
 self.nodes[name].node:setOrigin(origin)

 local menuScale = self.nodes[name]:shouldScale()
 self.nodes[name]:setScale(menuScale)
 

 local deviceName = DeviceNameToResolutionDeviceName(njli.World.getInstance():getDeviceName())

 if _menuSceneStateNames.menu == stateName then
 name = _menuNodeNames.logo_yb

 self.nodes[name] = imageNode.new(name, self.geometry, self.spriteAtlas)
 insertNodeObject(self.nodes[name], name)
 njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)
 
 
 
 

 
 
 local x, y = processDimensions(_menuNodePositions[stateName][name][deviceName].x, _menuNodePositions[stateName][name][deviceName].y)

 self.nodes[name].node:setOrigin(bullet.btVector3(x, y, -1))
 self.nodes[name]:setScale(menuScale * 0.85)

 

 self.worldNode:playTitleSong()
 else
 self.worldNode:playMenuSong()
 end

 


 
 local buttonStates = {}
 if tbl[stateName] then
 for i=1, #tbl[stateName] do

 local name = tbl[stateName][i].name
 local root = tbl[stateName][i].root
 local fun = tbl[stateName][i].fun
 local toggle = tbl[stateName][i].toggle
 local soundPath = tbl[stateName][i].soundPath
 local disabled = tbl[stateName][i].disabled
 


 if disabled then
 theNode = pushButtonNode.new(name, root, self.geometry, self.spriteAtlas, menuScale, fun, toggle, soundPath, disabled)
 else
 theNode = pushButtonNode.new(name, root, self.geometry, self.spriteAtlas, menuScale, fun, toggle, soundPath)
 end
 insertNodeObject(theNode, theNode.instanceName)
 njli.World.getInstance():getScene():getRootNode():addChildNode(theNode.node)

 
 

 local x, y = processDimensions(_menuNodePositions[stateName][name][deviceName].x, _menuNodePositions[stateName][name][deviceName].y)

 theNode.node:setOrigin(bullet.btVector3(x, y, -1))
 


 table.insert(buttonStates, theNode)

 self.nodes[theNode.instanceName] = theNode

 end
 end
 
 self.buttonStates = buttonStates
end

local update = function(self, scene, timeStep)
 local stateName = scene:getStateMachine():getState():getName()

 for k,v in pairs(self.nodes) do
 self.nodes[k].node:show(getOrthoCamera())
 end

 
 
 
 
 

end

local exit = function(self, scene)

	for k,v in pairs(self.nodes) do
 self.nodes[k].node:hide(getOrthoCamera())
 removeNodeObject(self.nodes[k])
	end
	self.nodes = {}
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

 njli.World.getInstance():getScene():getStateMachine():pushState(nil)
 

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

local new = function(name, spriteAtlas, material, geometry, worldNode)

	local sceneState = njli.SceneState.create()
 sceneState:setName(name)

 local nodes = {}

 local properties = 
 {
 sceneState = sceneState,
 nodes = nodes,

 
 spriteAtlas = spriteAtlas,
 material = material,
 geometry = geometry,
 buttonStates = {},
 userdata = {},

 worldNode = worldNode,
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
