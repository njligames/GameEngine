
function createCube()
    local node = JLI.Node.create()
    local cubeState = JLI.NodeState.create()
    local shader = JLI.ShaderProgram.create()
    local material = JLI.Material.create()

    node:setName("Cube")
    cubeState:setName("CubeState")

    node:getStateMachine():pushState(cubeState)

    -- node:addGeometry(JLI.Cube.create())
    node:addGeometry(JLI.Sprite2D.create())

    node:getGeometry():addMaterial(material)

    JLI.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)
    node:getGeometry():addShaderProgram(shader)

    local imageTop = JLI.Image.create()
    JLI.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/up.tga", imageTop)
    local imageBottom = JLI.Image.create()
    JLI.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/dn.tga", imageBottom)
    local imageLeft = JLI.Image.create()
    JLI.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/lf.tga", imageLeft)
    local imageRight = JLI.Image.create()
    JLI.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/rt.tga", imageRight)
    local imageFar = JLI.Image.create()
    JLI.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/ft.tga", imageFar)
    local imageNear = JLI.Image.create()
    JLI.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/bk.tga", imageNear)

    imageRight:flip()
    imageBottom:flip()
    imageFar:flip()
    imageLeft:flip()
    imageTop:flip()
    imageNear:flip()

    -- node:getGeometry():getMaterial():getDiffuse():loadGPU(imageRight, imageBottom, imageNear, imageLeft, imageTop, imageFar)
    node:getGeometry():getMaterial():getDiffuse():loadGPU(imageLeft)

    

    return node
end

function createCamera()
    local node = JLI.Node.create()
    local camera = JLI.Camera.create()
    node:addCamera(camera)

    node:setOrigin(JLI.btVector3(0, 0, 5))

    return node
end

--World-------------------

-- local sound = JLI.Sound.create()
-- JLI.World.getInstance():getWorldResourceLoader():load("sounds/swish.wav", sound)

local scene = JLI.Scene.create()
JLI.World.getInstance():addScene(scene)
JLI.World.getInstance():getStateMachine():pushState(JLI.WorldState.create())

-- local cubeNode = createCube()
-- cubeNode:setOrigin(JLI.btVector3(0, 0, 0))
-- local soundIndex = cubeNode:addSound(sound)

local cubeNode2 = createCube()
cubeNode2:setOrigin(JLI.btVector3(0, 3, 0))




function WorldEnterState()

    local cameraNode = createCamera()
    scene:addRootNode(cameraNode)

    -- cameraNode:addChildNode(cubeNode)

    cameraNode:addChildNode(cubeNode2)
    -- cubeNode:addChildNode(cubeNode2)

    --cameraNode:getCamera():lookAt(cubeNode:getOrigin())

    -- JLI.World.getInstance():addNode(cubeNode)
    -- JLI.World.getInstance():addCamera(cameraNode:getCamera())
end

local angle = 0
function WorldUpdateState(timeStep)
    local quat = JLI.btQuaternion()
    -- angle = angle + (timeStep * 1)

    quat:setEuler(angle, angle, angle)
    -- cubeNode:setRotation(quat)

    angle = angle + (timeStep * 2)
    quat:setEuler(angle, angle, angle)
    cubeNode2:setRotation(quat)
end

function WorldExitState()
end

function WorldOnMessage(message)
end

function WorldTouchDown(touches)
    -- cubeNode:getSound(soundIndex):play()
end

function WorldTouchUp(touches)
end

function WorldTouchMove(touches)
end

function WorldTouchCancelled(touches)
end



function SceneEnterState(scene)
end

function SceneUpdateState(scene, timeStep)
end

function SceneExitState(scene)
end

function SceneOnMessage(scene, message)
end

function NodeEnterState(node)
end

function NodeUpdateState(node, timeStep)
end

function NodeExitState(node)
end

function NodeOnMessage(node, message)
end

function NodeCollide(node, otherNode, collisionPoint)
end

function NodeNear(node, otherNode)
end

function TouchDownRay(rayContact)
end

function TouchUpRay(rayContact)
end

function TouchMoveRay(rayContact)
end

function TouchCancelledRay(rayContact)
end