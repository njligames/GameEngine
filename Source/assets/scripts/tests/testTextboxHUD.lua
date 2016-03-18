--JLI.World.getInstance():getWorldFactory():destroyAll()


local scene = JLI.Scene.create()
local shader = JLI.ShaderProgram.create();
local material = JLI.Material.create();
local sprite2D = JLI.Sprite2D.create();
local image = JLI.Image.create()


JLI.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)
JLI.World.getInstance():getWorldResourceLoader():load("images/birds0.png", image)

local font = JLI.World.getInstance():getWorldHUD():createFont("sans", "fonts/Roboto-Regular.ttf")
if (font == -1) then
    print("Could not add font italic.\n");
else
	print("yes " .. font)
end

local textboxHUD = JLI.TextboxHUD.create()
material:getDiffuse():loadGPU(textboxHUD);
local imageWidth = 2048
local imageHeight = 2048

-- material:getDiffuse():loadGPU(image);
-- local imageWidth = image:getWidth()
-- local imageHeight = image:getHeight()

sprite2D:setMaterial(material)
sprite2D:setShaderProgram(shader)

sprite2D:setDimensions(0, JLI.btVector2(2048,2048), JLI.btVector2(0,0))

local i = 0

-- local testBirdFront = (loadfile(JLI.ASSET_PATH("scripts/birds0.lua")))()


-- local spriteAtlas = create(testBirdFront:getSheet(), JLI.JLI_OBJECT_TYPE_SpriteFrameAtlas)

-- local current_frame = 0
-- sprite2D:setSpriteAtlasFrame(i, spriteAtlas, current_frame)
-- local numberOfFrames = spriteAtlas:numberOfFrames()




local transform = JLI.btTransform(JLI.btTransform.getIdentity())
local origin = JLI.btVector3(0, 0, 0)

local node = JLI.Node.create()
-- node:getStateMachine():pushState(JLI.NodeState.create())
JLI.World.getInstance():addNode(node)
node:setGeometry(sprite2D)

transform:setOrigin(origin)

node:setTransform(transform)


local orthoCamera = JLI.Camera.create()
orthoCamera:enableOrthographic()

JLI.World.getInstance():addCamera(orthoCamera)













--JLI.World.getInstance():pushState(JLI.WorldState.create())

function MyWorldStateEnter()

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

	-- node:getGeometry():setSpriteAtlasFrame(0, spriteAtlas, current_frame)

	-- current_frame = current_frame + 1

	-- if(current_frame >= spriteAtlas:numberOfFrames()) then
	-- 	current_frame = 0
	-- end
end

function MyNodeMyNodeStateExit(node)
end