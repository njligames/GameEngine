local arg={...}

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
end

local update = function(self, scene, timeStep)

    if self.currentFunctionIndex <= #self.loadingFunctions then
        self.loadingFunctions[self.currentFunctionIndex](self)
        self.currentFunctionIndex = self.currentFunctionIndex + 1
    else
        --update scene state.

        -- print("update (" .. self.sceneState:getName() .. ")")

        pushWorldState(_worldStateNames.tests)
        -- pushSceneState(_testsSceneStateNames.basic)
    end
end

local exit = function(self, scene)
    local sceneName = self.sceneState:getName()

    for k,v in pairs(self.nodes) do
        removeNodeObject(self.nodes[k])
    end
    self.nodes = {}

    print("exit (" .. sceneName .. ")")
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

    -- self:exit(nil)
    njli.World.getInstance():getScene():getStateMachine():pushState(nil)

    njli.Geometry.destroy(self.geometry)
    self.geometry = nil

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

local new = function(name)
    print("new (" .. name .. ")")

    local sceneState = njli.SceneState.create()
    sceneState:setName(name)
    
    geometry = njli.Sprite2D.create()
    geometry:setName("testSceneGeometry")

    geometry:addShaderProgram(getShaderProgram())

    local loadingFunctions =
    {
        function(self)
            local testNode = require "nodes.testNode"
            self.nodes["myTestNode"] = testNode.new("myTestNode", self.geometry)
        end,
        function(self)
        end,
    }

    local properties = 
    {
        sceneState = sceneState,
        nodes = {},
        userdata = {},
        loadingFunctions = loadingFunctions,

        geometry = geometry,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
