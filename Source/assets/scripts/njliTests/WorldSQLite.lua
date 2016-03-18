
--Test the functions for WorldSQLite
local Test = {}

local function WorldSQLite_WorldSQLite_()
--//! [WorldSQLite_WorldSQLite_]
-- @TODO: Test: WorldSQLite:WorldSQLite()
--//! [WorldSQLite_WorldSQLite_]

end

local function WorldSQLite_openDatabase_database_name()
--//! [WorldSQLite_openDatabase_database_name]
-- @TODO: Test: WorldSQLite:openDatabase(database_name)
--//! [WorldSQLite_openDatabase_database_name]

end

local function WorldSQLite_getBool_key()
--//! [WorldSQLite_getBool_key]
-- @TODO: Test: WorldSQLite:getBool(key)
--//! [WorldSQLite_getBool_key]

end

local function WorldSQLite_setBool_key_value()
--//! [WorldSQLite_setBool_key_value]
-- @TODO: Test: WorldSQLite:setBool(key, value)
--//! [WorldSQLite_setBool_key_value]

end

local function WorldSQLite_getInt_key()
--//! [WorldSQLite_getInt_key]
-- @TODO: Test: WorldSQLite:getInt(key)
--//! [WorldSQLite_getInt_key]

end

local function WorldSQLite_setInt_key_value()
--//! [WorldSQLite_setInt_key_value]
-- @TODO: Test: WorldSQLite:setInt(key, value)
--//! [WorldSQLite_setInt_key_value]

end

local function WorldSQLite_getFloat_key()
--//! [WorldSQLite_getFloat_key]
-- @TODO: Test: WorldSQLite:getFloat(key)
--//! [WorldSQLite_getFloat_key]

end

local function WorldSQLite_setFloat_key_value()
--//! [WorldSQLite_setFloat_key_value]
-- @TODO: Test: WorldSQLite:setFloat(key, value)
--//! [WorldSQLite_setFloat_key_value]

end

local function WorldSQLite_getString_key()
--//! [WorldSQLite_getString_key]
-- @TODO: Test: WorldSQLite:getString(key)
--//! [WorldSQLite_getString_key]

end

local function WorldSQLite_setString_key_value()
--//! [WorldSQLite_setString_key_value]
-- @TODO: Test: WorldSQLite:setString(key, value)
--//! [WorldSQLite_setString_key_value]

end

local function WorldSQLite_createFile_filename_buffer()
--//! [WorldSQLite_createFile_filename_buffer]
-- @TODO: Test: WorldSQLite:createFile(filename, buffer)
--//! [WorldSQLite_createFile_filename_buffer]

end

local function WorldSQLite_readFile_filename()
--//! [WorldSQLite_readFile_filename]
-- @TODO: Test: WorldSQLite:readFile(filename)
--//! [WorldSQLite_readFile_filename]

end

local function WorldSQLite_updateFile_filename_offset_size_buffer()
--//! [WorldSQLite_updateFile_filename_offset_size_buffer]
-- @TODO: Test: WorldSQLite:updateFile(filename, offset, size, buffer)
--//! [WorldSQLite_updateFile_filename_offset_size_buffer]

end

local function WorldSQLite_deleteFile_filename()
--//! [WorldSQLite_deleteFile_filename]
-- @TODO: Test: WorldSQLite:deleteFile(filename)
--//! [WorldSQLite_deleteFile_filename]

end

local function WorldSQLite_setBuffer_void_size()
--//! [WorldSQLite_setBuffer_void_size]
-- @TODO:Test: NJLI.WorldSQLite.setBuffer(void, size)
--//! [WorldSQLite_setBuffer_void_size]

end

local function WorldSQLite_createBuffer_()
--//! [WorldSQLite_createBuffer_]
-- @TODO:Test: NJLI.WorldSQLite.createBuffer()
--//! [WorldSQLite_createBuffer_]

end

local function WorldSQLite_deleteBuffer_()
--//! [WorldSQLite_deleteBuffer_]
-- @TODO:Test: NJLI.WorldSQLite.deleteBuffer()
--//! [WorldSQLite_deleteBuffer_]

end

local function WorldSQLite_WorldSQLite_()
--//! [WorldSQLite_WorldSQLite_]
-- @TODO:Test: NJLI.WorldSQLite.WorldSQLite()
--//! [WorldSQLite_WorldSQLite_]

end

local function WorldSQLite_operator=_()
--//! [WorldSQLite_operator=_]
-- @TODO:Test: NJLI.WorldSQLite.operator=()
--//! [WorldSQLite_operator=_]

end


function Test:testAll()
	WorldSQLite_WorldSQLite_()
	WorldSQLite_openDatabase_database_name()
	WorldSQLite_getBool_key()
	WorldSQLite_setBool_key_value()
	WorldSQLite_getInt_key()
	WorldSQLite_setInt_key_value()
	WorldSQLite_getFloat_key()
	WorldSQLite_setFloat_key_value()
	WorldSQLite_getString_key()
	WorldSQLite_setString_key_value()
	WorldSQLite_createFile_filename_buffer()
	WorldSQLite_readFile_filename()
	WorldSQLite_updateFile_filename_offset_size_buffer()
	WorldSQLite_deleteFile_filename()
	WorldSQLite_setBuffer_void_size()
	WorldSQLite_createBuffer_()
	WorldSQLite_deleteBuffer_()
	WorldSQLite_WorldSQLite_()
	WorldSQLite_operator=_()
end

return Test