function setupAction(action, name)
    action:setName(name)
    action:setDuration(0.001)
    action:setSpeedFactor(5)
    action:setRepeat(0)
end

function createGroup(size)
    local sequenceArray = JLI.Action.createArray(size)
    for i=0, (size - 1) do
        setupAction(JLI.ActionArray_getitem(sequenceArray, i), 'Group1_' .. i)
    end
    return JLI.Action.createGroup(sequenceArray, size)
end

function createSequence(size)
    local sequenceArray = JLI.Action.createArray(size)
    for i=0, (size - 1) do
        setupAction(JLI.ActionArray_getitem(sequenceArray, i), 'Sequence1_' .. i)
    end
    return JLI.Action.createSequence(sequenceArray, size)
end

function createGroupWithSequences(size)
    local sequenceArray = JLI.Action.createArray(size)
    for i=0, (size - 1) do
        local actionSequence = createSequence(size)
        actionSequence:setName('SequenceAction')
        actionSequence:setRepeatForever()
        JLI.Action.destroy(JLI.ActionArray_getitem(sequenceArray, i))
        JLI.ActionArray_setitem(sequenceArray, i, actionSequence)
    end
    return JLI.Action.createGroup(sequenceArray, size)
end

function createAction()
    local action = JLI.Action.create()
    action:setName('BobAction')
    action:setDuration(10)
    action:setSpeedFactor(5)
    action:setRepeat(3)
    return action
end

function createForeverAction()
    local action = JLI.Action.create()
    action:setName('BobAction')
    action:setDuration(10)
    action:setSpeedFactor(5)
    action:setRepeatForever()
    return action
end

function GroupOfSequencesActionUpdate(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('GroupOfSequencesActionUpdate: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end

function GroupActionUpdate(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('GroupActionUpdate: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end

function Group1_0Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Group1_0Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft)
end

function Group1_1Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Group1_1Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft)
end

function Group1_2Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Group1_2Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft)
end

function Group1_3Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Group1_3Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft)
end

function Group1_4Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Group1_4Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft)
end





function SequenceActionUpdate(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('SequenceActionUpdate: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end

function Sequence1_0Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Sequence1_0Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end

function Sequence1_1Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Sequence1_1Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end

function Sequence1_2Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Sequence1_2Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end

function Sequence1_3Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Sequence1_3Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end

function Sequence1_4Update(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print('Sequence1_4Update: '.. action:getClassName() .. ' - '.. step .. ' / '.. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end





function BobActionUpdate(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    print(action:getName() .. ' ' .. action:getClassName() .. ' - ' .. step .. ' / ' .. timeLeft .. ' Repeats: ' .. action:getRepeatCount())
end

function BobActionMyNodeComplete(action)
    print(action:getName() .. ' ' .. action:getClassName())

    testSequence()
end





local current_frame = 0
local testBirdFront = (loadfile(JLI.ASSET_PATH("scripts/tests/birds0.lua")))()
local spriteAtlas = create(testBirdFront:getSheet(), JLI.JLI_OBJECT_TYPE_SpriteFrameAtlas)
function createSpriteNode()
    local shader = JLI.ShaderProgram.create();
    JLI.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)
    local image = JLI.Image.create()
    JLI.World.getInstance():getWorldResourceLoader():load("images/birds0.png", image)

    local material = JLI.Material.create();
    material:getDiffuse():loadGPU(image);

    local imageWidth = image:getWidth()
    local imageHeight = image:getHeight()
    local sprite2D = JLI.Sprite2D.create();
    sprite2D:addMaterial(material)
    sprite2D:addShaderProgram(shader)
    
    sprite2D:setSpriteAtlasFrame(0, spriteAtlas, current_frame)

    local transform = JLI.btTransform(JLI.btTransform.getIdentity())
    local origin = JLI.btVector3(imageWidth*.5, imageHeight*.5, 0)

    local node = JLI.Node.create()
    node:getStateMachine():pushState(JLI.NodeState.create())
    -- JLI.World.getInstance():addNode(node)
    node:addGeometry(sprite2D)

    transform:setOrigin(origin)

    node:setTransform(transform)

    return node
end

function createCameraNode()
    local node = JLI.Node.create()
    local camera = JLI.Camera.create()
    camera:enableOrthographic()

    node:addCamera(camera)
    return node
end

JLI.World.getInstance():getStateMachine():pushState(JLI.WorldState.create())

local cubeNode = createSpriteNode()
local scene = JLI.Scene.create()
function MyWorldStateEnter()

    local cameraNode = createCameraNode()
    scene:addRootNode(cameraNode)
    JLI.World.getInstance():addScene(scene)

    cameraNode:addChildNode(cubeNode)

end

function MyWorldStateUpdate(timeStep)

end

function MyWorldStateExit()
end

function MyWorldStateTouchDown(touches)
end

function MyWorldStateTouchUp(touches)
end

function MyWorldStateTouchMove(touches)
end




--Scene-------------------

function MySceneMySceneStateEnter(scene)
end

function MySceneMySceneStateUpdate(scene, timeStep)
end

function MySceneMySceneStateExit(scene)
end






--Node-------------------

function MyNodeMyNodeStateEnter(node)
    local action = createAction()
    --node:runAction(action, "thekey", false)

    local groupAction = createGroup(5)
    groupAction:setName('GroupAction')
    groupAction:setRepeatForever()
    --node:runAction(groupAction, "thekey", false)

    local sequenceAction = createSequence(5)
    sequenceAction:setName('SequenceAction')
    sequenceAction:setRepeat(30)
    --node:runAction(sequenceAction, "thekey", false)

    local groupOfSequences = createGroupWithSequences(5)
    groupOfSequences:setName('GroupOfSequencesAction')
    groupOfSequences:setRepeatForever()
    node:runAction(groupOfSequences, "thekey", false)
end

function MyNodeMyNodeStateUpdate(node, timeStep)

    node:getGeometry():setSpriteAtlasFrame(0, spriteAtlas, current_frame)

    current_frame = current_frame + 1

    if(current_frame >= spriteAtlas:numberOfFrames()) then
        current_frame = 0
    end
end

function MyNodeMyNodeStateExit(node)
end
