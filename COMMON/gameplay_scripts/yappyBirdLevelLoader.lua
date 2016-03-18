-- Using LDoc..
--      https://github.com/stevedonovan/LDoc

--- Extract the layer and subLayer number from the layer name.
-- The layer.name for tile layers should be in the form:
--      tileLayer_LAYERNUMBER_SUBLAYERNUMBER
-- @param layerName The name of the layer
-- @return layer and subLayer
function extractLayersFromName(layerName)
    local layer, subLayer = 1, 1

    --tileLayer_LAYERNUMBER_SUBLAYERNUMBER
    local length = string.len(layerName)
    local startLayer = string.find(layerName, ";")

    if startLayer ~= nil then
        local layerString = string.sub(layerName, startLayer + 1, length)
        length = string.len(layerString)
        startLayer = string.find(layerString, "_")
        if startLayer ~= nil then
            layer = tonumber(string.sub(layerString, 1, startLayer - 1))
            subLayer = tonumber(string.sub(layerString, startLayer + 1, length))
        end
    end

    assert(layer ~= nil, "Unable to extract layer")
    assert(subLayer ~= nil, "Unable to extract subLayer")

    return layer, subLayer
end



local isArcade = function(self)
    return self.gameMode == _gameModes.ARCADE
end

local isSurvival = function(self)
    return self.gameMode == _gameModes.SURVIVAL
end

local isTimeAttack = function(self)
    return self.gameMode == _gameModes.TIMEATTACK
end

local currentLevel = function(self)
    return self.gameLevel
end

local currentMode = function(self)
    return self.gameMode
end

local loadLevel = function(self, gameMode, gameBoard, gameLevel)
    
    self.spawnMachine:clearPoints()

    self.gameMode = gameMode
    self.gameBoard = gameBoard 

    self.gameLevel = gameLevel

    local luaPath = "scripts/levels/" .. gameMode .. "_" .. gameBoard .. "_" .. gameLevel .. ".lua"
    local texturePackerImage = ""

    -- print(luaPath)
    local path = njli.ASSET_PATH(luaPath)
    
    local level = loadfile(path)()


    self.backgroundColor = bullet.btVector4(level.backgroundcolor[1]/255,
                                            level.backgroundcolor[2]/255,
                                            level.backgroundcolor[3]/255,1.0)

    -- Load the tiles...
    local tiles = {}
    local offset = 0
    for j=1,#level.tilesets do

        local id = level.tilesets[j].firstgid
        
        for i=1,#level.tilesets[j].tiles do
            local tile = level.tilesets[j].tiles[i]

            -- print_r(tile)

            tiles[id] = {}
            tiles[id].width = tile.width
            tiles[id].height = tile.height

            local img = string.sub(tile.image, 1, string.find(tile.image, ".png")-1)
            -- print("The img `" .. img .. "`")

            img = string.reverse(img)
            -- print("The img `" .. img .. "`")

            if string.find(img, '/') ~= nil then
                img = string.sub(img, 1,string.find(img, '/')-1)
                -- print("The img `" .. img .. "`")
            end

            img = string.reverse(img)
            -- print("The img `" .. img .. "`")

            
            
            tiles[id].image = img

            id = id + 1
        end

        offset = offset + 1
    end

    -- local currentBackgroundLayer = 1

    local currentLayerCounter = 1

    local currentTileLayer = 1
    local currentSubTileLayer = 1

    local currentObjectLayer = 1
    local currentSubObjectLayer = 1

    for i=1,#level.layers do

        local layer = level.layers[i]

        if layer.visible then
            assert(layer.type ~= "imagelayer", "Shouldn't have an imagelayer...")
            if layer.type == "objectgroup" then
                --For the objectgroup layer, opacity means likely hood to spawn from this layer

                currentObjectLayer, currentSubObjectLayer = extractLayersFromName(layer.name)

                for i = 1, #layer.objects do
                    local object = layer.objects[i]

                    if object.type == "birdSpawnPoint" then
                        local id = object.id

                        local spawnPoint = {}
                        spawnPoint.shape = object.shape

                        spawnPoint.x = object.x
                        spawnPoint.y = 2048 - object.y
                        spawnPoint.width = object.width
                        spawnPoint.height = object.height
                        spawnPoint.rotation = object.rotation
                        spawnPoint.enabled = object.visible
                        spawnPoint.name = object.name
                        -- spawnPoint.layer = currentObjectLayer
                        spawnPoint.layer = currentObjectLayer
                        spawnPoint.sublayer = currentSubObjectLayer
                        spawnPoint.likelyhood = layer.opacity
                        spawnPoint.id = id

                        assert(object.properties.timeStart ~= nil, "There must be a timeStart property on the bird spawn point.")
                        spawnPoint.timeStart = tonumber(object.properties.timeStart)

                        assert(object.properties.timeFrequency ~= nil, "There must be a timeFrequency property on the bird spawn point.")
                        spawnPoint.timeFrequency = tonumber(object.properties.timeFrequency)

                        assert(object.properties.birdType ~= nil, "There must be a birdType property on the bird spawn point.")
                        spawnPoint.birdType = object.properties.birdType

                        assert(object.properties.spawnAmount ~= nil, "There must be a spawnAmount property on the bird spawn point.")
                        spawnPoint.spawnAmount = tonumber(object.properties.spawnAmount)
                        self.spawnMachine.numberBirdsToSpawn = self.spawnMachine.numberBirdsToSpawn + tonumber(object.properties.spawnAmount)

                        assert(object.properties.initialVelocity ~= nil, "There must be a initialVelocity property on the bird spawn point.")
                        spawnPoint.initialVelocity = tonumber(object.properties.initialVelocity)

-- _gameModes = {
--     ARCADE = "arcade",
--     SURVIVAL = "survival",
--     TIMEATTACK = "time_attack",
-- }
                        if self:isArcade() then
                            self.spawnMachine:addArcadeSpawnPoint(spawnPoint)
                            self.spawnPointInstanceCount = self.spawnPointInstanceCount + 1
                        elseif self:isSurvival() then
                            self.spawnMachine:addSurvivalSpawnPoint(spawnPoint)
                            self.spawnPointInstanceCount = self.spawnPointInstanceCount + 1
                        elseif self:isTimeAttack() then
                            self.spawnMachine:addTimeAttackSpawnPoint(spawnPoint)
                            self.spawnPointInstanceCount = self.spawnPointInstanceCount + 1
                        end
                        
                        -- print_r(spawnPoint)

                        -- local instanceName = self.spawnPointInstanceCount .. "/" .. spawnPoint.name
                        -- local spawnPointInfo = {
                        --     layer = currentObjectLayer,
                        --     opacity = layer.opacity,
                        --     spawnPoint = spawnPoint,
                        --     instanceName = instanceName,
                        -- }

                        -- self.levelInfo.spawnPoints[instanceName] = spawnPointInfo
                        
                    elseif object.type == "dogWayPoint" then

                        -- local wayPoint = {
                        --     x = object.x,
                        --     y = object.y,
                        --     pathIndex = object.pathIndex,
                        --     name = object.name,
                        -- }

                        -- local instanceName = self.wayPointInstanceCount .. "/" .. wayPoint.name
                        -- local dogWayPointInfo = {
                        --     layer = currentObjectLayer,
                        --     opacity = layer.opacity,
                        --     wayPoint = wayPoint,
                        --     instanceName = instanceName,
                        -- }

                        -- self.njli.SOLVER_DISABLE_VELOCITY_DEPENDENT_FRICTION_DIRECTION.dogWayPoints[instanceName] = dogWayPointInfo
                        

                        local point = 
                        {
                            x = object.x,
                            y = 2048 - object.y,
                            -- layer = currentObjectLayer,
                            layer = currentObjectLayer,
                            sublayer = currentSubObjectLayer,
                        }
                        table.insert(self.dogWayPoints, point)

                        self.wayPointInstanceCount = self.wayPointInstanceCount + 1
                    end
                end

                -- currentObjectLayer = currentObjectLayer + 1
            elseif layer.type == "tilelayer" then
                local x = layer.x
                local y = layer.y + ((layer.height * level.tileheight) - (level.tilewidth))
                local opacity = layer.opacity

                currentTileLayer, currentSubTileLayer = extractLayersFromName(layer.name)

                for j=1,#layer.data do
                    if layer.data[j] ~= 0 then
                        local tile = tiles[layer.data[j]]

                        local instanceName = self.tileInstanceCount .. "/" .. tile.image
                        local tileInfo = {
                            x = x,
                            y = y,
                            layer = currentTileLayer,
                            sublayer = currentSubTileLayer,
                            opacity = opacity,
                            tile = tile,
                            instanceName = instanceName,
                        }

                        -- print_r(tileInfo)

                        self.tiles[instanceName] = tileInfo

                        self.tileInstanceCount = self.tileInstanceCount + 1
                    end
                    x = x + (level.tilewidth)
                    if x >= (layer.width * level.tilewidth) then
                        x = layer.x
                        y = y - (level.tileheight)
                    end
                end

                currentLayerCounter = currentLayerCounter + 1
            end
        end
    end
end

local debugPrint = function(self)
    -- print("#######################################################")

    -- for i=1,#self.levelInfo.backgrounds do
    --     print_r(self.levelInfo.backgrounds[i])
    -- end

    -- print_r(self.levelInfo.tiles)
    -- print_r(self.levelInfo.spawnPoints)
    -- print_r(self.levelInfo.dogWayPoints)

    -- for i=1,#self.levelInfo.tiles do
    --     print_r(self.levelInfo.tiles[i])
    -- end

    -- for i=1,#self.levelInfo.spawnPoints do
    --     print_r(self.levelInfo.spawnPoints[i])
    -- end

    -- for i=1,#self.levelInfo.dogWayPoints do
    --     print_r(self.levelInfo.dogWayPoints[i])
    -- end

    -- print("#######################################################")
end

local createNodes = function(self, scene, tileSpriteAtlas, tileGeometry)
    if scene ~= nil then

        for k,v in pairs(self.tiles) do
            local t = self.tiles[k]
            scene:createTileNode(t.x, t.y, t.layer, t.opacity, t.tile, t.instanceName, t.sublayer, tileSpriteAtlas, tileGeometry)
        end

    else
        print("Scene is nil")
    end
    
end

local totalBirds = function(self)
    return self.spawnMachine.numberBirdsToSpawn
end

local delete = function(self)
    --TODO: clean up memoryloadLevel
end

local methods = 
{
    --TODO: Add functions here...
    isArcade = isArcade,
    isSurvival = isSurvival,
    isTimeAttack = isTimeAttack,




    currentLevel = currentLevel,
    currentMode = currentMode,



    loadLevel = loadLevel,
    debugPrint = debugPrint,
    createNodes = createNodes,
    totalBirds = totalBirds,

    __gc = delete
}

local new = function()
    --TODO: Implement the constructor for this object.

    local birdSpawnMachine = require "birdSpawnMachine"
    local spawnMachine = birdSpawnMachine.new()

    -- local gameModes = {
    --     ARCADE = "arcade",
    --     SURVIVAL = "survival",
    --     TIMEATTACK = "timeAttack",
    -- }

    -- local gameBoards = {
    --     COUNTRY = "country",
    --     CITY = "city",
    -- }

    -- local gameLevels = {
    --     "00",
    --     "01",
    --     "02",
    --     "03",
    --     "04",
    --     "05",
    --     "06",
    --     "07",
    --     "08",
    --     "09",
    --     "10",
    --     "11",
    --     "12",
    --     "13",
    --     "14",
    --     "15",
    --     "16",
    --     "17",
    --     "18",
    --     "19",
    --     "20",
    -- }

    
    local tiles = {}
    local dogWayPoints = {}

    local properties = 
    {
        --TODO: Add variables here...
        -- gameModes = gameModes,
        -- gameBoards = gameBoards,
        -- gameLevels = gameLevels,

        tileInstanceCount = 0,
        backgroundInstanceCount = 0,
        spawnPointInstanceCount = 0,
        wayPointInstanceCount = 0,

        tiles = tiles,
        dogWayPoints = dogWayPoints,

        gameMode = nil, 
        gameBoard = nil, 
        gameLevel = nil,

        spawnMachine = spawnMachine,

        -- numberBirdsToSpawn = 0,

        -- Don't delete...
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
