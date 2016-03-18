local path = njli.ASSET_PATH("scripts/util.lua")
local util = (loadfile(path))()

local function writeAll(file, data)
    local f = assert(io.open(file, "w"))
    
    if f then
		f:write(data)
		f:close()

		print("wrote")
	else
		print("couldn't write")
    end
    
end

local function readAll(file)

    local f = io.open(file, "r")

    if f then
		local content = f:read("*all")
		f:close()
		return content
    end
    
    return nil
end



local allLevelsComplete = function(self, mode)
	if mode == _gameModes.ARCADE or mode == _gameModes.SURVIVAL or mode == _gameModes.TIMEATTACK then
		for k,v in pairs(self.jsonTable[mode]) do
      if self.jsonTable[mode] == 0 then
          --do
          return false
      end
      
		end
		return true
	end

	return nil
end

local isLevelComplete = function(self, mode, level)

	print("checking if isLevelComplete " .. mode .. " " .. level)

  -- print_r(self.jsonTable)
	
	if mode == _gameModes.ARCADE or mode == _gameModes.SURVIVAL or mode == _gameModes.TIMEATTACK then
		if level > 0 and level < 20 then
			if self.jsonTable[mode][level] == 1 then
				return true
			else
				return false
			end
		end
	end
	return nil
end


local completeLevel = function(self, mode, level)
  print('call complete level')
	

	local canAdd = false
	if mode == _gameModes.ARCADE or mode == _gameModes.SURVIVAL or mode == _gameModes.TIMEATTACK then
		if level > 0 and level < 20 then
			canAdd = true
		end
	end	

  -- print('value of canAdd')
  -- print(canAdd)
  -- print("mode")
  -- print(mode)
  -- print("level")
  -- print(level)
	if canAdd then
		self.jsonTable[mode][level] = 1

		local pretty_json_text = self.JSON:encode_pretty(self.jsonTable) -- "pretty printed" version for human readability
		writeAll(njli.DOCUMENT_PATH("strings/levelLock.json"), pretty_json_text)

	end

end

local delete = function(self)
end

local methods = 
{
	allLevelsComplete = allLevelsComplete,
	isLevelComplete = isLevelComplete,
	completeLevel = completeLevel,

    __gc = delete
}

local new = function()
	

    local path = njli.ASSET_PATH("scripts/JSON.lua")
	local JSON = assert(loadfile(path))() -- one-time load of the routines

	local f = io.open(njli.DOCUMENT_PATH("strings/levelLock.json"), "r")

	if f == nil then
		f = io.open(njli.ASSET_PATH("strings/levelLock.json"), "r")
	end

	local jsonData = ""

    if f then
		jsonData = f:read("*all")
		f:close()
    end

    local jsonTable = JSON:decode(jsonData)
	-- print_r(jsonTable)



	local levelData = 
	{
		arcade = {},
		time_attack = {},
		survival = {},
	}

    local properties = 
    {
    	JSON = JSON,
    	jsonTable = jsonTable,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
