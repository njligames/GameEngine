
--Test the functions for PhysicsWorldBuilder
local Test = {}

local function PhysicsWorldBuilder_calculateSerializeBufferSize_()
--//! [PhysicsWorldBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsWorldBuilder:calculateSerializeBufferSize()
--//! [PhysicsWorldBuilder_calculateSerializeBufferSize_]

end

local function PhysicsWorldBuilder_serialize_btSerializer()
--//! [PhysicsWorldBuilder_serialize_btSerializer]
-- @TODO: Test: PhysicsWorldBuilder:serialize(btSerializer)
--//! [PhysicsWorldBuilder_serialize_btSerializer]

end

local function PhysicsWorldBuilder_getObjectType_()
--//! [PhysicsWorldBuilder_getObjectType_]
-- @TODO: Test: PhysicsWorldBuilder:getObjectType()
--//! [PhysicsWorldBuilder_getObjectType_]

end

local function PhysicsWorldBuilder_getClassName_()
--//! [PhysicsWorldBuilder_getClassName_]
-- @TODO: Test: PhysicsWorldBuilder:getClassName()
--//! [PhysicsWorldBuilder_getClassName_]

end

local function PhysicsWorldBuilder_getType_()
--//! [PhysicsWorldBuilder_getType_]
-- @TODO: Test: PhysicsWorldBuilder:getType()
--//! [PhysicsWorldBuilder_getType_]

end

local function PhysicsWorldBuilder_createArray_size()
--//! [PhysicsWorldBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsWorldBuilder.createArray(size)
--//! [PhysicsWorldBuilder_createArray_size]

end

local function PhysicsWorldBuilder_destroyArray_array()
--//! [PhysicsWorldBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsWorldBuilder.destroyArray(array)
--//! [PhysicsWorldBuilder_destroyArray_array]

end

local function PhysicsWorldBuilder_create_()
--//! [PhysicsWorldBuilder_create_]
-- @TODO:Test: NJLI.PhysicsWorldBuilder.create()
--//! [PhysicsWorldBuilder_create_]

end

local function PhysicsWorldBuilder_clone_object()
--//! [PhysicsWorldBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsWorldBuilder.clone(object)
--//! [PhysicsWorldBuilder_clone_object]

end

local function PhysicsWorldBuilder_destroy_object()
--//! [PhysicsWorldBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsWorldBuilder.destroy(object)
--//! [PhysicsWorldBuilder_destroy_object]

end

local function PhysicsWorldBuilder_load_object_L_stack_index()
--//! [PhysicsWorldBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsWorldBuilder.load(object, L, stack_index)
--//! [PhysicsWorldBuilder_load_object_L_stack_index]

end

local function PhysicsWorldBuilder_type_()
--//! [PhysicsWorldBuilder_type_]
-- @TODO:Test: NJLI.PhysicsWorldBuilder.type()
--//! [PhysicsWorldBuilder_type_]

end


function Test:testAll()
	PhysicsWorldBuilder_calculateSerializeBufferSize_()
	PhysicsWorldBuilder_serialize_btSerializer()
	PhysicsWorldBuilder_getObjectType_()
	PhysicsWorldBuilder_getClassName_()
	PhysicsWorldBuilder_getType_()
	PhysicsWorldBuilder_createArray_size()
	PhysicsWorldBuilder_destroyArray_array()
	PhysicsWorldBuilder_create_()
	PhysicsWorldBuilder_clone_object()
	PhysicsWorldBuilder_destroy_object()
	PhysicsWorldBuilder_load_object_L_stack_index()
	PhysicsWorldBuilder_type_()
end

return Test