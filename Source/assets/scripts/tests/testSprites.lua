JLI.World.getInstance():getWorldFactory():destroyAll()


local scene = JLI.Scene.create()
local shader = JLI.ShaderProgram.create();
local material = JLI.Material.create();
local sprite2D = JLI.Sprite2D.create();
local image = JLI.Image.create()


JLI.World.getInstance():getWorldResourceLoader():load("shaders/spriteShader.vsh", "shaders/spriteShader.fsh", shader)
JLI.World.getInstance():getWorldResourceLoader():load("images/basi0g01.png", image)
material:getDiffuse():loadGPU(image);
local imageWidth = image:getWidth()
local imageHeight = image:getHeight()
sprite2D:setMaterial(material)
sprite2D:setShaderProgram(shader)

for i=0, sprite2D:getMaxMeshes()-1 do
    sprite2D:setDimensions(i, JLI.btVector2(imageWidth,imageHeight))
end

local transform = JLI.btTransform(JLI.btTransform.getIdentity())
local origin = JLI.btVector3(0, 0, 0)

for i=0, sprite2D:getMaxMeshes()-1 do
    local node = JLI.Node.create()
    node:getStateMachine():pushState(JLI.NodeState.create())
    JLI.World.getInstance():addNode(node)
    node:setGeometry(sprite2D)

    origin:setY(origin:y() + imageHeight)

    if(origin:y() > JLI.World.getInstance():getViewportDimensions():y()) then
        origin:setY(0)
        origin:setX(origin:x() + imageWidth)
    end

    transform:setOrigin(origin)

    node:setTransform(transform)
end


local orthoCamera = JLI.Camera.create()
orthoCamera:enableOrthographic()

JLI.World.getInstance():addCamera(orthoCamera)




