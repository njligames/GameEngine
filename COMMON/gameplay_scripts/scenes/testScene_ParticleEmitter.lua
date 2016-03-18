-- local getDivisor = function(self)
--     return math.floor(2048 / self.scale)
-- end

local getOriginForLayer = function(self, x, y, layer, sublayer)
    local subLayerOffset = -0.1
    local divisor = getGameViewDivisor()--self:getDivisor()
    local x_offset = (0.5 * self.scale )
    local y_offset = (0.5 * self.scale )

    local xx = ((self.WORLD_XOFFSET) + ((x/divisor)-x_offset))
    local yy = ((self.WORLD_YOFFSET) + ((y/divisor)-y_offset))
    local offset = 0
    if sublayer ~= nil then
        offset = (sublayer * subLayerOffset)
    end

    local zz = self.LAYER_MAX + (0.1 - (self.LAYER_DISTANCE * (layer - 1))) + offset

    return bullet.btVector3(xx, yy, zz)
end

local transformCoordinate = function(self, origin)
    local myself = self
    function adjustPosition(oldPosition, newDistance)
        local ret = oldPosition
        local totalDistanceFromCamera = myself.LAYER_MAX - 0.1

        if newDistance ~= totalDistanceFromCamera then
            local theta = math.atan(oldPosition, totalDistanceFromCamera)
            local newPosition = math.tan(theta) * newDistance
            ret = newPosition
        end

        return ret
    end

    local zz = origin:z()
    local xx = adjustPosition(origin:x(), zz)
    local yy = adjustPosition(origin:y(), zz)

    return bullet.btVector3(xx, yy, zz)
end

local createProjectileNode = function(self, x, y, type)
    local fileName = projectileTypeToFilename(type)
    local instanceName = self.projectileInstanceCount .. "/" .. fileName
    self.projectileInstanceCount = self.projectileInstanceCount + 1

    local balloonNode = require "nodes.balloonNode"

    -- local xx = self.level.spawnMachine:getPoint(59).spawnPoint.x
    -- local yy = self.level.spawnMachine:getPoint(59).spawnPoint.y
    -- local layerlayer = self.level.spawnMachine:getPoint(59).spawnPoint.layer
    -- local po = self:transformCoordinate(self:getOriginForLayer(xx, yy, layerlayer))

    --  po = getPerspectiveCamera():unProject(njli.btVector2(xx, yy))

    -- print(self:transformCoordinate(self:getOriginForLayer(xx, yy, 1)))
    -- print(self:transformCoordinate(self:getOriginForLayer(xx, yy, 4)))

    -- po:setZ(200)

    self.nodes[instanceName] = balloonNode.new(self, instanceName, self.characterSpriteAtlas, self.characterGeometry, self.particleGeometry, po)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    self.nodes[instanceName].node:show(getPerspectiveCamera())

    local frameName = self.nodes[instanceName].frameName
    local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    local sheet = self.characterSheetInfo:getSheet()
    local width = sheet.frames[frameIndex].widthFile - 2
    local height = sheet.frames[frameIndex].heightFile - 2

    local divisor = getGameViewDivisor()--self:getDivisor()
    local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    local pp = njli.btVector2( 0.5, 0.5 )
    self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite, pp)

    local origin = self:getOriginForLayer(x, y, 4)
    origin = self:transformCoordinate(origin)

    self.nodes[instanceName].node:setOrigin(origin)

    insertNodeObject(self.nodes[instanceName], instanceName)






    

    -- self.nodes[instanceName].node:setOrigin(self.nodes[instanceName].particleOrigin)



    return self.nodes[instanceName]
end

-- #####################################################################################

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

    -- print("enter (" .. self.sceneState:getName() .. ")")

    self.currentFunctionIndex = 1

    njli.World.getInstance():getScene():getPhysicsWorld():enablePause()
    njli.World.getInstance():enablePauseAnimation()

    --TODO: Implement enter logic for the scene

    return self.nodes
end

local update = function(self, scene, timeStep)

    if self.currentFunctionIndex <= #self.loadingFunctions then
        self.loadingFunctions[self.currentFunctionIndex](self)
        self.currentFunctionIndex = self.currentFunctionIndex + 1
    else
        --update scene state.
        njli.World.getInstance():getScene():getPhysicsWorld():enablePause(false)
        njli.World.getInstance():enablePauseAnimation(false)

        --TODO: Implement update logic for the scene

        print(self.particleEmitter:isActive())

        -- print("update (" .. self.sceneState:getName() .. ")")
    end

    return self.nodes
end

local exit = function(self, scene)
    local sceneName = self.sceneState:getName()

    --TODO: Implement exit logic for the scene

    self.unloadFunction(self)

    for k,v in pairs(self.nodes) do
        removeNodeObject(self.nodes[k])
    end
    self.nodes = {}

    -- print("exit (" .. sceneName .. ")")

    return self.nodes
end

local onMessage = function(self, scene, message)
end

local touchDown = function(self, touches)

	local origin = getPerspectiveCamera():unProject(njli.btVector2(touches[1]:getPosition():x(), touches[1]:getPosition():y()))	
	self.touch_nodes[1]:setOrigin(origin + (getPerspectiveCamera():getForwardVector() * self.currentZ))
	self.currentZ = self.currentZ + 1

print(self.touch_nodes[1]:getOrigin())

	self.touch_nodes[1]:setOrigin(bullet.btVector3(touches[1]:getPosition():x(), touches[1]:getPosition():y(), 0))
    self.touch_nodes[1]:getParticleEmitter(0):reset()
    self.touch_nodes[1]:getParticleEmitter(0):start()

    if njli.isIOS() then
        projectile = self:createProjectileNode(touches[1]:getPosition():x()*2, touches[1]:getPosition():y()*2, 4)
    elseif njli.isANDROID() then
        projectile = self:createProjectileNode(touches[1]:getPosition():x(), touches[1]:getPosition():y(), 4)
    end
end

local touchUp = function(self, touches)
end

local touchMove = function(self, touches)
end

local touchCancelled = function(self, touches)
end

local delete = function(self)
    local sceneName = self.sceneState:getName()

	njli.ParticleEmitter.destroy(particleEmitter)
	njli.NodeState.destroy(nodeState)
	njli.Node.destroy(node)
	njli.Sprite2D.destroy(geometry)
	njli.Material.destroy(material)

    njli.SceneState.destroy(self.sceneState)

    print("delete (" .. sceneName .. ")")
end

local methods = 
{   
	-- getDivisor = getDivisor,
	getOriginForLayer = getOriginForLayer,
	transformCoordinate = transformCoordinate,
	createProjectileNode = createProjectileNode,

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

    local loadingFunctions =
    {
		function(self)
			self.material = njli.Material.create()
			self.geometry = njli.Sprite2D.create()


			self.node = njli.Node.create()
			self.nodeState = njli.NodeState.create()

			self.particleEmitter = njli.ParticleEmitter.create()


			local image = njli.Image.create()
			local imagePath = "particles/" .. "particle_water_splash" .. ".png"
			njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)

			self.geometry:addMaterial(self.material, image)
			self.geometry:addShaderProgram(getShaderProgram())

			self.material:getDiffuse():loadGPU(image)
			njli.Image.destroy(image)
		end,
        function(self)
            -- TODO: Create the scene one piece at a time...

            self.touch_nodes = {}

	        self.node:getStateMachine():pushState(self.nodeState)
	        njli.World.getInstance():getScene():getRootNode():addChildNode(self.node)
	        
	        
	        if njli.World.getInstance():getWorldResourceLoader():load("particles/particle_water_splash.pex", self.particleEmitter) then
	            self.node:addParticleEmitter(self.particleEmitter)
	            self.particleEmitter:setup(njli.World.getInstance():getScene():getRootNode(), self.geometry)
	        end

	        self.node:setOrigin(bullet.btVector3(0, 0, 0))

	        self.nodes["pe" .. tostring(1)] = self.node
	        self.touch_nodes[1] = self.node

	        self.particleEmitter:setScale(1)
        end,
       	function(self)
       		self.characterSpriteAtlas, self.characterSheetInfo, self.characterGeometry, self.characterMaterial = createTexturePackerSpriteAtlas("gameplay0", getShaderProgram())
       	end,
        function(self)
        	self.node:show(getOrthoCamera())
        	self.node:show(getPerspectiveCamera())
        end,

    }

    local unloadFunction = function(self)
        -- TODO: Destroy the scene...
    end

    local properties = 
    {
        sceneState = sceneState,
        nodes = {},
        userdata = {},
        loadingFunctions = loadingFunctions,
        unloadFunction = unloadFunction,
        params = params,
        currentZ = 1,
        projectileInstanceCount = 0,
        
        WORLD_YOFFSET = 19.7,
        WORLD_XOFFSET = 0.0,
        LAYER_DISTANCE = 15.24, --meters (50 feet)
        LAYER_MAX = 60.96, --meters (200 feet)
        scale = 89.0,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
