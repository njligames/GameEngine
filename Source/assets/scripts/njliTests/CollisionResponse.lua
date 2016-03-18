
--Test the functions for CollisionResponse
local Test = {}

local function CollisionResponse_calculateSerializeBufferSize_()
--//! [CollisionResponse_calculateSerializeBufferSize_]
-- @TODO: Test: CollisionResponse:calculateSerializeBufferSize()
--//! [CollisionResponse_calculateSerializeBufferSize_]

end

local function CollisionResponse_serialize_dataBuffer_btSerializer()
--//! [CollisionResponse_serialize_dataBuffer_btSerializer]
-- @TODO: Test: CollisionResponse:serialize(dataBuffer, btSerializer)
--//! [CollisionResponse_serialize_dataBuffer_btSerializer]

end

local function CollisionResponse_getClassName_()
--//! [CollisionResponse_getClassName_]
-- @TODO: Test: CollisionResponse:getClassName()
--//! [CollisionResponse_getClassName_]

end

local function CollisionResponse_getType_()
--//! [CollisionResponse_getType_]
-- @TODO: Test: CollisionResponse:getType()
--//! [CollisionResponse_getType_]

end

local function CollisionResponse_createArray_size()
--//! [CollisionResponse_createArray_size]
-- @TODO:Test: NJLI.CollisionResponse.createArray(size)
--//! [CollisionResponse_createArray_size]

end

local function CollisionResponse_destroyArray_array()
--//! [CollisionResponse_destroyArray_array]
-- @TODO:Test: NJLI.CollisionResponse.destroyArray(array)
--//! [CollisionResponse_destroyArray_array]

end

local function CollisionResponse_create_()
--//! [CollisionResponse_create_]
-- @TODO:Test: NJLI.CollisionResponse.create()
--//! [CollisionResponse_create_]

end

local function CollisionResponse_create_builder()
--//! [CollisionResponse_create_builder]
-- @TODO:Test: NJLI.CollisionResponse.create(builder)
--//! [CollisionResponse_create_builder]

end

local function CollisionResponse_clone_object()
--//! [CollisionResponse_clone_object]
-- @TODO:Test: NJLI.CollisionResponse.clone(object)
--//! [CollisionResponse_clone_object]

end

local function CollisionResponse_copy_object()
--//! [CollisionResponse_copy_object]
-- @TODO:Test: NJLI.CollisionResponse.copy(object)
--//! [CollisionResponse_copy_object]

end

local function CollisionResponse_destroy_object()
--//! [CollisionResponse_destroy_object]
-- @TODO:Test: NJLI.CollisionResponse.destroy(object)
--//! [CollisionResponse_destroy_object]

end

local function CollisionResponse_load_object_L_stack_index()
--//! [CollisionResponse_load_object_L_stack_index]
-- @TODO:Test: NJLI.CollisionResponse.load(object, L, stack_index)
--//! [CollisionResponse_load_object_L_stack_index]

end

local function CollisionResponse_type_()
--//! [CollisionResponse_type_]
-- @TODO:Test: NJLI.CollisionResponse.type()
--//! [CollisionResponse_type_]

end


function Test:testAll()
	CollisionResponse_calculateSerializeBufferSize_()
	CollisionResponse_serialize_dataBuffer_btSerializer()
	CollisionResponse_getClassName_()
	CollisionResponse_getType_()
	CollisionResponse_createArray_size()
	CollisionResponse_destroyArray_array()
	CollisionResponse_create_()
	CollisionResponse_create_builder()
	CollisionResponse_clone_object()
	CollisionResponse_copy_object()
	CollisionResponse_destroy_object()
	CollisionResponse_load_object_L_stack_index()
	CollisionResponse_type_()
end

return Test