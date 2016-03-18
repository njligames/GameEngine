
--Test the functions for PhysicsFieldBuilder
local Test = {}

local function PhysicsFieldBuilder_calculateSerializeBufferSize_()
--//! [PhysicsFieldBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsFieldBuilder:calculateSerializeBufferSize()
--//! [PhysicsFieldBuilder_calculateSerializeBufferSize_]

end

local function PhysicsFieldBuilder_serialize_dataBuffer_btSerializer()
--//! [PhysicsFieldBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsFieldBuilder:serialize(dataBuffer, btSerializer)
--//! [PhysicsFieldBuilder_serialize_dataBuffer_btSerializer]

end

local function PhysicsFieldBuilder_getObjectType_()
--//! [PhysicsFieldBuilder_getObjectType_]
-- @TODO: Test: PhysicsFieldBuilder:getObjectType()
--//! [PhysicsFieldBuilder_getObjectType_]

end

local function PhysicsFieldBuilder_getClassName_()
--//! [PhysicsFieldBuilder_getClassName_]
-- @TODO: Test: PhysicsFieldBuilder:getClassName()
--//! [PhysicsFieldBuilder_getClassName_]

end

local function PhysicsFieldBuilder_getType_()
--//! [PhysicsFieldBuilder_getType_]
-- @TODO: Test: PhysicsFieldBuilder:getType()
--//! [PhysicsFieldBuilder_getType_]

end

local function PhysicsFieldBuilder_createArray_size()
--//! [PhysicsFieldBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsFieldBuilder.createArray(size)
--//! [PhysicsFieldBuilder_createArray_size]

end

local function PhysicsFieldBuilder_destroyArray_array()
--//! [PhysicsFieldBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsFieldBuilder.destroyArray(array)
--//! [PhysicsFieldBuilder_destroyArray_array]

end

local function PhysicsFieldBuilder_create_()
--//! [PhysicsFieldBuilder_create_]
-- @TODO:Test: NJLI.PhysicsFieldBuilder.create()
--//! [PhysicsFieldBuilder_create_]

end

local function PhysicsFieldBuilder_clone_object()
--//! [PhysicsFieldBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsFieldBuilder.clone(object)
--//! [PhysicsFieldBuilder_clone_object]

end

local function PhysicsFieldBuilder_destroy_object()
--//! [PhysicsFieldBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsFieldBuilder.destroy(object)
--//! [PhysicsFieldBuilder_destroy_object]

end

local function PhysicsFieldBuilder_load_object_L_stack_index()
--//! [PhysicsFieldBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsFieldBuilder.load(object, L, stack_index)
--//! [PhysicsFieldBuilder_load_object_L_stack_index]

end

local function PhysicsFieldBuilder_type_()
--//! [PhysicsFieldBuilder_type_]
-- @TODO:Test: NJLI.PhysicsFieldBuilder.type()
--//! [PhysicsFieldBuilder_type_]

end


function Test:testAll()
	PhysicsFieldBuilder_calculateSerializeBufferSize_()
	PhysicsFieldBuilder_serialize_dataBuffer_btSerializer()
	PhysicsFieldBuilder_getObjectType_()
	PhysicsFieldBuilder_getClassName_()
	PhysicsFieldBuilder_getType_()
	PhysicsFieldBuilder_createArray_size()
	PhysicsFieldBuilder_destroyArray_array()
	PhysicsFieldBuilder_create_()
	PhysicsFieldBuilder_clone_object()
	PhysicsFieldBuilder_destroy_object()
	PhysicsFieldBuilder_load_object_L_stack_index()
	PhysicsFieldBuilder_type_()
end

return Test