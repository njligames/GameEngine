
--Test the functions for Light
local Test = {}

local function Light_calculateSerializeBufferSize_()
--//! [Light_calculateSerializeBufferSize_]
-- @TODO: Test: Light:calculateSerializeBufferSize()
--//! [Light_calculateSerializeBufferSize_]

end

local function Light_serialize_dataBuffer_btSerializer()
--//! [Light_serialize_dataBuffer_btSerializer]
-- @TODO: Test: Light:serialize(dataBuffer, btSerializer)
--//! [Light_serialize_dataBuffer_btSerializer]

end

local function Light_getClassName_()
--//! [Light_getClassName_]
-- @TODO: Test: Light:getClassName()
--//! [Light_getClassName_]

end

local function Light_getType_()
--//! [Light_getType_]
-- @TODO: Test: Light:getType()
--//! [Light_getType_]

end

local function Light_createArray_size()
--//! [Light_createArray_size]
-- @TODO:Test: NJLI.Light.createArray(size)
--//! [Light_createArray_size]

end

local function Light_destroyArray_array()
--//! [Light_destroyArray_array]
-- @TODO:Test: NJLI.Light.destroyArray(array)
--//! [Light_destroyArray_array]

end

local function Light_create_()
--//! [Light_create_]
-- @TODO:Test: NJLI.Light.create()
--//! [Light_create_]

end

local function Light_create_builder()
--//! [Light_create_builder]
-- @TODO:Test: NJLI.Light.create(builder)
--//! [Light_create_builder]

end

local function Light_clone_object()
--//! [Light_clone_object]
-- @TODO:Test: NJLI.Light.clone(object)
--//! [Light_clone_object]

end

local function Light_copy_object()
--//! [Light_copy_object]
-- @TODO:Test: NJLI.Light.copy(object)
--//! [Light_copy_object]

end

local function Light_destroy_object()
--//! [Light_destroy_object]
-- @TODO:Test: NJLI.Light.destroy(object)
--//! [Light_destroy_object]

end

local function Light_load_object_L_stack_index()
--//! [Light_load_object_L_stack_index]
-- @TODO:Test: NJLI.Light.load(object, L, stack_index)
--//! [Light_load_object_L_stack_index]

end

local function Light_type_()
--//! [Light_type_]
-- @TODO:Test: NJLI.Light.type()
--//! [Light_type_]

end


function Test:testAll()
	Light_calculateSerializeBufferSize_()
	Light_serialize_dataBuffer_btSerializer()
	Light_getClassName_()
	Light_getType_()
	Light_createArray_size()
	Light_destroyArray_array()
	Light_create_()
	Light_create_builder()
	Light_clone_object()
	Light_copy_object()
	Light_destroy_object()
	Light_load_object_L_stack_index()
	Light_type_()
end

return Test