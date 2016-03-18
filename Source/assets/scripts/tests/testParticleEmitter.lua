math.randomseed( os.time() )

local spriteFiles =
{
    "particles/The Sun.pex",
    "particles/Winner Stars.pex",
    "particles/Comet.pex",
    "particles/Foam.pex",
    "particles/Blue Flame.pex",
    "particles/Atomic Bubble.pex",
    "particles/Crazy Blue.pex",
    "particles/Plasma Glow.pex",
    "particles/Meks Blood Spill.pex",
    "particles/Into The Blue.pex",
    "particles/JasonChoi_Flash.pex",
    "particles/Real Popcorn.pex",
    "particles/Touch Up.pex",
    "particles/Trippy.pex",
    "particles/Electrons.pex",
    "particles/Blue Galaxy.pex",
    "particles/huo1.pex",
    "particles/JasonChoi_rising up.pex",
    "particles/JasonChoi_Swirl01.pex",
    "particles/Shooting Fireball.pex",
    "particles/wu1.pex"
}

function createCameraNode()
    local node = JLI.Node.create()
    local camera = JLI.Camera.create()
    camera:enableOrthographic()

    node:addCamera(camera)
    return node
end

function createParticleEmitterNode(x, y, spriteFile)
    local node = JLI.Node.create()

    node:getStateMachine():pushState(JLI.NodeState.create())

    local particleEmitter = JLI.ParticleEmitter.create()
    -- local index = math.random(1,21)
    -- index = 1
    JLI.World.getInstance():getWorldResourceLoader():load(spriteFile, particleEmitter)

    local shader = JLI.ShaderProgram.create()
    JLI.World.getInstance():getWorldResourceLoader():load("shaders/particleVertexShader.vsh", "shaders/particleFragmentShader.fsh", shader)

    node:addParticleEmitter(particleEmitter)
    particleEmitter:addShaderProgram(shader)

    node:setOrigin(JLI.btVector3(x, y, 0))

    return node
end


local scene = JLI.Scene.create()
JLI.World.getInstance():addScene(scene)
JLI.World.getInstance():getStateMachine():pushState(JLI.WorldState.create())



function MyWorldStateEnter()

    local cameraNode = createCameraNode()
    scene:addRootNode(cameraNode)
    

    -- cameraNode:addChildNode(createParticleEmitterNode(100, 100, spriteFiles[1]))
    cameraNode:addChildNode(createParticleEmitterNode(100, 200, spriteFiles[2]))
    -- cameraNode:addChildNode(createParticleEmitterNode(100, 300, spriteFiles[3]))
    -- cameraNode:addChildNode(createParticleEmitterNode(100, 400, spriteFiles[4]))
    -- cameraNode:addChildNode(createParticleEmitterNode(100, 500, spriteFiles[5]))

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
end

function MyNodeMyNodeStateUpdate(node, timeStep)
    -- print(timeStep)
end

function MyNodeMyNodeStateExit(node)
end
