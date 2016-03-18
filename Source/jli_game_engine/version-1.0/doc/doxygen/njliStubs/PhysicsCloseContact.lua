
--Test the functions for PhysicsCloseContact
local Test = {}

local function PhysicsCloseContact_calculateSerializeBufferSize_()
--//! [PhysicsCloseContact_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsCloseContact:calculateSerializeBufferSize()
--//! [PhysicsCloseContact_calculateSerializeBufferSize_]

end

local function PhysicsCloseContact_serialize_dataBuffer_btSerializer()
--//! [PhysicsCloseContact_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsCloseContact:serialize(dataBuffer, btSerializer)
--//! [PhysicsCloseContact_serialize_dataBuffer_btSerializer]

end

local function PhysicsCloseContact_getClassName_()
--//! [PhysicsCloseContact_getClassName_]
-- @TODO: Test: PhysicsCloseContact:getClassName()
--//! [PhysicsCloseContact_getClassName_]

end

local function PhysicsCloseContact_getType_()
--//! [PhysicsCloseContact_getType_]
-- @TODO: Test: PhysicsCloseContact:getType()
--//! [PhysicsCloseContact_getType_]

end

local function PhysicsCloseContact_createArray_size()
--//! [PhysicsCloseContact_createArray_size]
-- @TODO:Test: NJLI.PhysicsCloseContact.createArray(size)
--//! [PhysicsCloseContact_createArray_size]

end

local function PhysicsCloseContact_destroyArray_array()
--//! [PhysicsCloseContact_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsCloseContact.destroyArray(array)
--//! [PhysicsCloseContact_destroyArray_array]

end

local function PhysicsCloseContact_create_()
--//! [PhysicsCloseContact_create_]
-- @TODO:Test: NJLI.PhysicsCloseContact.create()
--//! [PhysicsCloseContact_create_]

end

local function PhysicsCloseContact_create_builder()
--//! [PhysicsCloseContact_create_builder]
-- @TODO:Test: NJLI.PhysicsCloseContact.create(builder)
--//! [PhysicsCloseContact_create_builder]

end

local function PhysicsCloseContact_clone_object()
--//! [PhysicsCloseContact_clone_object]
-- @TODO:Test: NJLI.PhysicsCloseContact.clone(object)
--//! [PhysicsCloseContact_clone_object]

end

local function PhysicsCloseContact_copy_object()
--//! [PhysicsCloseContact_copy_object]
-- @TODO:Test: NJLI.PhysicsCloseContact.copy(object)
--//! [PhysicsCloseContact_copy_object]

end

local function PhysicsCloseContact_destroy_object()
--//! [PhysicsCloseContact_destroy_object]
-- @TODO:Test: NJLI.PhysicsCloseContact.destroy(object)
--//! [PhysicsCloseContact_destroy_object]

end

local function PhysicsCloseContact_load_object_L_stack_index()
--//! [PhysicsCloseContact_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsCloseContact.load(object, L, stack_index)
--//! [PhysicsCloseContact_load_object_L_stack_index]

end

local function PhysicsCloseContact_type_()
--//! [PhysicsCloseContact_type_]
-- @TODO:Test: NJLI.PhysicsCloseContact.type()
--//! [PhysicsCloseContact_type_]

end


function Test:testAll()
	PhysicsCloseContact_calculateSerializeBufferSize_()
	PhysicsCloseContact_serialize_dataBuffer_btSerializer()
	PhysicsCloseContact_getClassName_()
	PhysicsCloseContact_getType_()
	PhysicsCloseContact_createArray_size()
	PhysicsCloseContact_destroyArray_array()
	PhysicsCloseContact_create_()
	PhysicsCloseContact_create_builder()
	PhysicsCloseContact_clone_object()
	PhysicsCloseContact_copy_object()
	PhysicsCloseContact_destroy_object()
	PhysicsCloseContact_load_object_L_stack_index()
	PhysicsCloseContact_type_()
end

return Test