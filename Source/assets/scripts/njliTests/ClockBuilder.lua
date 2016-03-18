
--Test the functions for ClockBuilder
local Test = {}

local function ClockBuilder_calculateSerializeBufferSize_()
--//! [ClockBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: ClockBuilder:calculateSerializeBufferSize()
--//! [ClockBuilder_calculateSerializeBufferSize_]

end

local function ClockBuilder_serialize_dataBuffer_btSerializer()
--//! [ClockBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: ClockBuilder:serialize(dataBuffer, btSerializer)
--//! [ClockBuilder_serialize_dataBuffer_btSerializer]

end

local function ClockBuilder_getObjectType_()
--//! [ClockBuilder_getObjectType_]
-- @TODO: Test: ClockBuilder:getObjectType()
--//! [ClockBuilder_getObjectType_]

end

local function ClockBuilder_getClassName_()
--//! [ClockBuilder_getClassName_]
-- @TODO: Test: ClockBuilder:getClassName()
--//! [ClockBuilder_getClassName_]

end

local function ClockBuilder_getType_()
--//! [ClockBuilder_getType_]
-- @TODO: Test: ClockBuilder:getType()
--//! [ClockBuilder_getType_]

end

local function ClockBuilder_createArray_size()
--//! [ClockBuilder_createArray_size]
-- @TODO:Test: NJLI.ClockBuilder.createArray(size)
--//! [ClockBuilder_createArray_size]

end

local function ClockBuilder_destroyArray_array()
--//! [ClockBuilder_destroyArray_array]
-- @TODO:Test: NJLI.ClockBuilder.destroyArray(array)
--//! [ClockBuilder_destroyArray_array]

end

local function ClockBuilder_create_()
--//! [ClockBuilder_create_]
-- @TODO:Test: NJLI.ClockBuilder.create()
--//! [ClockBuilder_create_]

end

local function ClockBuilder_clone_object()
--//! [ClockBuilder_clone_object]
-- @TODO:Test: NJLI.ClockBuilder.clone(object)
--//! [ClockBuilder_clone_object]

end

local function ClockBuilder_destroy_object()
--//! [ClockBuilder_destroy_object]
-- @TODO:Test: NJLI.ClockBuilder.destroy(object)
--//! [ClockBuilder_destroy_object]

end

local function ClockBuilder_load_object_L_stack_index()
--//! [ClockBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.ClockBuilder.load(object, L, stack_index)
--//! [ClockBuilder_load_object_L_stack_index]

end

local function ClockBuilder_type_()
--//! [ClockBuilder_type_]
-- @TODO:Test: NJLI.ClockBuilder.type()
--//! [ClockBuilder_type_]

end


function Test:testAll()
	ClockBuilder_calculateSerializeBufferSize_()
	ClockBuilder_serialize_dataBuffer_btSerializer()
	ClockBuilder_getObjectType_()
	ClockBuilder_getClassName_()
	ClockBuilder_getType_()
	ClockBuilder_createArray_size()
	ClockBuilder_destroyArray_array()
	ClockBuilder_create_()
	ClockBuilder_clone_object()
	ClockBuilder_destroy_object()
	ClockBuilder_load_object_L_stack_index()
	ClockBuilder_type_()
end

return Test