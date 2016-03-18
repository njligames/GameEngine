
--Test the functions for CollisionResponseBuilder
local Test = {}

local function CollisionResponseBuilder_calculateSerializeBufferSize_()
--//! [CollisionResponseBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: CollisionResponseBuilder:calculateSerializeBufferSize()
--//! [CollisionResponseBuilder_calculateSerializeBufferSize_]

end

local function CollisionResponseBuilder_serialize_dataBuffer_btSerializer()
--//! [CollisionResponseBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: CollisionResponseBuilder:serialize(dataBuffer, btSerializer)
--//! [CollisionResponseBuilder_serialize_dataBuffer_btSerializer]

end

local function CollisionResponseBuilder_getObjectType_()
--//! [CollisionResponseBuilder_getObjectType_]
-- @TODO: Test: CollisionResponseBuilder:getObjectType()
--//! [CollisionResponseBuilder_getObjectType_]

end

local function CollisionResponseBuilder_getClassName_()
--//! [CollisionResponseBuilder_getClassName_]
-- @TODO: Test: CollisionResponseBuilder:getClassName()
--//! [CollisionResponseBuilder_getClassName_]

end

local function CollisionResponseBuilder_getType_()
--//! [CollisionResponseBuilder_getType_]
-- @TODO: Test: CollisionResponseBuilder:getType()
--//! [CollisionResponseBuilder_getType_]

end

local function CollisionResponseBuilder_createArray_size()
--//! [CollisionResponseBuilder_createArray_size]
-- @TODO:Test: NJLI.CollisionResponseBuilder.createArray(size)
--//! [CollisionResponseBuilder_createArray_size]

end

local function CollisionResponseBuilder_destroyArray_array()
--//! [CollisionResponseBuilder_destroyArray_array]
-- @TODO:Test: NJLI.CollisionResponseBuilder.destroyArray(array)
--//! [CollisionResponseBuilder_destroyArray_array]

end

local function CollisionResponseBuilder_create_()
--//! [CollisionResponseBuilder_create_]
-- @TODO:Test: NJLI.CollisionResponseBuilder.create()
--//! [CollisionResponseBuilder_create_]

end

local function CollisionResponseBuilder_clone_object()
--//! [CollisionResponseBuilder_clone_object]
-- @TODO:Test: NJLI.CollisionResponseBuilder.clone(object)
--//! [CollisionResponseBuilder_clone_object]

end

local function CollisionResponseBuilder_destroy_object()
--//! [CollisionResponseBuilder_destroy_object]
-- @TODO:Test: NJLI.CollisionResponseBuilder.destroy(object)
--//! [CollisionResponseBuilder_destroy_object]

end

local function CollisionResponseBuilder_load_object_L_stack_index()
--//! [CollisionResponseBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.CollisionResponseBuilder.load(object, L, stack_index)
--//! [CollisionResponseBuilder_load_object_L_stack_index]

end

local function CollisionResponseBuilder_type_()
--//! [CollisionResponseBuilder_type_]
-- @TODO:Test: NJLI.CollisionResponseBuilder.type()
--//! [CollisionResponseBuilder_type_]

end


function Test:testAll()
	CollisionResponseBuilder_calculateSerializeBufferSize_()
	CollisionResponseBuilder_serialize_dataBuffer_btSerializer()
	CollisionResponseBuilder_getObjectType_()
	CollisionResponseBuilder_getClassName_()
	CollisionResponseBuilder_getType_()
	CollisionResponseBuilder_createArray_size()
	CollisionResponseBuilder_destroyArray_array()
	CollisionResponseBuilder_create_()
	CollisionResponseBuilder_clone_object()
	CollisionResponseBuilder_destroy_object()
	CollisionResponseBuilder_load_object_L_stack_index()
	CollisionResponseBuilder_type_()
end

return Test