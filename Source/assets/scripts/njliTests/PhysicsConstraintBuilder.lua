
--Test the functions for PhysicsConstraintBuilder
local Test = {}

local function PhysicsConstraintBuilder_calculateSerializeBufferSize_()
--//! [PhysicsConstraintBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsConstraintBuilder:calculateSerializeBufferSize()
--//! [PhysicsConstraintBuilder_calculateSerializeBufferSize_]

end

local function PhysicsConstraintBuilder_serialize_dataBuffer_btSerializer()
--//! [PhysicsConstraintBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsConstraintBuilder:serialize(dataBuffer, btSerializer)
--//! [PhysicsConstraintBuilder_serialize_dataBuffer_btSerializer]

end

local function PhysicsConstraintBuilder_getObjectType_()
--//! [PhysicsConstraintBuilder_getObjectType_]
-- @TODO: Test: PhysicsConstraintBuilder:getObjectType()
--//! [PhysicsConstraintBuilder_getObjectType_]

end

local function PhysicsConstraintBuilder_getClassName_()
--//! [PhysicsConstraintBuilder_getClassName_]
-- @TODO: Test: PhysicsConstraintBuilder:getClassName()
--//! [PhysicsConstraintBuilder_getClassName_]

end

local function PhysicsConstraintBuilder_getType_()
--//! [PhysicsConstraintBuilder_getType_]
-- @TODO: Test: PhysicsConstraintBuilder:getType()
--//! [PhysicsConstraintBuilder_getType_]

end

local function PhysicsConstraintBuilder_createArray_size()
--//! [PhysicsConstraintBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsConstraintBuilder.createArray(size)
--//! [PhysicsConstraintBuilder_createArray_size]

end

local function PhysicsConstraintBuilder_destroyArray_array()
--//! [PhysicsConstraintBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsConstraintBuilder.destroyArray(array)
--//! [PhysicsConstraintBuilder_destroyArray_array]

end

local function PhysicsConstraintBuilder_create_()
--//! [PhysicsConstraintBuilder_create_]
-- @TODO:Test: NJLI.PhysicsConstraintBuilder.create()
--//! [PhysicsConstraintBuilder_create_]

end

local function PhysicsConstraintBuilder_clone_object()
--//! [PhysicsConstraintBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsConstraintBuilder.clone(object)
--//! [PhysicsConstraintBuilder_clone_object]

end

local function PhysicsConstraintBuilder_destroy_object()
--//! [PhysicsConstraintBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsConstraintBuilder.destroy(object)
--//! [PhysicsConstraintBuilder_destroy_object]

end

local function PhysicsConstraintBuilder_load_object_L_stack_index()
--//! [PhysicsConstraintBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsConstraintBuilder.load(object, L, stack_index)
--//! [PhysicsConstraintBuilder_load_object_L_stack_index]

end

local function PhysicsConstraintBuilder_type_()
--//! [PhysicsConstraintBuilder_type_]
-- @TODO:Test: NJLI.PhysicsConstraintBuilder.type()
--//! [PhysicsConstraintBuilder_type_]

end


function Test:testAll()
	PhysicsConstraintBuilder_calculateSerializeBufferSize_()
	PhysicsConstraintBuilder_serialize_dataBuffer_btSerializer()
	PhysicsConstraintBuilder_getObjectType_()
	PhysicsConstraintBuilder_getClassName_()
	PhysicsConstraintBuilder_getType_()
	PhysicsConstraintBuilder_createArray_size()
	PhysicsConstraintBuilder_destroyArray_array()
	PhysicsConstraintBuilder_create_()
	PhysicsConstraintBuilder_clone_object()
	PhysicsConstraintBuilder_destroy_object()
	PhysicsConstraintBuilder_load_object_L_stack_index()
	PhysicsConstraintBuilder_type_()
end

return Test