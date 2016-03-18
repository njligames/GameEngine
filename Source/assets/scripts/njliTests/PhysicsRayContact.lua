
--Test the functions for PhysicsRayContact
local Test = {}

local function PhysicsRayContact_calculateSerializeBufferSize_()
--//! [PhysicsRayContact_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsRayContact:calculateSerializeBufferSize()
--//! [PhysicsRayContact_calculateSerializeBufferSize_]

end

local function PhysicsRayContact_serialize_dataBuffer_btSerializer()
--//! [PhysicsRayContact_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsRayContact:serialize(dataBuffer, btSerializer)
--//! [PhysicsRayContact_serialize_dataBuffer_btSerializer]

end

local function PhysicsRayContact_getClassName_()
--//! [PhysicsRayContact_getClassName_]
-- @TODO: Test: PhysicsRayContact:getClassName()
--//! [PhysicsRayContact_getClassName_]

end

local function PhysicsRayContact_getType_()
--//! [PhysicsRayContact_getType_]
-- @TODO: Test: PhysicsRayContact:getType()
--//! [PhysicsRayContact_getType_]

end

local function PhysicsRayContact_getClosestHitFraction_()
--//! [PhysicsRayContact_getClosestHitFraction_]
-- @TODO: Test: PhysicsRayContact:getClosestHitFraction()
--//! [PhysicsRayContact_getClosestHitFraction_]

end

local function PhysicsRayContact_getHitNormalWorld_()
--//! [PhysicsRayContact_getHitNormalWorld_]
-- @TODO: Test: PhysicsRayContact:getHitNormalWorld()
--//! [PhysicsRayContact_getHitNormalWorld_]

end

local function PhysicsRayContact_getHitPointWorld_()
--//! [PhysicsRayContact_getHitPointWorld_]
-- @TODO: Test: PhysicsRayContact:getHitPointWorld()
--//! [PhysicsRayContact_getHitPointWorld_]

end

local function PhysicsRayContact_getHitNode_()
--//! [PhysicsRayContact_getHitNode_]
-- @TODO: Test: PhysicsRayContact:getHitNode()
--//! [PhysicsRayContact_getHitNode_]

end

local function PhysicsRayContact_getTouchPosition_()
--//! [PhysicsRayContact_getTouchPosition_]
-- @TODO: Test: PhysicsRayContact:getTouchPosition()
--//! [PhysicsRayContact_getTouchPosition_]

end

local function PhysicsRayContact_createArray_size()
--//! [PhysicsRayContact_createArray_size]
-- @TODO:Test: NJLI.PhysicsRayContact.createArray(size)
--//! [PhysicsRayContact_createArray_size]

end

local function PhysicsRayContact_destroyArray_array()
--//! [PhysicsRayContact_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsRayContact.destroyArray(array)
--//! [PhysicsRayContact_destroyArray_array]

end

local function PhysicsRayContact_create_()
--//! [PhysicsRayContact_create_]
-- @TODO:Test: NJLI.PhysicsRayContact.create()
--//! [PhysicsRayContact_create_]

end

local function PhysicsRayContact_create_builder()
--//! [PhysicsRayContact_create_builder]
-- @TODO:Test: NJLI.PhysicsRayContact.create(builder)
--//! [PhysicsRayContact_create_builder]

end

local function PhysicsRayContact_clone_object()
--//! [PhysicsRayContact_clone_object]
-- @TODO:Test: NJLI.PhysicsRayContact.clone(object)
--//! [PhysicsRayContact_clone_object]

end

local function PhysicsRayContact_copy_object()
--//! [PhysicsRayContact_copy_object]
-- @TODO:Test: NJLI.PhysicsRayContact.copy(object)
--//! [PhysicsRayContact_copy_object]

end

local function PhysicsRayContact_destroy_object()
--//! [PhysicsRayContact_destroy_object]
-- @TODO:Test: NJLI.PhysicsRayContact.destroy(object)
--//! [PhysicsRayContact_destroy_object]

end

local function PhysicsRayContact_load_object_L_stack_index()
--//! [PhysicsRayContact_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsRayContact.load(object, L, stack_index)
--//! [PhysicsRayContact_load_object_L_stack_index]

end

local function PhysicsRayContact_type_()
--//! [PhysicsRayContact_type_]
-- @TODO:Test: NJLI.PhysicsRayContact.type()
--//! [PhysicsRayContact_type_]

end


function Test:testAll()
	PhysicsRayContact_calculateSerializeBufferSize_()
	PhysicsRayContact_serialize_dataBuffer_btSerializer()
	PhysicsRayContact_getClassName_()
	PhysicsRayContact_getType_()
	PhysicsRayContact_getClosestHitFraction_()
	PhysicsRayContact_getHitNormalWorld_()
	PhysicsRayContact_getHitPointWorld_()
	PhysicsRayContact_getHitNode_()
	PhysicsRayContact_getTouchPosition_()
	PhysicsRayContact_createArray_size()
	PhysicsRayContact_destroyArray_array()
	PhysicsRayContact_create_()
	PhysicsRayContact_create_builder()
	PhysicsRayContact_clone_object()
	PhysicsRayContact_copy_object()
	PhysicsRayContact_destroy_object()
	PhysicsRayContact_load_object_L_stack_index()
	PhysicsRayContact_type_()
end

return Test