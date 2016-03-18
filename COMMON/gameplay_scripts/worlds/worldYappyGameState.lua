local drawTimeAttackTime = function(self, milliseconds)

    local ms = (milliseconds % 1000)
    local seconds = (milliseconds / 1000) % 60
    local minutes = (milliseconds / 1000) / 60

    local msString = string.format("%.4d", tostring(ms))
    local secondsString = string.format("%.2d", tostring(seconds))
    local minutesString = string.format("%.2d", tostring(minutes))

    local str = minutesString .. ":" .. secondsString .. "." .. msString

    if self.fontToDraw ~= nil and str ~= self.fontToDraw then
        self.fontToDraw = str
        self.textNode:printf(self.fontToDraw)
    end

end

local drawSurvivalTime = function(self, milliseconds)
    local ms = (milliseconds % 1000)
    local seconds = (milliseconds / 1000) % 60
    local minutes = ((milliseconds / 1000) / 60)
    local hours = ((milliseconds / 1000) / (60 * 60))

    local msString = string.format("%.4d", tostring(ms))
    local secondsString = string.format("%.2d", tostring(seconds))
    local minutesString = string.format("%.2d", tostring(minutes))
    local hoursString = string.format("%.2d", tostring(hours))

    local str = hoursString .. ":" .. minutesString .. ":" .. secondsString .. "." .. msString

    if self.fontToDraw ~= nil and str ~= self.fontToDraw then
        self.fontToDraw = str
        self.textNode:printf(self.fontToDraw)
    end

end

local drawNumberBirdsLeft = function(self, number)

    local str = tostring(number) .. " Birds Left"

    if self.fontToDraw ~= nil and str ~= self.fontToDraw then
        self.fontToDraw = str
        self.textNode:printf(self.fontToDraw)
    end

end

local drawPoints = function(self, number)

    local str = string.format("%.9d", tostring(number))

    if self.pointsToDraw ~= nil and str ~= self.pointsToDraw then
        self.pointsToDraw = str
        self.pointsNode:printf(self.pointsToDraw)
    end

end

local playTitleSong = function(self)
    -- print(self.soundMenuTheme:getVolume())
    -- self.soundMenuTheme:setLoopCount(-1)

    if self:isGameSongPlaying() then
        self.soundBackground:stop()
    end

    if self:isMenuSongPlaying() then
        self.soundMenuTheme:stop()
    end

    if not self:isTitleSongPlaying() then
        self.soundTitleTheme:play()
    end
    
end

local playMenuSong = function(self)
    if self:isGameSongPlaying() then
        self.soundBackground:stop()
    end

    if self:isTitleSongPlaying() then
        self.soundTitleTheme:stop()
    end

    if not self:isMenuSongPlaying() then
        self.soundMenuTheme:play()
        self.soundMenuTheme:setLoopCount(-1)
    end
end

local playGameSong = function(self)
    if self:isMenuSongPlaying() then
        self.soundMenuTheme:stop()
    end

    if self:isTitleSongPlaying() then
        self.soundTitleTheme:stop()
    end

    if not self:isGameSongPlaying() then
        self.soundBackground:play()
        self.soundBackground:setLoopCount(-1)
    end
end



local isTitleSongPlaying = function(self)
    return self.soundTitleTheme:isPlaying()
end

local isMenuSongPlaying = function(self)
    return self.soundMenuTheme:isPlaying()
end

local isGameSongPlaying = function(self)
    return self.soundBackground:isPlaying()
end


















local translateDogWayPoints = function(self, points)
    local tx = function(x,y,layer, sublayer)
        local origin = self:getOriginForLayer(x, y, layer, sublayer)
        return self:transformCoordinate(origin)
    end
    local translatedPoints = {}
    local idx = 1

    for k,v in pairs(points) do
        translatedPoints[idx] = tx(v.x, v.y, v.layer, v.sublayer)
        idx = idx + 1
    end

    return translatedPoints

end

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
        local totalDistanceFromCamera = myself.LAYER_MAX

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

local destroyTileNode = function(self, tile)
    self.tileNodes[tile.instanceName] = nil
    self.nodes[tile.instanceName] = nil
    removeNodeObject(tile)
end

local createTileNode = function(self, x, y, layer, opacity, tile, instanceName, sublayer, tileSpriteAtlas, tileGeometry)
    local instanceName = self.tileInstanceCount .. "/" .. tile.image
    self.tileInstanceCount = self.tileInstanceCount + 1

    local obstacleNode = require "nodes.obstacleNode"

    self.nodes[instanceName] = obstacleNode.new(instanceName, tileSpriteAtlas, tileGeometry)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    local origin = self:getOriginForLayer(x, y, layer, sublayer)
    local scaleFactor = (origin:z() / self.LAYER_MAX)

    local width = (tile.width - 2) * scaleFactor
    local height = (tile.height - 2) * scaleFactor
    local divisor = getGameViewDivisor()--self:getDivisor()

    origin = self:transformCoordinate(origin)
    self.nodes[instanceName].node:setOrigin(origin)

    local d = bullet.btVector2( (width / divisor) * 2, (height / divisor) * 2 )
    local pp = bullet.btVector2( 0, 0 )

    self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, d , pp)

    self.nodes[instanceName].node:show(getPerspectiveCamera())

    -- self.levelSpecificNodes[instanceName] = self.nodes[instanceName]
    self.tileNodes[instanceName] = self.nodes[instanceName]

    insertNodeObject(self.nodes[instanceName], instanceName)
end

local destroyDogNode = function(self)
    local instanceName = self.theDog:getNode():getName()

    self.nodes[self.theDog.instanceName] = nil
    removeNodeObject(self.theDog)
    self.theDog = nil

end






local createDogNode_OLD = function(self, points)
    local fileName = dogFilename()
    local instanceName = self.dogInstanceCount .. "/" .. fileName
    self.dogInstanceCount = self.dogInstanceCount + 1

    -- local dogNode = require "nodes.dogNode"
    local dogNode = require "nodes.dogNodeObject"

    self.nodes[instanceName] = dogNode.new(instanceName, self.characterSheetInfo, self.characterSpriteAtlas, self.characterGeometry, points)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)


    -- local frameName = self.nodes[instanceName].frameName
    -- -- print("Getting frame index for frame name: " .. frameName)
    -- local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    -- local sheet = self.characterSheetInfo:getSheet()
    -- local width = sheet.frames[frameIndex].width - 2
    -- local height = sheet.frames[frameIndex].height - 2

    -- local divisor = getGameViewDivisor()--self:getDivisor()
    -- local xdim = (width/divisor)*2
    -- local ydim = ((height/divisor)*2)
    -- local dimSprite = bullet.btVector2( xdim, ydim )
    -- self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite)

    local physicsShape = self.nodes[instanceName].node:getPhysicsBody():getPhysicsShape()
    

    

    local origin = points[1]

    self.nodes[instanceName].node:setOrigin(origin)
    self.nodes[instanceName].node:show(getPerspectiveCamera())

    -- self.levelSpecificNodes[instanceName] = self.nodes[instanceName]

    insertNodeObject(self.nodes[instanceName], instanceName)

    return self.nodes[instanceName]
end




local createDogNode = function(self, points)
    local fileName = dogFilename()
    local instanceName = self.dogInstanceCount .. "/" .. fileName
    self.dogInstanceCount = self.dogInstanceCount + 1

    local Dog = require "nodes.dog.dog"

    self.nodes[instanceName] = Dog.new(instanceName, self.characterSheetInfo, self.characterSpriteAtlas, self.characterGeometry, points)
    insertNodeObject(self.nodes[instanceName], instanceName)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    local origin = points[1]

    self.nodes[instanceName].node:setOrigin(origin)
    self.nodes[instanceName].node:show(getPerspectiveCamera())


    return self.nodes[instanceName]
end

local destroyBirdNode = function(self, birdNode)
    self.level.spawnMachine:killBird()

    self.nodes[birdNode:getBeakNodeObject().instanceName] = nil
    removeNodeObject(birdNode:getBeakNodeObject())

    local instanceName = birdNode.instanceName
    self.nodes[instanceName] = nil
    removeNodeObject(birdNode)

    self.birdFlock[instanceName] = nil

    for k,v in pairs(self.birdFlock) do
        v:setBirdFlock(self.birdFlock)
    end
end

local canCreateBirdNode = function(self)
    return self.theDog ~= nil
end

local createBirdNode = function(self, spawnPoint)

    local fileName = birdTypeToFilename(spawnPoint.birdType)
    local instanceName = self.birdInstanceCount .. "/" .. fileName
    
    self.birdInstanceCount = self.birdInstanceCount + 1

    local Bird = require "nodes.bird.bird"

    self.nodes[instanceName] = Bird.new(instanceName, self.characterSheetInfo, self.characterSpriteAtlas, self.characterGeometry, spawnPoint.birdType, self.theDog, self)
    insertNodeObject(self.nodes[instanceName], instanceName)
    
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    self.nodes[instanceName].node:show(getPerspectiveCamera())

    local origin = self:getOriginForLayer(spawnPoint.x, spawnPoint.y, spawnPoint.layer, spawnPoint.sublayer)
    origin = self:transformCoordinate(origin)

    self.nodes[instanceName].node:setOrigin(origin)

    self.birdFlock[instanceName] = self.nodes[instanceName]

    self.nodes[instanceName]:setBirdFlock(self.birdFlock)

    return self.nodes[instanceName]
end

local destroyProjectileNode = function(self, projectile)
    -- self.levelSpecificNodes[projectile.instanceName] = nil

    removeNodeObject(projectile)
    self.projectileNodes[projectile.instanceName] = nil
    self.nodes[projectile.instanceName] = nil
    
    
end

local createWaterBalloonNode = function(self, x, y)
    local fileName = projectileTypeToFilename(type)

    local instanceName = self.projectileInstanceCount .. "/" .. fileName
    self.projectileInstanceCount = self.projectileInstanceCount + 1

    local Balloon = require "nodes.projectile.balloon.balloon"

    self.nodes[instanceName] = Balloon.new(instanceName, self.characterSheetInfo, self.characterSpriteAtlas, self.characterGeometry, self.particleGeometry, self)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    local origin = self:getOriginForLayer(x, y, 4)
    origin = self:transformCoordinate(origin)

    self.nodes[instanceName].node:setOrigin(origin)

    insertNodeObject(self.nodes[instanceName], instanceName)
    
    self.projectileNodes[instanceName] = self.nodes[instanceName]

    return self.nodes[instanceName]
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

    --  po = getPerspectiveCamera():unProject(bullet.btVector2(xx, yy))

    -- print(self:transformCoordinate(self:getOriginForLayer(xx, yy, 1)))
    -- print(self:transformCoordinate(self:getOriginForLayer(xx, yy, 4)))

    -- po:setZ(200)

    self.nodes[instanceName] = balloonNode.new(self, instanceName, self.characterSheetInfo, self.characterSpriteAtlas, self.characterGeometry, self.particleGeometry)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    

    -- local frameName = self.nodes[instanceName].frameName
    -- local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    -- local sheet = self.characterSheetInfo:getSheet()
    -- local width = sheet.frames[frameIndex].width - 2
    -- local height = sheet.frames[frameIndex].height - 2

    -- local divisor = getGameViewDivisor()--self:getDivisor()
    -- local dimSprite = bullet.btVector2( (width/divisor)*2, (height/divisor)*2 )
    -- local pp = bullet.btVector2( 0.5, 0.5 )
    -- self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite, pp)

    local origin = self:getOriginForLayer(x, y, 4)
    origin = self:transformCoordinate(origin)

    self.nodes[instanceName].node:setOrigin(origin)

    -- self.levelSpecificNodes[instanceName] = self.nodes[instanceName]

    insertNodeObject(self.nodes[instanceName], instanceName)



    
    self.projectileNodes[instanceName] = self.nodes[instanceName]




    

    -- self.nodes[instanceName].node:setOrigin(self.nodes[instanceName].particleOrigin)



    return self.nodes[instanceName]
end

local destroyAllPlayableNodes = function(self)
    -- print("destroyAllPlayableNodes")


    for k,v in pairs(self.birdFlock) do
        -- print(k,v)
        self:destroyBirdNode(v)
    end
    self.birdFlock = {}

    for k,v in pairs(self.projectileNodes) do
        -- print(k,v)
        self:destroyProjectileNode(v)
    end
    self.projectileNodes = {}

    for k,v in pairs(self.tileNodes) do
        -- print(k,v)
        self:destroyTileNode(v)
    end
    self.tileNodes = {}

    self:destroyDogNode()

    -- birdNodes = {},
    --     projectileNodes = {},
    --     tileNodes = {},
end

--################################################################

local addUserData = function(self, key, value)


    self.userdata[key] = value
end

local getUserData = function(self, key)
    return self.userdata[key]
end

local currentState = function(self)
    local scene = njli.World.getInstance():getScene()
    if scene then
        local sceneState = scene:getStateMachine():getState()
        if sceneState then
            return self.sceneStates[sceneState:getName()]
        end
    end

    return nil
end

local push = function(self)
    njli.World.getInstance():getStateMachine():pushState(self.worldState)
end

local enter = function(self)
    print(self.worldState:getName() .. ":enter()")
    -- print_r(self:getUserData("userdata"))
    
    self.currentFunctionIndex = 1






    local path = njli.ASSET_PATH("scripts/interface0.lua")
    
    self.menuSpriteAtlas = njli.buildType((loadfile(path))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

    self.menuMaterial = njli.Material.create()
    local image = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/interface0.png", image)
    self.menuMaterial:getDiffuse():loadGPU(image)
    njli.Image.destroy(image)

    
    self.menuGeometry = njli.Sprite2D.create()
    self.menuGeometry:addMaterial(self.menuMaterial)
    self.menuGeometry:addShaderProgram(getShaderProgram())
    




    local imageNode = require "nodes.imageNode"

    local name = "ui_loading"
    self.nodes[name] = imageNode.new(name, self.menuGeometry, self.menuSpriteAtlas)
    insertNodeObject(self.nodes[name], name)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

    local dimScreen = njli.World.getInstance():getViewportDimensions()
    local origin = bullet.btVector3(dimScreen:x()*.5, dimScreen:y()*.5, 0)

    self.nodes[name].node:setOrigin(origin)
    local menuScale = self.nodes[name]:shouldScale()
    self.nodes[name]:setScale(menuScale)


    self.loadingScreen = self.nodes[name]
    self.loadingScreen.node:show(getOrthoCamera())

    











    local name = "pause"
    local root = "pause"
    local fun = function()
                    pushSceneState(_gameSceneStateNames.pause)
                end
    local toggle = false
    local soundPath = _SOUNDPATHS.interface.effects.select


    local pushButtonNode = require "nodes.pushButtonNode"
    local theNode = pushButtonNode.new(name, root, self.menuGeometry, self.menuSpriteAtlas, menuScale, fun, toggle, soundPath)
    insertNodeObject(theNode, theNode.instanceName)
    njli.World.getInstance():getScene():getRootNode():addChildNode(theNode.node)
    local dimScreen = njli.World.getInstance():getViewportDimensions()
    local x, y = dimScreen:x(), dimScreen:y()
    theNode.node:setOrigin(bullet.btVector3(x-(theNode:getRect():getDimension():x()*2) + 0, 0+(theNode:getRect():getDimension():y()*2) + 0, -1))
    self.nodes[theNode.instanceName] = theNode
    self.pauseButton = theNode
    self.pauseButton.node:hide(getOrthoCamera())



    





    return self.sceneStates
end

local update = function(self, timeStep)
    if self.currentFunctionIndex <= #self.loadingFunctions then
        print(self.worldState:getName() .. ":update(" .. timeStep .. ") - " .. self.currentFunctionIndex .. " of " .. #self.loadingFunctions)
        self.loadingFunctions[self.currentFunctionIndex](self)
        self.currentFunctionIndex = self.currentFunctionIndex + 1

        -- self.loadingScreen.node:show(getPerspectiveCamera())
    else
        self.loadingScreen.node:hide(getOrthoCamera())

        -- print(self:currentState().sceneState:getName())        

        if self:currentState().sceneState:getName() == _gameSceneStateNames.play then
            self.pauseButton.node:show(getOrthoCamera())
            self.textNode.node:show(getOrthoCamera())
        else
            self.pauseButton.node:hide(getOrthoCamera())
            self.textNode.node:hide(getOrthoCamera())
        end




    end

    return self.sceneStates
end

local renderHUD = function(self)
    local state = self:currentState()
    if state ~= nil then
        state:renderHUD()
    end
end

local pause = function(self)

    njli.World.getInstance():enablePauseAnimation()
    njli.World.getInstance():getScene():getPhysicsWorld():setGravity(bullet.btVector3(0,0,0))

    for k,v in pairs(self.birdFlock) do
        v:pause()
    end

    self.theDog:pause()

    for k,v in pairs(self.projectileNodes) do
        v:pause()
    end

end

local unPause = function(self)

    njli.World.getInstance():enablePauseAnimation(false)
    njli.World.getInstance():getScene():getPhysicsWorld():setGravity(self.gravity)

    for k,v in pairs(self.birdFlock) do
        v:unPause()
    end

    if self.theDog then
        self.theDog:unPause()
    end

    for k,v in pairs(self.projectileNodes) do
        v:unPause()
    end

end

local exit = function(self)
    print(self.worldState:getName() .. ":exit()")

    njli.Sound.destroy(self.soundBackground)
    njli.Sound.destroy(self.soundTitleTheme)
    njli.Sound.destroy(self.soundMenuTheme)

    for k,v in pairs(self.characterMaterial) do
        njli.Material.destroy(v)
    end

    for k,v in pairs(self.characterGeometry) do
        njli.Sprite2D.destroy(v)
    end

    for k,v in pairs(self.characterSpriteAtlas) do
        njli.SpriteFrameAtlas.destroy(v)
    end

    njli.Material.destroy(self.tileMaterial)
    njli.Sprite2D.destroy(self.tileGeometry)
    njli.SpriteFrameAtlas.destroy(self.tileSpriteAtlas)

    for k,v in pairs(self.nodes) do
        removeNodeObject(self.nodes[k])
    end
    self.nodes = {}

    for k,v in pairs(self.sceneStates) do
        self.sceneStates[k]:__gc()
    end
    self.sceneStates = {}

    return self.sceneStates
end

local onMessage = function(self, message)
    local state = self:currentState()
    if state ~= nil then
        state:onMessage(message)
    end
end

local touchDown = function(self, touches)
    local state = self:currentState()
    if state ~= nil then
        state:touchDown(touches)
    end
end

local touchUp = function(self, touches)
    local state = self:currentState()
    if state ~= nil then
        state:touchUp(touches)
    end
end

local touchMove = function(self, touches)
    local state = self:currentState()
    if state ~= nil then
        state:touchMove(touches)
    end
end

local touchCancelled = function(self, touches)
    local state = self:currentState()
    if state ~= nil then
        state:touchCancelled(touches)
    end
end

local delete = function(self)
    print(self.worldState:getName() .. ":delete()")

    njli.WorldState.destroy(self.worldState)
end

local methods = 
{
    drawTimeAttackTime = drawTimeAttackTime,
    drawSurvivalTime = drawSurvivalTime,
    drawNumberBirdsLeft = drawNumberBirdsLeft,
    drawPoints = drawPoints,
    playTitleSong = playTitleSong,
    playMenuSong = playMenuSong,
    playGameSong = playGameSong,

    isTitleSongPlaying = isTitleSongPlaying,
    isMenuSongPlaying = isMenuSongPlaying,
    isGameSongPlaying = isGameSongPlaying,







    translateDogWayPoints = translateDogWayPoints,
    getOriginForLayer = getOriginForLayer,
    transformCoordinate = transformCoordinate,

    destroyTileNode = destroyTileNode,
    createTileNode = createTileNode,

    destroyDogNode = destroyDogNode,
    createDogNode = createDogNode,

    destroyBirdNode = destroyBirdNode,
    canCreateBirdNode = canCreateBirdNode,
    createBirdNode_OLD = createBirdNode_OLD,
    createBirdNode = createBirdNode,

    destroyProjectileNode = destroyProjectileNode,
    createProjectileNode = createProjectileNode,
    createWaterBalloonNode = createWaterBalloonNode,

    destroyAllPlayableNodes = destroyAllPlayableNodes,

--####################################################################

    addUserData = addUserData,
    getUserData = getUserData,
       
    currentState = currentState,
    push = push,
    enter = enter,
    update = update,
    renderHUD = renderHUD,
    pause = pause,
    unPause = unPause,
    exit = exit,
    onMessage = onMessage,
    touchDown = touchDown,
    touchUp = touchUp,
    touchMove = touchMove,
    touchCancelled = touchCancelled,
    __gc = delete
}

local new = function(name)
    print("new(" .. name .. ")")

    local worldState = njli.WorldState.create()
    worldState:setName(name)

    local stateObjects =
    {
        material = {},
        geometry = {},
        spriteAtlas = {},
        sound = {},
    }


    local loadingFunctions =
    {
        function(self)
            local menuScene = require "scenes.menuScene"
            for k,v in pairs(_menuSceneStateNames) do
                self.sceneStates[v] = menuScene.new(v, self.menuSpriteAtlas, self.menuMaterial, self.menuGeometry, self)
            end
        end,
        function(self)
            self.soundMenuTheme = njli.Sound.create()
            njli.World.getInstance():getWorldResourceLoader():load(_SOUNDPATHS.interface.music.menu, self.soundMenuTheme)

            self.soundTitleTheme = njli.Sound.create()
            njli.World.getInstance():getWorldResourceLoader():load(_SOUNDPATHS.interface.music.title, self.soundTitleTheme)

            self.soundBackground = njli.Sound.create()
            njli.World.getInstance():getWorldResourceLoader():load(_SOUNDPATHS.gameplay.music.gameplay, self.soundBackground)
        end,

        function(self)
            self.characterSpriteAtlas, self.characterSheetInfo, self.characterGeometry, self.characterMaterial = createTexturePackerSpriteAtlas("gameplay", getShaderProgram())
        end,
        function(self)
            local tileSpriteAtlas, tileSheetInfo, tileGeometry, tileMaterial = createTexturePackerSpriteAtlas("tilesheet_background_country", getShaderProgram())

            self.tileSpriteAtlas = tileSpriteAtlas[1]
            self.tileSheetInfo   = tileSheetInfo[1]
            self.tileGeometry    = tileGeometry[1]
            self.tileMaterial    = tileMaterial[1]
        end,
        function(self)
            -- self.particleGeometry, self.particleMaterial = createParticleGeometryAndMaterial("particle_water_splash.png", getShaderProgram())
        end,
        -- function(self)
        --     local bmf = require 'bitmapFontLoader'
        --     local pushButtonNode = require "nodes.pushButtonNode"
        --     local textNode = require "nodes.textNode"

        --     local bmflabel = bmf.loadFont('Ranchers.fnt')

        --     self.fontMaterial = njli.Material.create()
        --     self.fontGeometry = njli.Sprite2D.create()


        --     local winNode = textNode.new("You Win", 
        --                                     bmflabel, 
        --                                     self.fontMaterial, 
        --                                     self.fontGeometry, 
        --                                     getShaderProgram())
        --     local wordsX = (njli.World.getInstance():getViewportDimensions():x()/2) - (winNode.rect.width / 2)
        --     local wordsY = (njli.World.getInstance():getViewportDimensions():y()/3)
        --     wordsY = wordsY * 2
        --     winNode.node:setOrigin(bullet.btVector3(wordsX, wordsY, 0))

        --     -- winNode.node:show(getOrthoCamera())

        --     local loseNode = textNode.new("You Lose", 
        --                                     bmflabel, 
        --                                     self.fontMaterial, 
        --                                     self.fontGeometry, 
        --                                     getShaderProgram())
        --     wordsX = (njli.World.getInstance():getViewportDimensions():x()/2) - (loseNode.rect.width / 2)
        --     wordsY = (njli.World.getInstance():getViewportDimensions():y()/3)
        --     wordsY = wordsY * 2
        --     loseNode.node:setOrigin(bullet.btVector3(wordsX, wordsY,0))

        --     self.nodes['You Win'] = winNode
        --     self.nodes['You Lose'] = loseNode

        --     insertNodeObject(winNode, 'You Win')
        --     insertNodeObject(loseNode, 'You Lose')
        -- end,
        function(self)

            local imageNode = require "nodes.imageNode"
            local name = "text_YOU_WIN"
            self.nodes[name] = imageNode.new(name, self.menuGeometry, self.menuSpriteAtlas)
            insertNodeObject(self.nodes[name], name)
            njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)
            local dimScreen = njli.World.getInstance():getViewportDimensions()
            local origin = bullet.btVector3(dimScreen:x()*.5, dimScreen:y()*.5, 0)
            self.nodes[name].node:setOrigin(origin)

            local menuScale = self.nodes[name]:shouldScale()
            self.nodes[name]:setScale(menuScale * .25)




            local imageNode = require "nodes.imageNode"
            local name = "text_YOU_LOSE"
            self.nodes[name] = imageNode.new(name, self.menuGeometry, self.menuSpriteAtlas)
            insertNodeObject(self.nodes[name], name)
            njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)
            local dimScreen = njli.World.getInstance():getViewportDimensions()
            local origin = bullet.btVector3(dimScreen:x()*.5, dimScreen:y()*.5, 0)
            self.nodes[name].node:setOrigin(origin)
            local menuScale = self.nodes[name]:shouldScale()
            self.nodes[name]:setScale(menuScale * .25)



        end,
        function(self)
            self.fontMaterial = njli.Material.create()
            self.fontGeometry = njli.Sprite2D.create()
        end,
        function(self)
            local bmf = require 'bitmapFontLoader'
            local textNode = require "nodes.textNode"
            local bmflabel = bmf.loadFont('Ranchers.fnt')


            self.textNode = textNode.new("TIMER", 
                                            bmflabel, 
                                            self.fontMaterial, 
                                            self.fontGeometry, 
                                            getShaderProgram())
            local wordsX = 0
            local wordsY = 0
            wordsY = wordsY * 2
            self.textNode.node:setOrigin(bullet.btVector3(wordsX, wordsY, 0))

            self.nodes['TIMER'] = self.textNode
            insertNodeObject(self.textNode, 'TIMER')

            self.textNode.node:show(getOrthoCamera())

        end,
        -- function(self)
        --     local bmf = require 'bitmapFontLoader'
        --     local textNode = require "nodes.textNode"
        --     local bmflabel = bmf.loadFont('Ranchers.fnt')
            
        --     self.pointsNode = textNode.new("POINTS", 
        --                                     bmflabel, 
        --                                     self.fontMaterial, 
        --                                     self.fontGeometry, 
        --                                     getShaderProgram())
        --     wordsX = (njli.World.getInstance():getViewportDimensions():x()*.5) - (self.pointsNode.rect.width*.5)--(njli.World.getInstance():getViewportDimensions():x()/2) - (self.pointsNode.rect.width / 2)
        --     wordsY = njli.World.getInstance():getViewportDimensions():y() - (self.pointsNode.rect.height)
        --     self.pointsNode.node:setOrigin(bullet.btVector3(wordsX, wordsY, 0))

        --     self.nodes['POINTS'] = self.pointsNode
        --     insertNodeObject(self.pointsNode, 'POINTS')

        --     self.pointsNode.node:show(getOrthoCamera())
        --     self.pointsNode:printf("TEST")
        -- end,
        function(self)
            local assetPath = njli.ASSET_PATH("scripts/Params.lua")
            
            self.Prm = loadfile(assetPath)()
        end,
        -- function(self)
        --     local yappyBirdLevelLoader = require "yappyBirdLevelLoader"
        --     self.level = yappyBirdLevelLoader.new(self)


        --     local gameMode = nil
        --     local gameBoard = nil
        --     local gameLevelNumber = nil

        --     print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        --     print_r(self:getUserData("userdata"))
        --     print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")

        --     if self:getUserData("userdata") ~= nil then
        --         print("FIRST")
        --         gameMode = self:getUserData("userdata").gameMode
        --         gameBoard = self:getUserData("userdata").gameBoard
        --         gameLevelNumber = self:getUserData("userdata").gameLevelNumber

        --     else
        --         print("SECOND")
        --         gameMode = _currentLevel.gameMode
        --         gameBoard = _currentLevel.gameBoard
        --         gameLevelNumber = _currentLevel.gameLevelNumber
        --         self:addUserData("userdata", _currentLevel)
        --     end

        --     _currentLevel.gameMode = gameMode
        --     _currentLevel.gameBoard = gameBoard
        --     _currentLevel.gameLevelNumber = gameLevelNumber


        --     local gameLevel = _gameLevels[gameLevelNumber]

        --     print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        --     print(gameMode, gameBoard, gameLevelNumber, gameLevel)
        --     print_r(self:getUserData("userdata"))
        --     print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")

        --     self.level:loadLevel(gameMode, gameBoard, gameLevel)

        --     self.level:createNodes(self, self.tileSpriteAtlas, self.tileGeometry)

        --     local points = self:translateDogWayPoints(self.level.dogWayPoints)
        --     self.theDog = self:createDogNode(points)
        -- end,

        function(self)

            local gamePlayScene = require "scenes.gamePlayScene"
            self.sceneStates[_gameSceneStateNames.play] = gamePlayScene.new(_gameSceneStateNames.play, self)

            local gamePauseScene = require "scenes.gamePauseScene"
            self.sceneStates[_gameSceneStateNames.pause] = gamePauseScene.new(_gameSceneStateNames.pause, self)

            local gameWinScene = require "scenes.gameWinScene"
            self.sceneStates[_gameSceneStateNames.win] = gameWinScene.new(_gameSceneStateNames.win, self)

            local gameLoseScene = require "scenes.gameLoseScene"
            self.sceneStates[_gameSceneStateNames.lose] = gameLoseScene.new(_gameSceneStateNames.lose, self)




            self.sceneStates[_gameSceneStateNames.pause].menuGeometry = self.menuGeometry
            self.sceneStates[_gameSceneStateNames.pause].menuSpriteAtlas = self.menuSpriteAtlas
        end,







        -- function(self)

            
        -- end,



        function(self)
            -- print(self.soundMenuTheme:getVolume())
            -- self.soundTitleTheme:setLoopCount(-1)
            -- self.soundTitleTheme:play()


            -- for k,v in pairs(self.nodes) do
            --     self.nodes[k].node:show(getPerspectiveCamera())
            -- end
            njli.World.getInstance():setTouchCamera(getOrthoCamera())
            self.sceneStates[_menuSceneStateNames.menu]:push()



            
        end,

    }

    local properties = 
    {
        worldState = worldState,
        stateObjects = stateObjects,
        loadingFunctions = loadingFunctions,

        sceneStates = {},
        userdata = {},
        nodes = {},










        gameBoard = "country",


        WORLD_YOFFSET = 19.7,
        WORLD_XOFFSET = 1.0,
        LAYER_DISTANCE = 15.24, --meters (50 feet)
        LAYER_MAX = 60.96, --meters (200 feet)
        scale = 91.0,

        birdInstanceCount = 0,
        dogInstanceCount = 0,
        projectileInstanceCount = 0,

        tileInstanceCount = 0,
        birdSpawnInstanceCount = 0,
        backgroundInstanceCount = 0,
        
        characterSpriteAtlas = {},
        characterSheetInfo = {},
        characterSheetInfoCount = 0,
        characterGeometry = {},
        characterMaterial = {},


        -- birdNodes = {},
        projectileNodes = {},
        tileNodes = {},

        birdFlock = {},

        gravity = njli.World.getInstance():getScene():getPhysicsWorld():getGravity(),
        -- levelSpecificNodes = {},
        fontToDraw = "",
        pointsToDraw = "",

        
    }

    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
