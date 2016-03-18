
--Test the functions for LightBuilder
local Test = {}

local function LightBuilder_calculateSerializeBufferSize_()
--//! [LightBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: LightBuilder:calculateSerializeBufferSize()
--//! [LightBuilder_calculateSerializeBufferSize_]

end

local function LightBuilder_serialize_dataBuffer_btSerializer()
--//! [LightBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: LightBuilder:serialize(dataBuffer, btSerializer)
--//! [LightBuilder_serialize_dataBuffer_btSerializer]

end

local function LightBuilder_getObjectType_()
--//! [LightBuilder_getObjectType_]
-- @TODO: Test: LightBuilder:getObjectType()
--//! [LightBuilder_getObjectType_]

end

local function LightBuilder_getClassName_()
--//! [LightBuilder_getClassName_]
-- @TODO: Test: LightBuilder:getClassName()
--//! [LightBuilder_getClassName_]

end

local function LightBuilder_getType_()
--//! [LightBuilder_getType_]
-- @TODO: Test: LightBuilder:getType()
--//! [LightBuilder_getType_]

end

local function LightBuilder_createArray_size()
--//! [LightBuilder_createArray_size]
-- @TODO:Test: NJLI.LightBuilder.createArray(size)
--//! [LightBuilder_createArray_size]

end

local function LightBuilder_destroyArray_array()
--//! [LightBuilder_destroyArray_array]
-- @TODO:Test: NJLI.LightBuilder.destroyArray(array)
--//! [LightBuilder_destroyArray_array]

end

local function LightBuilder_create_()
--//! [LightBuilder_create_]
-- @TODO:Test: NJLI.LightBuilder.create()
--//! [LightBuilder_create_]

end

local function LightBuilder_clone_object()
--//! [LightBuilder_clone_object]
-- @TODO:Test: NJLI.LightBuilder.clone(object)
--//! [LightBuilder_clone_object]

end

local function LightBuilder_destroy_object()
--//! [LightBuilder_destroy_object]
-- @TODO:Test: NJLI.LightBuilder.destroy(object)
--//! [LightBuilder_destroy_object]

end

local function LightBuilder_load_object_L_stack_index()
--//! [LightBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.LightBuilder.load(object, L, stack_index)
--//! [LightBuilder_load_object_L_stack_index]

end

local function LightBuilder_type_()
--//! [LightBuilder_type_]
-- @TODO:Test: NJLI.LightBuilder.type()
--//! [LightBuilder_type_]

end


function Test:testAll()
	LightBuilder_calculateSerializeBufferSize_()
	LightBuilder_serialize_dataBuffer_btSerializer()
	LightBuilder_getObjectType_()
	LightBuilder_getClassName_()
	LightBuilder_getType_()
	LightBuilder_createArray_size()
	LightBuilder_destroyArray_array()
	LightBuilder_create_()
	LightBuilder_clone_object()
	LightBuilder_destroy_object()
	LightBuilder_load_object_L_stack_index()
	LightBuilder_type_()
end

return Test