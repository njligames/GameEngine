


JLI.World.getInstance():getStateMachine():pushState(JLI.WorldState.create())
local scene = JLI.Scene.create()
JLI.World.getInstance():addScene(scene)

JLI.World.getInstance():enableDebugDraw()

local physicsWorld = JLI.PhysicsWorld.create()
scene:addPhysicsWorld(physicsWorld)

local current_frame = 0
local testBirdFront = (loadfile(JLI.ASSET_PATH("scripts/tests/birds0.lua")))()
local spriteAtlas = create(testBirdFront:getSheet(), JLI.JLI_OBJECT_TYPE_SpriteFrameAtlas)

function createSpriteNode()
    local shader = JLI.ShaderProgram.create();
    JLI.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)
    local image = JLI.Image.create()
    JLI.World.getInstance():getWorldResourceLoader():load("images/birds0.png", image)

    local material = JLI.Material.create();
    material:getDiffuse():loadGPU (image);

    local imageWidth = image:getWidth()
    local imageHeight = image:getHeight()
    local sprite2D = JLI.Sprite2D.create();
    sprite2D:addMaterial(material)
    sprite2D:addShaderProgram(shader)
    
    sprite2D:setSpriteAtlasFrame(0, spriteAtlas, current_frame)

    local transform = JLI.btTransform(JLI.btTransform.getIdentity())
    -- local origin = JLI.btVector3(imageWidth*.5, imageHeight*.5, 0)
    local origin = JLI.btVector3(JLI.World.getInstance():getViewportDimensions():x()*.5, JLI.World.getInstance():getViewportDimensions():y()*.5, 0)

    local node = JLI.Node.create()
    node:getStateMachine():pushState(JLI.NodeState.create())
    -- JLI.World.getInstance():addNode(node)
    node:addGeometry(sprite2D)

    transform:setOrigin(origin)

    node:setTransform(transform)






    local rigidBody = JLI.PhysicsBodyRigid.create()
	-- rigidBody:setKinematicPhysics()
	-- rigidBody:setStaticPhysics()
	rigidBody:setDynamicPhysics()

	local physicsShapeBox2D = JLI.PhysicsShapeBox2D.create()
	rigidBody:addPhysicsShape(physicsShapeBox2D)

	node:addPhysicsBody(rigidBody)





    return node
end

function createCameraNode()
    local node = JLI.Node.create()
    local camera = JLI.Camera.create()
    camera:enableOrthographic()

    node:addCamera(camera)
    return node
end

local cubeNode = createSpriteNode()
local cameraNode = createCameraNode()

function MyWorldStateEnter()

    
    scene:addRootNode(cameraNode)
    

    cameraNode:addChildNode(cubeNode)

    -- cubeNode:hide(cameraNode:getCamera())

    JLI.World.getInstance():setTouchCamera(cameraNode:getCamera());
    JLI.World.getInstance():setDebugDrawCamera(cameraNode:getCamera());
    JLI.World.getInstance():setDebugShader(cubeNode:getGeometry():getShaderProgram())
    JLI.World.getInstance():setDebugMaterial(cubeNode:getGeometry():getMaterial())

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

local angle = 0
function MyNodeMyNodeStateUpdate(node, timeStep)

	local quat = JLI.btQuaternion()
    angle = angle + (timeStep * 10)
    quat:setEuler(0, 0, 0)

    

    node:getGeometry():setSpriteAtlasFrame(0, spriteAtlas, current_frame, false)

    current_frame = current_frame + 1

    if(current_frame >= spriteAtlas:numberOfFrames()) then
        current_frame = 0
    end



    local transform = JLI.btTransform(JLI.btTransform.getIdentity())
	local origin = JLI.btVector3(JLI.World.getInstance():getViewportDimensions():x()*.5, JLI.World.getInstance():getViewportDimensions():y()*.5, 0)
	transform:setOrigin(origin)

    node:setTransform(transform)
    node:setRotation(quat)
    print(angle)
    -- node:getGeometry():applyBillboard(cameraNode:getCamera())
end

function MyNodeMyNodeStateExit(node)
end

function TouchDownRay(rayContact)
	print("TouchDownRay " .. rayContact:getHitNode():getWorldTransform():getOrigin():x() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():y() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():z())
end
function TouchUpRay(rayContact)
	print("TouchUpRay " .. rayContact:getHitNode():getWorldTransform():getOrigin():x() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():y() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():z())
end
function TouchMoveRay(rayContact)
	print("TouchMoveRay " .. rayContact:getHitNode():getWorldTransform():getOrigin():x() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():y() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():z())
end
function TouchCancelledRay(rayContact)
	print("TouchCancelledRay " .. rayContact:getHitNode():getWorldTransform():getOrigin():x() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():y() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():z())
end
