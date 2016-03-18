
--Test the functions for PhysicsBodyGhost
local Test = {}

local function PhysicsBodyGhost_calculateSerializeBufferSize_()
--//! [PhysicsBodyGhost_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsBodyGhost:calculateSerializeBufferSize()
--//! [PhysicsBodyGhost_calculateSerializeBufferSize_]

end

local function PhysicsBodyGhost_serialize_dataBuffer_btSerializer()
--//! [PhysicsBodyGhost_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsBodyGhost:serialize(dataBuffer, btSerializer)
--//! [PhysicsBodyGhost_serialize_dataBuffer_btSerializer]

end

local function PhysicsBodyGhost_getClassName_()
--//! [PhysicsBodyGhost_getClassName_]
-- @TODO: Test: PhysicsBodyGhost:getClassName()
--//! [PhysicsBodyGhost_getClassName_]

end

local function PhysicsBodyGhost_getType_()
--//! [PhysicsBodyGhost_getType_]
-- @TODO: Test: PhysicsBodyGhost:getType()
--//! [PhysicsBodyGhost_getType_]

end

local function PhysicsBodyGhost_setWorldTransform_transform()
--//! [PhysicsBodyGhost_setWorldTransform_transform]
-- @TODO: Test: PhysicsBodyGhost:setWorldTransform(transform)
--//! [PhysicsBodyGhost_setWorldTransform_transform]

end

local function PhysicsBodyGhost_isInWorld_()
--//! [PhysicsBodyGhost_isInWorld_]
-- @TODO: Test: PhysicsBodyGhost:isInWorld()
--//! [PhysicsBodyGhost_isInWorld_]

end

local function PhysicsBodyGhost_getVelocity_()
--//! [PhysicsBodyGhost_getVelocity_]
-- @TODO: Test: PhysicsBodyGhost:getVelocity()
--//! [PhysicsBodyGhost_getVelocity_]

end

local function PhysicsBodyGhost_getAngularVelocity_()
--//! [PhysicsBodyGhost_getAngularVelocity_]
-- @TODO: Test: PhysicsBodyGhost:getAngularVelocity()
--//! [PhysicsBodyGhost_getAngularVelocity_]

end

local function PhysicsBodyGhost_createArray_size()
--//! [PhysicsBodyGhost_createArray_size]
-- @TODO:Test: NJLI.PhysicsBodyGhost.createArray(size)
--//! [PhysicsBodyGhost_createArray_size]

end

local function PhysicsBodyGhost_destroyArray_array()
--//! [PhysicsBodyGhost_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsBodyGhost.destroyArray(array)
--//! [PhysicsBodyGhost_destroyArray_array]

end

local function PhysicsBodyGhost_create_()
--//! [PhysicsBodyGhost_create_]
-- @TODO:Test: NJLI.PhysicsBodyGhost.create()
--//! [PhysicsBodyGhost_create_]

end

local function PhysicsBodyGhost_create_builder()
--//! [PhysicsBodyGhost_create_builder]
-- @TODO:Test: NJLI.PhysicsBodyGhost.create(builder)
--//! [PhysicsBodyGhost_create_builder]

end

local function PhysicsBodyGhost_clone_object()
--//! [PhysicsBodyGhost_clone_object]
-- @TODO:Test: NJLI.PhysicsBodyGhost.clone(object)
--//! [PhysicsBodyGhost_clone_object]

end

local function PhysicsBodyGhost_copy_object()
--//! [PhysicsBodyGhost_copy_object]
-- @TODO:Test: NJLI.PhysicsBodyGhost.copy(object)
--//! [PhysicsBodyGhost_copy_object]

end

local function PhysicsBodyGhost_destroy_object()
--//! [PhysicsBodyGhost_destroy_object]
-- @TODO:Test: NJLI.PhysicsBodyGhost.destroy(object)
--//! [PhysicsBodyGhost_destroy_object]

end

local function PhysicsBodyGhost_load_object_L_stack_index()
--//! [PhysicsBodyGhost_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsBodyGhost.load(object, L, stack_index)
--//! [PhysicsBodyGhost_load_object_L_stack_index]

end

local function PhysicsBodyGhost_type_()
--//! [PhysicsBodyGhost_type_]
-- @TODO:Test: NJLI.PhysicsBodyGhost.type()
--//! [PhysicsBodyGhost_type_]

end


function Test:testAll()
	PhysicsBodyGhost_calculateSerializeBufferSize_()
	PhysicsBodyGhost_serialize_dataBuffer_btSerializer()
	PhysicsBodyGhost_getClassName_()
	PhysicsBodyGhost_getType_()
	PhysicsBodyGhost_setWorldTransform_transform()
	PhysicsBodyGhost_isInWorld_()
	PhysicsBodyGhost_getVelocity_()
	PhysicsBodyGhost_getAngularVelocity_()
	PhysicsBodyGhost_createArray_size()
	PhysicsBodyGhost_destroyArray_array()
	PhysicsBodyGhost_create_()
	PhysicsBodyGhost_create_builder()
	PhysicsBodyGhost_clone_object()
	PhysicsBodyGhost_copy_object()
	PhysicsBodyGhost_destroy_object()
	PhysicsBodyGhost_load_object_L_stack_index()
	PhysicsBodyGhost_type_()
end

return Test