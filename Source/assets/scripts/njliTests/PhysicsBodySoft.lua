
--Test the functions for PhysicsBodySoft
local Test = {}

local function PhysicsBodySoft_calculateSerializeBufferSize_()
--//! [PhysicsBodySoft_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsBodySoft:calculateSerializeBufferSize()
--//! [PhysicsBodySoft_calculateSerializeBufferSize_]

end

local function PhysicsBodySoft_serialize_dataBuffer_btSerializer()
--//! [PhysicsBodySoft_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsBodySoft:serialize(dataBuffer, btSerializer)
--//! [PhysicsBodySoft_serialize_dataBuffer_btSerializer]

end

local function PhysicsBodySoft_getClassName_()
--//! [PhysicsBodySoft_getClassName_]
-- @TODO: Test: PhysicsBodySoft:getClassName()
--//! [PhysicsBodySoft_getClassName_]

end

local function PhysicsBodySoft_getType_()
--//! [PhysicsBodySoft_getType_]
-- @TODO: Test: PhysicsBodySoft:getType()
--//! [PhysicsBodySoft_getType_]

end

local function PhysicsBodySoft_setWorldTransform_transform()
--//! [PhysicsBodySoft_setWorldTransform_transform]
-- @TODO: Test: PhysicsBodySoft:setWorldTransform(transform)
--//! [PhysicsBodySoft_setWorldTransform_transform]

end

local function PhysicsBodySoft_isInWorld_()
--//! [PhysicsBodySoft_isInWorld_]
-- @TODO: Test: PhysicsBodySoft:isInWorld()
--//! [PhysicsBodySoft_isInWorld_]

end

local function PhysicsBodySoft_getVelocity_()
--//! [PhysicsBodySoft_getVelocity_]
-- @TODO: Test: PhysicsBodySoft:getVelocity()
--//! [PhysicsBodySoft_getVelocity_]

end

local function PhysicsBodySoft_getAngularVelocity_()
--//! [PhysicsBodySoft_getAngularVelocity_]
-- @TODO: Test: PhysicsBodySoft:getAngularVelocity()
--//! [PhysicsBodySoft_getAngularVelocity_]

end

local function PhysicsBodySoft_createArray_size()
--//! [PhysicsBodySoft_createArray_size]
-- @TODO:Test: NJLI.PhysicsBodySoft.createArray(size)
--//! [PhysicsBodySoft_createArray_size]

end

local function PhysicsBodySoft_destroyArray_array()
--//! [PhysicsBodySoft_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsBodySoft.destroyArray(array)
--//! [PhysicsBodySoft_destroyArray_array]

end

local function PhysicsBodySoft_create_()
--//! [PhysicsBodySoft_create_]
-- @TODO:Test: NJLI.PhysicsBodySoft.create()
--//! [PhysicsBodySoft_create_]

end

local function PhysicsBodySoft_create_builder()
--//! [PhysicsBodySoft_create_builder]
-- @TODO:Test: NJLI.PhysicsBodySoft.create(builder)
--//! [PhysicsBodySoft_create_builder]

end

local function PhysicsBodySoft_clone_object()
--//! [PhysicsBodySoft_clone_object]
-- @TODO:Test: NJLI.PhysicsBodySoft.clone(object)
--//! [PhysicsBodySoft_clone_object]

end

local function PhysicsBodySoft_copy_object()
--//! [PhysicsBodySoft_copy_object]
-- @TODO:Test: NJLI.PhysicsBodySoft.copy(object)
--//! [PhysicsBodySoft_copy_object]

end

local function PhysicsBodySoft_destroy_object()
--//! [PhysicsBodySoft_destroy_object]
-- @TODO:Test: NJLI.PhysicsBodySoft.destroy(object)
--//! [PhysicsBodySoft_destroy_object]

end

local function PhysicsBodySoft_load_object_L_stack_index()
--//! [PhysicsBodySoft_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsBodySoft.load(object, L, stack_index)
--//! [PhysicsBodySoft_load_object_L_stack_index]

end

local function PhysicsBodySoft_type_()
--//! [PhysicsBodySoft_type_]
-- @TODO:Test: NJLI.PhysicsBodySoft.type()
--//! [PhysicsBodySoft_type_]

end


function Test:testAll()
	PhysicsBodySoft_calculateSerializeBufferSize_()
	PhysicsBodySoft_serialize_dataBuffer_btSerializer()
	PhysicsBodySoft_getClassName_()
	PhysicsBodySoft_getType_()
	PhysicsBodySoft_setWorldTransform_transform()
	PhysicsBodySoft_isInWorld_()
	PhysicsBodySoft_getVelocity_()
	PhysicsBodySoft_getAngularVelocity_()
	PhysicsBodySoft_createArray_size()
	PhysicsBodySoft_destroyArray_array()
	PhysicsBodySoft_create_()
	PhysicsBodySoft_create_builder()
	PhysicsBodySoft_clone_object()
	PhysicsBodySoft_copy_object()
	PhysicsBodySoft_destroy_object()
	PhysicsBodySoft_load_object_L_stack_index()
	PhysicsBodySoft_type_()
end

return Test