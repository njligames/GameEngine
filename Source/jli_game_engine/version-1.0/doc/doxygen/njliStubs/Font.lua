
--Test the functions for Font
local Test = {}

local function Font_calculateSerializeBufferSize_()
--//! [Font_calculateSerializeBufferSize_]
-- @TODO: Test: Font:calculateSerializeBufferSize()
--//! [Font_calculateSerializeBufferSize_]

end

local function Font_serialize_dataBuffer_btSerializer()
--//! [Font_serialize_dataBuffer_btSerializer]
-- @TODO: Test: Font:serialize(dataBuffer, btSerializer)
--//! [Font_serialize_dataBuffer_btSerializer]

end

local function Font_getClassName_()
--//! [Font_getClassName_]
-- @TODO: Test: Font:getClassName()
--//! [Font_getClassName_]

end

local function Font_getType_()
--//! [Font_getType_]
-- @TODO: Test: Font:getType()
--//! [Font_getType_]

end

local function Font_createArray_size()
--//! [Font_createArray_size]
-- @TODO:Test: NJLI.Font.createArray(size)
--//! [Font_createArray_size]

end

local function Font_destroyArray_array()
--//! [Font_destroyArray_array]
-- @TODO:Test: NJLI.Font.destroyArray(array)
--//! [Font_destroyArray_array]

end

local function Font_create_()
--//! [Font_create_]
-- @TODO:Test: NJLI.Font.create()
--//! [Font_create_]

end

local function Font_create_builder()
--//! [Font_create_builder]
-- @TODO:Test: NJLI.Font.create(builder)
--//! [Font_create_builder]

end

local function Font_clone_object()
--//! [Font_clone_object]
-- @TODO:Test: NJLI.Font.clone(object)
--//! [Font_clone_object]

end

local function Font_copy_object()
--//! [Font_copy_object]
-- @TODO:Test: NJLI.Font.copy(object)
--//! [Font_copy_object]

end

local function Font_destroy_object()
--//! [Font_destroy_object]
-- @TODO:Test: NJLI.Font.destroy(object)
--//! [Font_destroy_object]

end

local function Font_load_object_L_stack_index()
--//! [Font_load_object_L_stack_index]
-- @TODO:Test: NJLI.Font.load(object, L, stack_index)
--//! [Font_load_object_L_stack_index]

end

local function Font_type_()
--//! [Font_type_]
-- @TODO:Test: NJLI.Font.type()
--//! [Font_type_]

end


function Test:testAll()
	Font_calculateSerializeBufferSize_()
	Font_serialize_dataBuffer_btSerializer()
	Font_getClassName_()
	Font_getType_()
	Font_createArray_size()
	Font_destroyArray_array()
	Font_create_()
	Font_create_builder()
	Font_clone_object()
	Font_copy_object()
	Font_destroy_object()
	Font_load_object_L_stack_index()
	Font_type_()
end

return Test