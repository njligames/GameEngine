-- njli.World.getInstance():startSocket(192, 168, 1, 10, 2223)

local path = njli.ASSET_PATH("scripts/util.lua")
local util = (loadfile(path))()

path = njli.ASSET_PATH("scripts/filePaths.lua")
local filePaths = (loadfile(path))()



local path = njli.ASSET_PATH("scripts/levelData.lua")
local levelData = (loadfile(path))()
levelFileData = levelData.new()




path = njli.ASSET_PATH("scripts/menuNodePositions.lua")
local menuNodePositions = (loadfile(path))()


local yappyBirdsWorld = require "worlds.yappyBirdsWorld"

-- local theStartWorldName = _worldStateNames.menu
-- local theStartWorldName = _worldStateNames.tests
-- local theStartWorldName = _worldStateNames.game
local theStartWorldName = _worldStateNames.yappyGame

local worldObjectTable = {}
local sceneObjectTable = {}
local nodeObjectTable = {}

function stackTrace(name)
    print(debug.traceback(name .. " -  START Stack Trace"))
    print(debug.getinfo(1))
    print(name .. " -  END Stack Trace")
end

function getWorldCurrentState()
    local stateMachine = njli.World.getInstance():getStateMachine()

    if stateMachine then
        local state = stateMachine:getState()
        if state then
            return worldObjectTable[state:getName()]
        end
    end

    return nil
end

function getSceneCurrentState(scene)
    if scene ~= nil then
        return sceneObjectTable[scene:getStateMachine():getState():getName()]
    end

    return nil
end

function getNodeObject(name)

    if nodeObjectTable then
        local nodeObject = nodeObjectTable[name]
        if nodeObject ~= nil then
            if nodeObject.node ~= nil then
                if nodeObject.node:getStateMachine() ~= nil then
                    if nodeObject.node:getStateMachine():getState() ~= nil then
                        return nodeObject
                    else
                        stackTrace("Trying to get a NodeState that isn't there for name: " .. name)
                    end
                else
                    stackTrace("Trying to get a NodeStateMachine that isn't there for name: " .. name)
                end
            else
                stackTrace("Trying to get a Node that isn't there for name: " .. name)
            end
        else
            -- stackTrace("Trying to get a NodeObject that isn't there for name: " .. name)    
        end
    end
    
    return nil

end

function getNodeCurrentState(node)
    local nodeObject = nil
    if node ~= nil then
        nodeObject = getNodeObject(node:getName())
    end

    return nodeObject
end

function removeNodeObject(nodeObject)
    if nodeObject ~= nil then

        local key = nodeObject.instanceName

        if nodeObjectTable[key] ~= nil then
            -- nodeObjectTable[key].node:hide(getPerspectiveCamera())
            -- nodeObjectTable[key].node:hide(getOrthoCamera())
            nodeObjectTable[key]:__gc()
            nodeObjectTable[key] = nil
        -- else
        --     stackTrace("The node object with key " .. key .. " is nil, so it cannot be removed.")
        end

    else
        stackTrace("nodeObject is nil")
    end
end

function insertNodeObject(nodeObject, key)


    assert(nodeObject ~= nil, "The node object is nil")

    assert(nodeObjectTable[key] == nil, "There is already a node object with key " .. key)

    nodeObjectTable[key] = nodeObject

end

function WorldGamePause()
    local state = getWorldCurrentState()
    if state ~= nil then
        state:pause()
    end
end

function WorldGameUnPause()
    local state = getWorldCurrentState()
    if state ~= nil then
        state:unPause()
    end
end

function WorldRenderHUD()
    local state = getWorldCurrentState()
    if state ~= nil then
        state:renderHUD()
    end
end

function WorldEnterState()
    local state = getWorldCurrentState()
    if state ~= nil then
        sceneObjectTable = state:enter()
    end
end

function WorldUpdateState(timeStep)
    local state = getWorldCurrentState()
    if state ~= nil then
        sceneObjectTable = state:update(timeStep)
    end
end

function WorldExitState()
    local state = getWorldCurrentState()
    if state ~= nil then
        sceneObjectTable = state:exit()
    end
end

function WorldOnMessage(message)
    local state = getWorldCurrentState()
    if state ~= nil then
        state:onMessage(message)
    end
end

function WorldTouchDown(touches)
    local state = getWorldCurrentState()
    if state ~= nil then
        state:touchDown(touches)
    end
end

function WorldTouchUp(touches)
    local state = getWorldCurrentState()
    if state ~= nil then
        state:touchUp(touches)
    end
end

function WorldTouchMove(touches)
    local state = getWorldCurrentState()
    if state ~= nil then
        state:touchMove(touches)
    end
end

function WorldTouchCancelled(touches)
    local state = getWorldCurrentState()
    if state ~= nil then
        state:touchCancelled(touches)
    end
end

function SceneEnterState(scene)
    local state = getSceneCurrentState(scene)
    if state ~= nil then
        state:enter(scene)
    end
end

function SceneUpdateState(scene, timeStep)
    local state = getSceneCurrentState(scene)
    if state ~= nil then
        state:update(scene, timeStep)
    end
end

function SceneExitState(scene)
    local state = getSceneCurrentState(scene)
    if state ~= nil then
        state:exit(scene)
    end
end

function SceneOnMessage(scene, message)
    local state = getSceneCurrentState(scene)
    if state ~= nil then
        state:onMessage(scene, message)
    end
end

function NodeEnterState(node)
    local state = getNodeCurrentState(node)
    if state ~= nil then
        state:enter()
    end
end

function NodeUpdateState(node, timeStep)
    local state = getNodeCurrentState(node)
    if state ~= nil then
        state:update(timeStep)
    end
end

function NodeExitState(node)
    local state = getNodeCurrentState(node)
    if state ~= nil then
        state:exit()
    end
end

function NodeOnMessage(node, message)
    local state = getNodeCurrentState(node)
    if state ~= nil then
        state:onMessage(message)
    end
end

function NodeCollide(node, otherNode, collisionPoint)
    local state = getNodeCurrentState(node)
    if state ~= nil then
        state:collide(otherNode, collisionPoint)
    end
end

function NodeNear(node, otherNode)
    local state = getNodeCurrentState(node)
    if state ~= nil then
        state:near(otherNode)
    end
end

function NodeActionUpdate(action, timeStep)
    local node = action:getParent()

    local state = getNodeCurrentState(node)
    if state ~= nil then
        state:actionUpdate(action, timeStep)
    end
end

function NodeActionComplete(action)
    local node = action:getParent()

    local state = getNodeCurrentState(node)
    if state ~= nil then
        state:actionComplete(action)
    end
end

function TouchDownRay(rayContact)
    local state = getNodeCurrentState(rayContact:getHitNode())
    if state ~= nil then
        state:touchDown(rayContact)
    end
end

function TouchUpRay(rayContact)
    local state = getNodeCurrentState(rayContact:getHitNode())
    if state ~= nil then
        state:touchUp(rayContact)
    end
end

function TouchMoveRay(rayContact)
    local state = getNodeCurrentState(rayContact:getHitNode())
    if state ~= nil then
        state:touchMove(rayContact)
    end
end

function TouchCancelledRay(rayContact)
    local state = getNodeCurrentState(rayContact:getHitNode())
    if state ~= nil then
        state:touchCancelled(rayContact)
    end
end

local yappyWorld = nil

function WorldDestroy()
    if yappyWorld then
        yappyWorld:__gc()
        yappyWorld = nil
        worldObjectTable = {}
        sceneObjectTable = {}
        nodeObjectTable = {}
    end
end

function WorldCreate()
    WorldDestroy()

    yappyWorld = yappyBirdsWorld.new("YappyBirds")
    yappyWorld.startWorldName = theStartWorldName
    worldObjectTable = yappyWorld:start()
end

function pushWorldState(name, userdata)
    if worldObjectTable[name] ~= nil then
        worldObjectTable[name]:addUserData("userdata", userdata)
        worldObjectTable[name]:push()
    else
        print("unable to push world state name = " .. name)
        -- print_r(worldObjectTable)
    end
end

function getSceneState(name)
    return sceneObjectTable[name]
end

function pushSceneState(name)
    if sceneObjectTable[name] ~= nil then
        sceneObjectTable[name]:push()
    else
        print("unable to push scene state name = " .. name)
        -- print_r(sceneObjectTable)
    end
end

function pushNodeState(name)
    if nodeObjectTable[name] ~= nil then
        nodeObjectTable[name]:push()
    else
        print("unable to push node state name = " .. name)
        -- print_r(nodeObjectTable)
    end
end

function getShaderProgram()
    return yappyWorld.shader
end

function getOrthoCamera()
    return yappyWorld:getOrthoCamera()
end

function getPerspectiveCamera()
    return yappyWorld:getPerspectiveCamera()
end

function FacebookResponse(n)
    print("FacebookLoginResponse")
end

function KeyboardShow()
end

function KeyboardCancel()
end

function KeyboardReturn(text)
    print(text)
end

print("\n\n")
print("getDeviceName\t", DeviceNameToResolutionDeviceName(njli.World.getInstance():getDeviceName()))
print("\n\n\n\n")

WorldCreate()

