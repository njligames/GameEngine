
--Test the functions for PhysicsField
local Test = {}

local function PhysicsField_calculateSerializeBufferSize_()
--//! [PhysicsField_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsField:calculateSerializeBufferSize()
--//! [PhysicsField_calculateSerializeBufferSize_]

end

local function PhysicsField_serialize_dataBuffer_btSerializer()
--//! [PhysicsField_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsField:serialize(dataBuffer, btSerializer)
--//! [PhysicsField_serialize_dataBuffer_btSerializer]

end

local function PhysicsField_getClassName_()
--//! [PhysicsField_getClassName_]
-- @TODO: Test: PhysicsField:getClassName()
--//! [PhysicsField_getClassName_]

end

local function PhysicsField_getType_()
--//! [PhysicsField_getType_]
-- @TODO: Test: PhysicsField:getType()
--//! [PhysicsField_getType_]

end

local function PhysicsField_createArray_size()
--//! [PhysicsField_createArray_size]
-- @TODO:Test: NJLI.PhysicsField.createArray(size)
--//! [PhysicsField_createArray_size]

end

local function PhysicsField_destroyArray_array()
--//! [PhysicsField_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsField.destroyArray(array)
--//! [PhysicsField_destroyArray_array]

end

local function PhysicsField_create_()
--//! [PhysicsField_create_]
-- @TODO:Test: NJLI.PhysicsField.create()
--//! [PhysicsField_create_]

end

local function PhysicsField_create_builder()
--//! [PhysicsField_create_builder]
-- @TODO:Test: NJLI.PhysicsField.create(builder)
--//! [PhysicsField_create_builder]

end

local function PhysicsField_clone_object()
--//! [PhysicsField_clone_object]
-- @TODO:Test: NJLI.PhysicsField.clone(object)
--//! [PhysicsField_clone_object]

end

local function PhysicsField_copy_object()
--//! [PhysicsField_copy_object]
-- @TODO:Test: NJLI.PhysicsField.copy(object)
--//! [PhysicsField_copy_object]

end

local function PhysicsField_destroy_object()
--//! [PhysicsField_destroy_object]
-- @TODO:Test: NJLI.PhysicsField.destroy(object)
--//! [PhysicsField_destroy_object]

end

local function PhysicsField_load_object_L_stack_index()
--//! [PhysicsField_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsField.load(object, L, stack_index)
--//! [PhysicsField_load_object_L_stack_index]

end

local function PhysicsField_type_()
--//! [PhysicsField_type_]
-- @TODO:Test: NJLI.PhysicsField.type()
--//! [PhysicsField_type_]

end


function Test:testAll()
	PhysicsField_calculateSerializeBufferSize_()
	PhysicsField_serialize_dataBuffer_btSerializer()
	PhysicsField_getClassName_()
	PhysicsField_getType_()
	PhysicsField_createArray_size()
	PhysicsField_destroyArray_array()
	PhysicsField_create_()
	PhysicsField_create_builder()
	PhysicsField_clone_object()
	PhysicsField_copy_object()
	PhysicsField_destroy_object()
	PhysicsField_load_object_L_stack_index()
	PhysicsField_type_()
end

return Test