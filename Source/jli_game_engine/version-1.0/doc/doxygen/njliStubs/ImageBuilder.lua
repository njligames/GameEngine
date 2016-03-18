
--Test the functions for ImageBuilder
local Test = {}

local function ImageBuilder_calculateSerializeBufferSize_()
--//! [ImageBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: ImageBuilder:calculateSerializeBufferSize()
--//! [ImageBuilder_calculateSerializeBufferSize_]

end

local function ImageBuilder_serialize_dataBuffer_btSerializer()
--//! [ImageBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: ImageBuilder:serialize(dataBuffer, btSerializer)
--//! [ImageBuilder_serialize_dataBuffer_btSerializer]

end

local function ImageBuilder_getObjectType_()
--//! [ImageBuilder_getObjectType_]
-- @TODO: Test: ImageBuilder:getObjectType()
--//! [ImageBuilder_getObjectType_]

end

local function ImageBuilder_getClassName_()
--//! [ImageBuilder_getClassName_]
-- @TODO: Test: ImageBuilder:getClassName()
--//! [ImageBuilder_getClassName_]

end

local function ImageBuilder_getType_()
--//! [ImageBuilder_getType_]
-- @TODO: Test: ImageBuilder:getType()
--//! [ImageBuilder_getType_]

end

local function ImageBuilder_createArray_size()
--//! [ImageBuilder_createArray_size]
-- @TODO:Test: NJLI.ImageBuilder.createArray(size)
--//! [ImageBuilder_createArray_size]

end

local function ImageBuilder_destroyArray_array()
--//! [ImageBuilder_destroyArray_array]
-- @TODO:Test: NJLI.ImageBuilder.destroyArray(array)
--//! [ImageBuilder_destroyArray_array]

end

local function ImageBuilder_create_()
--//! [ImageBuilder_create_]
-- @TODO:Test: NJLI.ImageBuilder.create()
--//! [ImageBuilder_create_]

end

local function ImageBuilder_clone_object()
--//! [ImageBuilder_clone_object]
-- @TODO:Test: NJLI.ImageBuilder.clone(object)
--//! [ImageBuilder_clone_object]

end

local function ImageBuilder_destroy_object()
--//! [ImageBuilder_destroy_object]
-- @TODO:Test: NJLI.ImageBuilder.destroy(object)
--//! [ImageBuilder_destroy_object]

end

local function ImageBuilder_load_object_L_stack_index()
--//! [ImageBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.ImageBuilder.load(object, L, stack_index)
--//! [ImageBuilder_load_object_L_stack_index]

end

local function ImageBuilder_type_()
--//! [ImageBuilder_type_]
-- @TODO:Test: NJLI.ImageBuilder.type()
--//! [ImageBuilder_type_]

end


function Test:testAll()
	ImageBuilder_calculateSerializeBufferSize_()
	ImageBuilder_serialize_dataBuffer_btSerializer()
	ImageBuilder_getObjectType_()
	ImageBuilder_getClassName_()
	ImageBuilder_getType_()
	ImageBuilder_createArray_size()
	ImageBuilder_destroyArray_array()
	ImageBuilder_create_()
	ImageBuilder_clone_object()
	ImageBuilder_destroy_object()
	ImageBuilder_load_object_L_stack_index()
	ImageBuilder_type_()
end

return Test