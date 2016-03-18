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

    njli.World.getInstance():enablePauseGame()




    local deviceName = DeviceNameToResolutionDeviceName(njli.World.getInstance():getDeviceName())
    local pushButtonNode = require "nodes.pushButtonNode"


    local imageNode = require "nodes.imageNode"
    local name = "ui_paused"
    self.nodes[name] = imageNode.new(name, self.menuGeometry, self.menuSpriteAtlas)
    insertNodeObject(self.nodes[name], name)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)
    local dimScreen = njli.World.getInstance():getViewportDimensions()
    local origin = bullet.btVector3(dimScreen:x()*.5, dimScreen:y()*.5, 0)
    self.nodes[name].node:setOrigin(origin)
    local menuScale = self.nodes[name]:shouldScale()
    self.nodes[name]:setScale(menuScale)
    self.loadingScreen = self.nodes[name]
    -- self.loadingScreen.node:show(getOrthoCamera())



    local name = _pauseMenuNodeNames.PLAY
    local root = _pauseMenuNodeNames.PLAY
    local fun = function()
                    pushSceneState(_gameSceneStateNames.play)
                end
    local toggle = false
    local soundPath = _SOUNDPATHS.interface.effects.select
    local theNode = pushButtonNode.new(name, root, self.menuGeometry, self.menuSpriteAtlas, menuScale, fun, toggle, soundPath)
    insertNodeObject(theNode, theNode.instanceName)
    njli.World.getInstance():getScene():getRootNode():addChildNode(theNode.node)
    local x, y = processDimensions(_pauseMenuNodePositions[name][deviceName].x, _pauseMenuNodePositions[name][deviceName].y)
    theNode.node:setOrigin(bullet.btVector3(x, y, -1))
    self.nodes[theNode.instanceName] = theNode
    self.playButton = theNode
    -- self.playButton.node:show(getOrthoCamera())

    





    local name = _pauseMenuNodeNames.QUIT
    local root = _pauseMenuNodeNames.QUIT
    local fun = function()
                    print('quit')
                    -- for k,v in pairs(self.world.levelSpecificNodes) do
                    --     v.node:hide(getPerspectiveCamera())
                    --     -- removeNodeObject(v)
                    -- end
                    -- self.world.levelSpecificNodes = {}

                    self.world:destroyAllPlayableNodes()

                    pushSceneState(_menuSceneStateNames.menu)
                end
    local toggle = false
    local soundPath = _SOUNDPATHS.interface.effects.select
    local theNode = pushButtonNode.new(name, root, self.menuGeometry, self.menuSpriteAtlas, menuScale, fun, toggle, soundPath)
    insertNodeObject(theNode, theNode.instanceName)
    njli.World.getInstance():getScene():getRootNode():addChildNode(theNode.node)
    local x, y = processDimensions(_pauseMenuNodePositions[name][deviceName].x, _pauseMenuNodePositions[name][deviceName].y)
    theNode.node:setOrigin(bullet.btVector3(x, y, -1))
    self.nodes[theNode.instanceName] = theNode
    self.quitButton = theNode
    -- self.quitButton.node:show(getOrthoCamera())






















    if _currentLevel.gameLevelNumber < 20 then
        local name = _pauseMenuNodeNames.NEXT_LEVEL
        local root = _pauseMenuNodeNames.NEXT_LEVEL
        local fun = function()
                        -- for k,v in pairs(self.world.levelSpecificNodes) do
                        --     v.node:hide(getPerspectiveCamera())
                        --     -- removeNodeObject(v)
                        -- end
                        -- self.world.levelSpecificNodes = {}

                        self.world:destroyAllPlayableNodes()

                        _currentLevel.gameLevelNumber = _currentLevel.gameLevelNumber + 1
                        getSceneState(_gameSceneStateNames.play).createLevel = true
                        pushSceneState(_gameSceneStateNames.play)
                    end
        local toggle = false
        local soundPath = _SOUNDPATHS.interface.effects.select
        local theNode = pushButtonNode.new(name, root, self.menuGeometry, self.menuSpriteAtlas, menuScale, fun, toggle, soundPath)
        insertNodeObject(theNode, theNode.instanceName)
        njli.World.getInstance():getScene():getRootNode():addChildNode(theNode.node)
        local x, y = processDimensions(_pauseMenuNodePositions[name][deviceName].x, _pauseMenuNodePositions[name][deviceName].y)
        theNode.node:setOrigin(bullet.btVector3(x, y, -1))
        self.nodes[theNode.instanceName] = theNode
        self.nextLevel = theNode
        -- self.nextLevel.node:show(getOrthoCamera())
    end


    








    return self.nodes
end

local update = function(self, scene, timeStep)

    if self.currentFunctionIndex <= #self.loadingFunctions then
        self.loadingFunctions[self.currentFunctionIndex](self)
        self.currentFunctionIndex = self.currentFunctionIndex + 1
    else
        --update scene state.

        local sceneName = self.sceneState:getName()

        for k,v in pairs(self.nodes) do
            v.node:show(getOrthoCamera())
        end
        
        -- print("update (" .. sceneName .. ")")
        
    end

    return self.nodes
end

local exit = function(self, scene)
    local sceneName = self.sceneState:getName()

    njli.World.getInstance():enablePauseGame(false)

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
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
