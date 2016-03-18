
--Test the functions for FontBuilder
local Test = {}

local function FontBuilder_calculateSerializeBufferSize_()
--//! [FontBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: FontBuilder:calculateSerializeBufferSize()
--//! [FontBuilder_calculateSerializeBufferSize_]

end

local function FontBuilder_serialize_dataBuffer_btSerializer()
--//! [FontBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: FontBuilder:serialize(dataBuffer, btSerializer)
--//! [FontBuilder_serialize_dataBuffer_btSerializer]

end

local function FontBuilder_getObjectType_()
--//! [FontBuilder_getObjectType_]
-- @TODO: Test: FontBuilder:getObjectType()
--//! [FontBuilder_getObjectType_]

end

local function FontBuilder_getClassName_()
--//! [FontBuilder_getClassName_]
-- @TODO: Test: FontBuilder:getClassName()
--//! [FontBuilder_getClassName_]

end

local function FontBuilder_getType_()
--//! [FontBuilder_getType_]
-- @TODO: Test: FontBuilder:getType()
--//! [FontBuilder_getType_]

end

local function FontBuilder_createArray_size()
--//! [FontBuilder_createArray_size]
-- @TODO:Test: NJLI.FontBuilder.createArray(size)
--//! [FontBuilder_createArray_size]

end

local function FontBuilder_destroyArray_array()
--//! [FontBuilder_destroyArray_array]
-- @TODO:Test: NJLI.FontBuilder.destroyArray(array)
--//! [FontBuilder_destroyArray_array]

end

local function FontBuilder_create_()
--//! [FontBuilder_create_]
-- @TODO:Test: NJLI.FontBuilder.create()
--//! [FontBuilder_create_]

end

local function FontBuilder_clone_object()
--//! [FontBuilder_clone_object]
-- @TODO:Test: NJLI.FontBuilder.clone(object)
--//! [FontBuilder_clone_object]

end

local function FontBuilder_destroy_object()
--//! [FontBuilder_destroy_object]
-- @TODO:Test: NJLI.FontBuilder.destroy(object)
--//! [FontBuilder_destroy_object]

end

local function FontBuilder_load_object_L_stack_index()
--//! [FontBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.FontBuilder.load(object, L, stack_index)
--//! [FontBuilder_load_object_L_stack_index]

end

local function FontBuilder_type_()
--//! [FontBuilder_type_]
-- @TODO:Test: NJLI.FontBuilder.type()
--//! [FontBuilder_type_]

end


function Test:testAll()
	FontBuilder_calculateSerializeBufferSize_()
	FontBuilder_serialize_dataBuffer_btSerializer()
	FontBuilder_getObjectType_()
	FontBuilder_getClassName_()
	FontBuilder_getType_()
	FontBuilder_createArray_size()
	FontBuilder_destroyArray_array()
	FontBuilder_create_()
	FontBuilder_clone_object()
	FontBuilder_destroy_object()
	FontBuilder_load_object_L_stack_index()
	FontBuilder_type_()
end

return Test