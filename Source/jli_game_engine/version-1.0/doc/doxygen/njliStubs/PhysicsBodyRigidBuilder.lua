
--Test the functions for PhysicsBodyRigidBuilder
local Test = {}

local function PhysicsBodyRigidBuilder_calculateSerializeBufferSize_()
--//! [PhysicsBodyRigidBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsBodyRigidBuilder:calculateSerializeBufferSize()
--//! [PhysicsBodyRigidBuilder_calculateSerializeBufferSize_]

end

local function PhysicsBodyRigidBuilder_serialize_dataBuffer_btSerializer()
--//! [PhysicsBodyRigidBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsBodyRigidBuilder:serialize(dataBuffer, btSerializer)
--//! [PhysicsBodyRigidBuilder_serialize_dataBuffer_btSerializer]

end

local function PhysicsBodyRigidBuilder_getObjectType_()
--//! [PhysicsBodyRigidBuilder_getObjectType_]
-- @TODO: Test: PhysicsBodyRigidBuilder:getObjectType()
--//! [PhysicsBodyRigidBuilder_getObjectType_]

end

local function PhysicsBodyRigidBuilder_getClassName_()
--//! [PhysicsBodyRigidBuilder_getClassName_]
-- @TODO: Test: PhysicsBodyRigidBuilder:getClassName()
--//! [PhysicsBodyRigidBuilder_getClassName_]

end

local function PhysicsBodyRigidBuilder_getType_()
--//! [PhysicsBodyRigidBuilder_getType_]
-- @TODO: Test: PhysicsBodyRigidBuilder:getType()
--//! [PhysicsBodyRigidBuilder_getType_]

end

local function PhysicsBodyRigidBuilder_createArray_size()
--//! [PhysicsBodyRigidBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsBodyRigidBuilder.createArray(size)
--//! [PhysicsBodyRigidBuilder_createArray_size]

end

local function PhysicsBodyRigidBuilder_destroyArray_array()
--//! [PhysicsBodyRigidBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsBodyRigidBuilder.destroyArray(array)
--//! [PhysicsBodyRigidBuilder_destroyArray_array]

end

local function PhysicsBodyRigidBuilder_create_()
--//! [PhysicsBodyRigidBuilder_create_]
-- @TODO:Test: NJLI.PhysicsBodyRigidBuilder.create()
--//! [PhysicsBodyRigidBuilder_create_]

end

local function PhysicsBodyRigidBuilder_clone_object()
--//! [PhysicsBodyRigidBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsBodyRigidBuilder.clone(object)
--//! [PhysicsBodyRigidBuilder_clone_object]

end

local function PhysicsBodyRigidBuilder_destroy_object()
--//! [PhysicsBodyRigidBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsBodyRigidBuilder.destroy(object)
--//! [PhysicsBodyRigidBuilder_destroy_object]

end

local function PhysicsBodyRigidBuilder_load_object_L_stack_index()
--//! [PhysicsBodyRigidBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsBodyRigidBuilder.load(object, L, stack_index)
--//! [PhysicsBodyRigidBuilder_load_object_L_stack_index]

end

local function PhysicsBodyRigidBuilder_type_()
--//! [PhysicsBodyRigidBuilder_type_]
-- @TODO:Test: NJLI.PhysicsBodyRigidBuilder.type()
--//! [PhysicsBodyRigidBuilder_type_]

end


function Test:testAll()
	PhysicsBodyRigidBuilder_calculateSerializeBufferSize_()
	PhysicsBodyRigidBuilder_serialize_dataBuffer_btSerializer()
	PhysicsBodyRigidBuilder_getObjectType_()
	PhysicsBodyRigidBuilder_getClassName_()
	PhysicsBodyRigidBuilder_getType_()
	PhysicsBodyRigidBuilder_createArray_size()
	PhysicsBodyRigidBuilder_destroyArray_array()
	PhysicsBodyRigidBuilder_create_()
	PhysicsBodyRigidBuilder_clone_object()
	PhysicsBodyRigidBuilder_destroy_object()
	PhysicsBodyRigidBuilder_load_object_L_stack_index()
	PhysicsBodyRigidBuilder_type_()
end

return Test