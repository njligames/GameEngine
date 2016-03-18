
--Test the functions for LuaBuilder
local Test = {}

local function LuaBuilder_calculateSerializeBufferSize_()
--//! [LuaBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: LuaBuilder:calculateSerializeBufferSize()
--//! [LuaBuilder_calculateSerializeBufferSize_]

end

local function LuaBuilder_serialize_dataBuffer_btSerializer()
--//! [LuaBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: LuaBuilder:serialize(dataBuffer, btSerializer)
--//! [LuaBuilder_serialize_dataBuffer_btSerializer]

end

local function LuaBuilder_getObjectType_()
--//! [LuaBuilder_getObjectType_]
-- @TODO: Test: LuaBuilder:getObjectType()
--//! [LuaBuilder_getObjectType_]

end

local function LuaBuilder_getClassName_()
--//! [LuaBuilder_getClassName_]
-- @TODO: Test: LuaBuilder:getClassName()
--//! [LuaBuilder_getClassName_]

end

local function LuaBuilder_getType_()
--//! [LuaBuilder_getType_]
-- @TODO: Test: LuaBuilder:getType()
--//! [LuaBuilder_getType_]

end

local function LuaBuilder_createArray_size()
--//! [LuaBuilder_createArray_size]
-- @TODO:Test: NJLI.LuaBuilder.createArray(size)
--//! [LuaBuilder_createArray_size]

end

local function LuaBuilder_destroyArray_array()
--//! [LuaBuilder_destroyArray_array]
-- @TODO:Test: NJLI.LuaBuilder.destroyArray(array)
--//! [LuaBuilder_destroyArray_array]

end

local function LuaBuilder_create_()
--//! [LuaBuilder_create_]
-- @TODO:Test: NJLI.LuaBuilder.create()
--//! [LuaBuilder_create_]

end

local function LuaBuilder_clone_object()
--//! [LuaBuilder_clone_object]
-- @TODO:Test: NJLI.LuaBuilder.clone(object)
--//! [LuaBuilder_clone_object]

end

local function LuaBuilder_destroy_object()
--//! [LuaBuilder_destroy_object]
-- @TODO:Test: NJLI.LuaBuilder.destroy(object)
--//! [LuaBuilder_destroy_object]

end

local function LuaBuilder_load_object_L_stack_index()
--//! [LuaBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.LuaBuilder.load(object, L, stack_index)
--//! [LuaBuilder_load_object_L_stack_index]

end

local function LuaBuilder_type_()
--//! [LuaBuilder_type_]
-- @TODO:Test: NJLI.LuaBuilder.type()
--//! [LuaBuilder_type_]

end


function Test:testAll()
	LuaBuilder_calculateSerializeBufferSize_()
	LuaBuilder_serialize_dataBuffer_btSerializer()
	LuaBuilder_getObjectType_()
	LuaBuilder_getClassName_()
	LuaBuilder_getType_()
	LuaBuilder_createArray_size()
	LuaBuilder_destroyArray_array()
	LuaBuilder_create_()
	LuaBuilder_clone_object()
	LuaBuilder_destroy_object()
	LuaBuilder_load_object_L_stack_index()
	LuaBuilder_type_()
end

return Test