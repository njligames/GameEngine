
--Test the functions for LevelOfDetailBuilder
local Test = {}

local function LevelOfDetailBuilder_calculateSerializeBufferSize_()
--//! [LevelOfDetailBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: LevelOfDetailBuilder:calculateSerializeBufferSize()
--//! [LevelOfDetailBuilder_calculateSerializeBufferSize_]

end

local function LevelOfDetailBuilder_serialize_dataBuffer_btSerializer()
--//! [LevelOfDetailBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: LevelOfDetailBuilder:serialize(dataBuffer, btSerializer)
--//! [LevelOfDetailBuilder_serialize_dataBuffer_btSerializer]

end

local function LevelOfDetailBuilder_getObjectType_()
--//! [LevelOfDetailBuilder_getObjectType_]
-- @TODO: Test: LevelOfDetailBuilder:getObjectType()
--//! [LevelOfDetailBuilder_getObjectType_]

end

local function LevelOfDetailBuilder_getClassName_()
--//! [LevelOfDetailBuilder_getClassName_]
-- @TODO: Test: LevelOfDetailBuilder:getClassName()
--//! [LevelOfDetailBuilder_getClassName_]

end

local function LevelOfDetailBuilder_getType_()
--//! [LevelOfDetailBuilder_getType_]
-- @TODO: Test: LevelOfDetailBuilder:getType()
--//! [LevelOfDetailBuilder_getType_]

end

local function LevelOfDetailBuilder_createArray_size()
--//! [LevelOfDetailBuilder_createArray_size]
-- @TODO:Test: NJLI.LevelOfDetailBuilder.createArray(size)
--//! [LevelOfDetailBuilder_createArray_size]

end

local function LevelOfDetailBuilder_destroyArray_array()
--//! [LevelOfDetailBuilder_destroyArray_array]
-- @TODO:Test: NJLI.LevelOfDetailBuilder.destroyArray(array)
--//! [LevelOfDetailBuilder_destroyArray_array]

end

local function LevelOfDetailBuilder_create_()
--//! [LevelOfDetailBuilder_create_]
-- @TODO:Test: NJLI.LevelOfDetailBuilder.create()
--//! [LevelOfDetailBuilder_create_]

end

local function LevelOfDetailBuilder_clone_object()
--//! [LevelOfDetailBuilder_clone_object]
-- @TODO:Test: NJLI.LevelOfDetailBuilder.clone(object)
--//! [LevelOfDetailBuilder_clone_object]

end

local function LevelOfDetailBuilder_destroy_object()
--//! [LevelOfDetailBuilder_destroy_object]
-- @TODO:Test: NJLI.LevelOfDetailBuilder.destroy(object)
--//! [LevelOfDetailBuilder_destroy_object]

end

local function LevelOfDetailBuilder_load_object_L_stack_index()
--//! [LevelOfDetailBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.LevelOfDetailBuilder.load(object, L, stack_index)
--//! [LevelOfDetailBuilder_load_object_L_stack_index]

end

local function LevelOfDetailBuilder_type_()
--//! [LevelOfDetailBuilder_type_]
-- @TODO:Test: NJLI.LevelOfDetailBuilder.type()
--//! [LevelOfDetailBuilder_type_]

end


function Test:testAll()
	LevelOfDetailBuilder_calculateSerializeBufferSize_()
	LevelOfDetailBuilder_serialize_dataBuffer_btSerializer()
	LevelOfDetailBuilder_getObjectType_()
	LevelOfDetailBuilder_getClassName_()
	LevelOfDetailBuilder_getType_()
	LevelOfDetailBuilder_createArray_size()
	LevelOfDetailBuilder_destroyArray_array()
	LevelOfDetailBuilder_create_()
	LevelOfDetailBuilder_clone_object()
	LevelOfDetailBuilder_destroy_object()
	LevelOfDetailBuilder_load_object_L_stack_index()
	LevelOfDetailBuilder_type_()
end

return Test