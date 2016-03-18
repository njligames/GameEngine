
--Test the functions for PhysicsConstraintFixedBuilder
local Test = {}

local function PhysicsConstraintFixedBuilder_calculateSerializeBufferSize_()
--//! [PhysicsConstraintFixedBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsConstraintFixedBuilder:calculateSerializeBufferSize()
--//! [PhysicsConstraintFixedBuilder_calculateSerializeBufferSize_]

end

local function PhysicsConstraintFixedBuilder_serialize_dataBuffer_btSerializer()
--//! [PhysicsConstraintFixedBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsConstraintFixedBuilder:serialize(dataBuffer, btSerializer)
--//! [PhysicsConstraintFixedBuilder_serialize_dataBuffer_btSerializer]

end

local function PhysicsConstraintFixedBuilder_getObjectType_()
--//! [PhysicsConstraintFixedBuilder_getObjectType_]
-- @TODO: Test: PhysicsConstraintFixedBuilder:getObjectType()
--//! [PhysicsConstraintFixedBuilder_getObjectType_]

end

local function PhysicsConstraintFixedBuilder_getClassName_()
--//! [PhysicsConstraintFixedBuilder_getClassName_]
-- @TODO: Test: PhysicsConstraintFixedBuilder:getClassName()
--//! [PhysicsConstraintFixedBuilder_getClassName_]

end

local function PhysicsConstraintFixedBuilder_getType_()
--//! [PhysicsConstraintFixedBuilder_getType_]
-- @TODO: Test: PhysicsConstraintFixedBuilder:getType()
--//! [PhysicsConstraintFixedBuilder_getType_]

end

local function PhysicsConstraintFixedBuilder_createArray_size()
--//! [PhysicsConstraintFixedBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsConstraintFixedBuilder.createArray(size)
--//! [PhysicsConstraintFixedBuilder_createArray_size]

end

local function PhysicsConstraintFixedBuilder_destroyArray_array()
--//! [PhysicsConstraintFixedBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsConstraintFixedBuilder.destroyArray(array)
--//! [PhysicsConstraintFixedBuilder_destroyArray_array]

end

local function PhysicsConstraintFixedBuilder_create_()
--//! [PhysicsConstraintFixedBuilder_create_]
-- @TODO:Test: NJLI.PhysicsConstraintFixedBuilder.create()
--//! [PhysicsConstraintFixedBuilder_create_]

end

local function PhysicsConstraintFixedBuilder_clone_object()
--//! [PhysicsConstraintFixedBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsConstraintFixedBuilder.clone(object)
--//! [PhysicsConstraintFixedBuilder_clone_object]

end

local function PhysicsConstraintFixedBuilder_destroy_object()
--//! [PhysicsConstraintFixedBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsConstraintFixedBuilder.destroy(object)
--//! [PhysicsConstraintFixedBuilder_destroy_object]

end

local function PhysicsConstraintFixedBuilder_load_object_L_stack_index()
--//! [PhysicsConstraintFixedBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsConstraintFixedBuilder.load(object, L, stack_index)
--//! [PhysicsConstraintFixedBuilder_load_object_L_stack_index]

end

local function PhysicsConstraintFixedBuilder_type_()
--//! [PhysicsConstraintFixedBuilder_type_]
-- @TODO:Test: NJLI.PhysicsConstraintFixedBuilder.type()
--//! [PhysicsConstraintFixedBuilder_type_]

end


function Test:testAll()
	PhysicsConstraintFixedBuilder_calculateSerializeBufferSize_()
	PhysicsConstraintFixedBuilder_serialize_dataBuffer_btSerializer()
	PhysicsConstraintFixedBuilder_getObjectType_()
	PhysicsConstraintFixedBuilder_getClassName_()
	PhysicsConstraintFixedBuilder_getType_()
	PhysicsConstraintFixedBuilder_createArray_size()
	PhysicsConstraintFixedBuilder_destroyArray_array()
	PhysicsConstraintFixedBuilder_create_()
	PhysicsConstraintFixedBuilder_clone_object()
	PhysicsConstraintFixedBuilder_destroy_object()
	PhysicsConstraintFixedBuilder_load_object_L_stack_index()
	PhysicsConstraintFixedBuilder_type_()
end

return Test