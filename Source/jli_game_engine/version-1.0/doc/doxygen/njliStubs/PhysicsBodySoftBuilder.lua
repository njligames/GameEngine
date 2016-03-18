
--Test the functions for PhysicsBodySoftBuilder
local Test = {}

local function PhysicsBodySoftBuilder_calculateSerializeBufferSize_()
--//! [PhysicsBodySoftBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsBodySoftBuilder:calculateSerializeBufferSize()
--//! [PhysicsBodySoftBuilder_calculateSerializeBufferSize_]

end

local function PhysicsBodySoftBuilder_serialize_dataBuffer_btSerializer()
--//! [PhysicsBodySoftBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsBodySoftBuilder:serialize(dataBuffer, btSerializer)
--//! [PhysicsBodySoftBuilder_serialize_dataBuffer_btSerializer]

end

local function PhysicsBodySoftBuilder_getObjectType_()
--//! [PhysicsBodySoftBuilder_getObjectType_]
-- @TODO: Test: PhysicsBodySoftBuilder:getObjectType()
--//! [PhysicsBodySoftBuilder_getObjectType_]

end

local function PhysicsBodySoftBuilder_getClassName_()
--//! [PhysicsBodySoftBuilder_getClassName_]
-- @TODO: Test: PhysicsBodySoftBuilder:getClassName()
--//! [PhysicsBodySoftBuilder_getClassName_]

end

local function PhysicsBodySoftBuilder_getType_()
--//! [PhysicsBodySoftBuilder_getType_]
-- @TODO: Test: PhysicsBodySoftBuilder:getType()
--//! [PhysicsBodySoftBuilder_getType_]

end

local function PhysicsBodySoftBuilder_createArray_size()
--//! [PhysicsBodySoftBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsBodySoftBuilder.createArray(size)
--//! [PhysicsBodySoftBuilder_createArray_size]

end

local function PhysicsBodySoftBuilder_destroyArray_array()
--//! [PhysicsBodySoftBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsBodySoftBuilder.destroyArray(array)
--//! [PhysicsBodySoftBuilder_destroyArray_array]

end

local function PhysicsBodySoftBuilder_create_()
--//! [PhysicsBodySoftBuilder_create_]
-- @TODO:Test: NJLI.PhysicsBodySoftBuilder.create()
--//! [PhysicsBodySoftBuilder_create_]

end

local function PhysicsBodySoftBuilder_clone_object()
--//! [PhysicsBodySoftBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsBodySoftBuilder.clone(object)
--//! [PhysicsBodySoftBuilder_clone_object]

end

local function PhysicsBodySoftBuilder_destroy_object()
--//! [PhysicsBodySoftBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsBodySoftBuilder.destroy(object)
--//! [PhysicsBodySoftBuilder_destroy_object]

end

local function PhysicsBodySoftBuilder_load_object_L_stack_index()
--//! [PhysicsBodySoftBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsBodySoftBuilder.load(object, L, stack_index)
--//! [PhysicsBodySoftBuilder_load_object_L_stack_index]

end

local function PhysicsBodySoftBuilder_type_()
--//! [PhysicsBodySoftBuilder_type_]
-- @TODO:Test: NJLI.PhysicsBodySoftBuilder.type()
--//! [PhysicsBodySoftBuilder_type_]

end


function Test:testAll()
	PhysicsBodySoftBuilder_calculateSerializeBufferSize_()
	PhysicsBodySoftBuilder_serialize_dataBuffer_btSerializer()
	PhysicsBodySoftBuilder_getObjectType_()
	PhysicsBodySoftBuilder_getClassName_()
	PhysicsBodySoftBuilder_getType_()
	PhysicsBodySoftBuilder_createArray_size()
	PhysicsBodySoftBuilder_destroyArray_array()
	PhysicsBodySoftBuilder_create_()
	PhysicsBodySoftBuilder_clone_object()
	PhysicsBodySoftBuilder_destroy_object()
	PhysicsBodySoftBuilder_load_object_L_stack_index()
	PhysicsBodySoftBuilder_type_()
end

return Test