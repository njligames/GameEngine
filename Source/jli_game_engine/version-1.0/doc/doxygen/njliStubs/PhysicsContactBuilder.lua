
--Test the functions for PhysicsContactBuilder
local Test = {}

local function PhysicsContactBuilder_calculateSerializeBufferSize_()
--//! [PhysicsContactBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsContactBuilder:calculateSerializeBufferSize()
--//! [PhysicsContactBuilder_calculateSerializeBufferSize_]

end

local function PhysicsContactBuilder_serialize_dataBuffer_btSerializer()
--//! [PhysicsContactBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsContactBuilder:serialize(dataBuffer, btSerializer)
--//! [PhysicsContactBuilder_serialize_dataBuffer_btSerializer]

end

local function PhysicsContactBuilder_getObjectType_()
--//! [PhysicsContactBuilder_getObjectType_]
-- @TODO: Test: PhysicsContactBuilder:getObjectType()
--//! [PhysicsContactBuilder_getObjectType_]

end

local function PhysicsContactBuilder_getClassName_()
--//! [PhysicsContactBuilder_getClassName_]
-- @TODO: Test: PhysicsContactBuilder:getClassName()
--//! [PhysicsContactBuilder_getClassName_]

end

local function PhysicsContactBuilder_getType_()
--//! [PhysicsContactBuilder_getType_]
-- @TODO: Test: PhysicsContactBuilder:getType()
--//! [PhysicsContactBuilder_getType_]

end

local function PhysicsContactBuilder_createArray_size()
--//! [PhysicsContactBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsContactBuilder.createArray(size)
--//! [PhysicsContactBuilder_createArray_size]

end

local function PhysicsContactBuilder_destroyArray_array()
--//! [PhysicsContactBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsContactBuilder.destroyArray(array)
--//! [PhysicsContactBuilder_destroyArray_array]

end

local function PhysicsContactBuilder_create_()
--//! [PhysicsContactBuilder_create_]
-- @TODO:Test: NJLI.PhysicsContactBuilder.create()
--//! [PhysicsContactBuilder_create_]

end

local function PhysicsContactBuilder_clone_object()
--//! [PhysicsContactBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsContactBuilder.clone(object)
--//! [PhysicsContactBuilder_clone_object]

end

local function PhysicsContactBuilder_destroy_object()
--//! [PhysicsContactBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsContactBuilder.destroy(object)
--//! [PhysicsContactBuilder_destroy_object]

end

local function PhysicsContactBuilder_load_object_L_stack_index()
--//! [PhysicsContactBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsContactBuilder.load(object, L, stack_index)
--//! [PhysicsContactBuilder_load_object_L_stack_index]

end

local function PhysicsContactBuilder_type_()
--//! [PhysicsContactBuilder_type_]
-- @TODO:Test: NJLI.PhysicsContactBuilder.type()
--//! [PhysicsContactBuilder_type_]

end


function Test:testAll()
	PhysicsContactBuilder_calculateSerializeBufferSize_()
	PhysicsContactBuilder_serialize_dataBuffer_btSerializer()
	PhysicsContactBuilder_getObjectType_()
	PhysicsContactBuilder_getClassName_()
	PhysicsContactBuilder_getType_()
	PhysicsContactBuilder_createArray_size()
	PhysicsContactBuilder_destroyArray_array()
	PhysicsContactBuilder_create_()
	PhysicsContactBuilder_clone_object()
	PhysicsContactBuilder_destroy_object()
	PhysicsContactBuilder_load_object_L_stack_index()
	PhysicsContactBuilder_type_()
end

return Test