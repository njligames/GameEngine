
--Test the functions for PhysicsContact
local Test = {}

local function PhysicsContact_calculateSerializeBufferSize_()
--//! [PhysicsContact_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsContact:calculateSerializeBufferSize()
--//! [PhysicsContact_calculateSerializeBufferSize_]

end

local function PhysicsContact_serialize_dataBuffer_btSerializer()
--//! [PhysicsContact_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsContact:serialize(dataBuffer, btSerializer)
--//! [PhysicsContact_serialize_dataBuffer_btSerializer]

end

local function PhysicsContact_getClassName_()
--//! [PhysicsContact_getClassName_]
-- @TODO: Test: PhysicsContact:getClassName()
--//! [PhysicsContact_getClassName_]

end

local function PhysicsContact_getType_()
--//! [PhysicsContact_getType_]
-- @TODO: Test: PhysicsContact:getType()
--//! [PhysicsContact_getType_]

end

local function PhysicsContact_createArray_size()
--//! [PhysicsContact_createArray_size]
-- @TODO:Test: NJLI.PhysicsContact.createArray(size)
--//! [PhysicsContact_createArray_size]

end

local function PhysicsContact_destroyArray_array()
--//! [PhysicsContact_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsContact.destroyArray(array)
--//! [PhysicsContact_destroyArray_array]

end

local function PhysicsContact_create_()
--//! [PhysicsContact_create_]
-- @TODO:Test: NJLI.PhysicsContact.create()
--//! [PhysicsContact_create_]

end

local function PhysicsContact_create_builder()
--//! [PhysicsContact_create_builder]
-- @TODO:Test: NJLI.PhysicsContact.create(builder)
--//! [PhysicsContact_create_builder]

end

local function PhysicsContact_clone_object()
--//! [PhysicsContact_clone_object]
-- @TODO:Test: NJLI.PhysicsContact.clone(object)
--//! [PhysicsContact_clone_object]

end

local function PhysicsContact_copy_object()
--//! [PhysicsContact_copy_object]
-- @TODO:Test: NJLI.PhysicsContact.copy(object)
--//! [PhysicsContact_copy_object]

end

local function PhysicsContact_destroy_object()
--//! [PhysicsContact_destroy_object]
-- @TODO:Test: NJLI.PhysicsContact.destroy(object)
--//! [PhysicsContact_destroy_object]

end

local function PhysicsContact_load_object_L_stack_index()
--//! [PhysicsContact_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsContact.load(object, L, stack_index)
--//! [PhysicsContact_load_object_L_stack_index]

end

local function PhysicsContact_type_()
--//! [PhysicsContact_type_]
-- @TODO:Test: NJLI.PhysicsContact.type()
--//! [PhysicsContact_type_]

end


function Test:testAll()
	PhysicsContact_calculateSerializeBufferSize_()
	PhysicsContact_serialize_dataBuffer_btSerializer()
	PhysicsContact_getClassName_()
	PhysicsContact_getType_()
	PhysicsContact_createArray_size()
	PhysicsContact_destroyArray_array()
	PhysicsContact_create_()
	PhysicsContact_create_builder()
	PhysicsContact_clone_object()
	PhysicsContact_copy_object()
	PhysicsContact_destroy_object()
	PhysicsContact_load_object_L_stack_index()
	PhysicsContact_type_()
end

return Test