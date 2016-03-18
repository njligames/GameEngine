
--Test the functions for Lua
local Test = {}

local function Lua_calculateSerializeBufferSize_()
--//! [Lua_calculateSerializeBufferSize_]
-- @TODO: Test: Lua:calculateSerializeBufferSize()
--//! [Lua_calculateSerializeBufferSize_]

end

local function Lua_serialize_dataBuffer_btSerializer()
--//! [Lua_serialize_dataBuffer_btSerializer]
-- @TODO: Test: Lua:serialize(dataBuffer, btSerializer)
--//! [Lua_serialize_dataBuffer_btSerializer]

end

local function Lua_getClassName_()
--//! [Lua_getClassName_]
-- @TODO: Test: Lua:getClassName()
--//! [Lua_getClassName_]

end

local function Lua_getType_()
--//! [Lua_getType_]
-- @TODO: Test: Lua:getType()
--//! [Lua_getType_]

end

local function Lua_createArray_size()
--//! [Lua_createArray_size]
-- @TODO:Test: NJLI.Lua.createArray(size)
--//! [Lua_createArray_size]

end

local function Lua_destroyArray_array()
--//! [Lua_destroyArray_array]
-- @TODO:Test: NJLI.Lua.destroyArray(array)
--//! [Lua_destroyArray_array]

end

local function Lua_create_()
--//! [Lua_create_]
-- @TODO:Test: NJLI.Lua.create()
--//! [Lua_create_]

end

local function Lua_create_builder()
--//! [Lua_create_builder]
-- @TODO:Test: NJLI.Lua.create(builder)
--//! [Lua_create_builder]

end

local function Lua_clone_object()
--//! [Lua_clone_object]
-- @TODO:Test: NJLI.Lua.clone(object)
--//! [Lua_clone_object]

end

local function Lua_copy_object()
--//! [Lua_copy_object]
-- @TODO:Test: NJLI.Lua.copy(object)
--//! [Lua_copy_object]

end

local function Lua_destroy_object()
--//! [Lua_destroy_object]
-- @TODO:Test: NJLI.Lua.destroy(object)
--//! [Lua_destroy_object]

end

local function Lua_load_object_L_stack_index()
--//! [Lua_load_object_L_stack_index]
-- @TODO:Test: NJLI.Lua.load(object, L, stack_index)
--//! [Lua_load_object_L_stack_index]

end

local function Lua_type_()
--//! [Lua_type_]
-- @TODO:Test: NJLI.Lua.type()
--//! [Lua_type_]

end


function Test:testAll()
	Lua_calculateSerializeBufferSize_()
	Lua_serialize_dataBuffer_btSerializer()
	Lua_getClassName_()
	Lua_getType_()
	Lua_createArray_size()
	Lua_destroyArray_array()
	Lua_create_()
	Lua_create_builder()
	Lua_clone_object()
	Lua_copy_object()
	Lua_destroy_object()
	Lua_load_object_L_stack_index()
	Lua_type_()
end

return Test