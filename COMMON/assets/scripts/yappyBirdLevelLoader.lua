







function extractLayersFromName(layerName)
 local layer, subLayer = 1, 1

 
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

 
 local path = njli.ASSET_PATH(luaPath)
 
 local level = loadfile(path)()


 self.backgroundColor = bullet.btVector4(level.backgroundcolor[1]/255,
 level.backgroundcolor[2]/255,
 level.backgroundcolor[3]/255,1.0)

 
 local tiles = {}
 local offset = 0
 for j=1,#level.tilesets do

 local id = level.tilesets[j].firstgid
 
 for i=1,#level.tilesets[j].tiles do
 local tile = level.tilesets[j].tiles[i]

 

 tiles[id] = {}
 tiles[id].width = tile.width
 tiles[id].height = tile.height

 local img = string.sub(tile.image, 1, string.find(tile.image, ".png")-1)
 

 img = string.reverse(img)
 

 if string.find(img, '/') ~= nil then
 img = string.sub(img, 1,string.find(img, '/')-1)
 
 end

 img = string.reverse(img)
 

 
 
 tiles[id].image = img

 id = id + 1
 end

 offset = offset + 1
 end

 

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
 
 

 
 
 
 
 
 
 

 
 
 elseif object.type == "dogWayPoint" then

 
 
 
 
 
 

 
 
 
 
 
 
 

 
 

 local point = 
 {
 x = object.x,
 y = 2048 - object.y,
 
 layer = currentObjectLayer,
 sublayer = currentSubObjectLayer,
 }
 table.insert(self.dogWayPoints, point)

 self.wayPointInstanceCount = self.wayPointInstanceCount + 1
 end
 end

 
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
 
end

local methods = 
{
 
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
 

 local birdSpawnMachine = require "birdSpawnMachine"
 local spawnMachine = birdSpawnMachine.new()

 
 
 
 
 

 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 local tiles = {}
 local dogWayPoints = {}

 local properties = 
 {
 
 
 
 

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

 

 
 }
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
