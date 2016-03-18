
--Test the functions for PhysicsBodyGhostBuilder
local Test = {}

local function PhysicsBodyGhostBuilder_calculateSerializeBufferSize_()
--//! [PhysicsBodyGhostBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsBodyGhostBuilder:calculateSerializeBufferSize()
--//! [PhysicsBodyGhostBuilder_calculateSerializeBufferSize_]

end

local function PhysicsBodyGhostBuilder_serialize_dataBuffer_btSerializer()
--//! [PhysicsBodyGhostBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsBodyGhostBuilder:serialize(dataBuffer, btSerializer)
--//! [PhysicsBodyGhostBuilder_serialize_dataBuffer_btSerializer]

end

local function PhysicsBodyGhostBuilder_getObjectType_()
--//! [PhysicsBodyGhostBuilder_getObjectType_]
-- @TODO: Test: PhysicsBodyGhostBuilder:getObjectType()
--//! [PhysicsBodyGhostBuilder_getObjectType_]

end

local function PhysicsBodyGhostBuilder_getClassName_()
--//! [PhysicsBodyGhostBuilder_getClassName_]
-- @TODO: Test: PhysicsBodyGhostBuilder:getClassName()
--//! [PhysicsBodyGhostBuilder_getClassName_]

end

local function PhysicsBodyGhostBuilder_getType_()
--//! [PhysicsBodyGhostBuilder_getType_]
-- @TODO: Test: PhysicsBodyGhostBuilder:getType()
--//! [PhysicsBodyGhostBuilder_getType_]

end

local function PhysicsBodyGhostBuilder_createArray_size()
--//! [PhysicsBodyGhostBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsBodyGhostBuilder.createArray(size)
--//! [PhysicsBodyGhostBuilder_createArray_size]

end

local function PhysicsBodyGhostBuilder_destroyArray_array()
--//! [PhysicsBodyGhostBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsBodyGhostBuilder.destroyArray(array)
--//! [PhysicsBodyGhostBuilder_destroyArray_array]

end

local function PhysicsBodyGhostBuilder_create_()
--//! [PhysicsBodyGhostBuilder_create_]
-- @TODO:Test: NJLI.PhysicsBodyGhostBuilder.create()
--//! [PhysicsBodyGhostBuilder_create_]

end

local function PhysicsBodyGhostBuilder_clone_object()
--//! [PhysicsBodyGhostBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsBodyGhostBuilder.clone(object)
--//! [PhysicsBodyGhostBuilder_clone_object]

end

local function PhysicsBodyGhostBuilder_destroy_object()
--//! [PhysicsBodyGhostBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsBodyGhostBuilder.destroy(object)
--//! [PhysicsBodyGhostBuilder_destroy_object]

end

local function PhysicsBodyGhostBuilder_load_object_L_stack_index()
--//! [PhysicsBodyGhostBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsBodyGhostBuilder.load(object, L, stack_index)
--//! [PhysicsBodyGhostBuilder_load_object_L_stack_index]

end

local function PhysicsBodyGhostBuilder_type_()
--//! [PhysicsBodyGhostBuilder_type_]
-- @TODO:Test: NJLI.PhysicsBodyGhostBuilder.type()
--//! [PhysicsBodyGhostBuilder_type_]

end


function Test:testAll()
	PhysicsBodyGhostBuilder_calculateSerializeBufferSize_()
	PhysicsBodyGhostBuilder_serialize_dataBuffer_btSerializer()
	PhysicsBodyGhostBuilder_getObjectType_()
	PhysicsBodyGhostBuilder_getClassName_()
	PhysicsBodyGhostBuilder_getType_()
	PhysicsBodyGhostBuilder_createArray_size()
	PhysicsBodyGhostBuilder_destroyArray_array()
	PhysicsBodyGhostBuilder_create_()
	PhysicsBodyGhostBuilder_clone_object()
	PhysicsBodyGhostBuilder_destroy_object()
	PhysicsBodyGhostBuilder_load_object_L_stack_index()
	PhysicsBodyGhostBuilder_type_()
end

return Test