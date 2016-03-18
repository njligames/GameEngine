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
    getNodeObject('text_YOU_LOSE').node:show(getOrthoCamera())
    self.clock:reset()

    return self.nodes
end

local update = function(self, scene, timeStep)

    if self.currentFunctionIndex <= #self.loadingFunctions then
        self.loadingFunctions[self.currentFunctionIndex](self)
        self.currentFunctionIndex = self.currentFunctionIndex + 1
    else
        --update scene state.

        local sceneName = self.sceneState:getName()

        print("update (" .. sceneName .. ")")

        self.totalMilliseconds = self.clock:getTimeMilliseconds()

        print(self.totalMilliseconds)
        if self.totalMilliseconds >= (3 * 1000) then
            self.world:destroyAllPlayableNodes()
            pushSceneState(_gameSceneStateNames.play, self:getUserData("userdata"))
        end

    end

    return self.nodes
end

local exit = function(self, scene)
    local sceneName = self.sceneState:getName()

    getNodeObject('text_YOU_LOSE').node:hide(getOrthoCamera())
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
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
