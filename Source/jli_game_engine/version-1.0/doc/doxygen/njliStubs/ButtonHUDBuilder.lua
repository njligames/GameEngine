
--Test the functions for ButtonHUDBuilder
local Test = {}

local function ButtonHUDBuilder_calculateSerializeBufferSize_()
--//! [ButtonHUDBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: ButtonHUDBuilder:calculateSerializeBufferSize()
--//! [ButtonHUDBuilder_calculateSerializeBufferSize_]

end

local function ButtonHUDBuilder_serialize_dataBuffer_btSerializer()
--//! [ButtonHUDBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: ButtonHUDBuilder:serialize(dataBuffer, btSerializer)
--//! [ButtonHUDBuilder_serialize_dataBuffer_btSerializer]

end

local function ButtonHUDBuilder_getObjectType_()
--//! [ButtonHUDBuilder_getObjectType_]
-- @TODO: Test: ButtonHUDBuilder:getObjectType()
--//! [ButtonHUDBuilder_getObjectType_]

end

local function ButtonHUDBuilder_getClassName_()
--//! [ButtonHUDBuilder_getClassName_]
-- @TODO: Test: ButtonHUDBuilder:getClassName()
--//! [ButtonHUDBuilder_getClassName_]

end

local function ButtonHUDBuilder_getType_()
--//! [ButtonHUDBuilder_getType_]
-- @TODO: Test: ButtonHUDBuilder:getType()
--//! [ButtonHUDBuilder_getType_]

end

local function ButtonHUDBuilder_createArray_size()
--//! [ButtonHUDBuilder_createArray_size]
-- @TODO:Test: NJLI.ButtonHUDBuilder.createArray(size)
--//! [ButtonHUDBuilder_createArray_size]

end

local function ButtonHUDBuilder_destroyArray_array()
--//! [ButtonHUDBuilder_destroyArray_array]
-- @TODO:Test: NJLI.ButtonHUDBuilder.destroyArray(array)
--//! [ButtonHUDBuilder_destroyArray_array]

end

local function ButtonHUDBuilder_create_()
--//! [ButtonHUDBuilder_create_]
-- @TODO:Test: NJLI.ButtonHUDBuilder.create()
--//! [ButtonHUDBuilder_create_]

end

local function ButtonHUDBuilder_clone_object()
--//! [ButtonHUDBuilder_clone_object]
-- @TODO:Test: NJLI.ButtonHUDBuilder.clone(object)
--//! [ButtonHUDBuilder_clone_object]

end

local function ButtonHUDBuilder_destroy_object()
--//! [ButtonHUDBuilder_destroy_object]
-- @TODO:Test: NJLI.ButtonHUDBuilder.destroy(object)
--//! [ButtonHUDBuilder_destroy_object]

end

local function ButtonHUDBuilder_load_object_L_stack_index()
--//! [ButtonHUDBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.ButtonHUDBuilder.load(object, L, stack_index)
--//! [ButtonHUDBuilder_load_object_L_stack_index]

end

local function ButtonHUDBuilder_type_()
--//! [ButtonHUDBuilder_type_]
-- @TODO:Test: NJLI.ButtonHUDBuilder.type()
--//! [ButtonHUDBuilder_type_]

end


function Test:testAll()
	ButtonHUDBuilder_calculateSerializeBufferSize_()
	ButtonHUDBuilder_serialize_dataBuffer_btSerializer()
	ButtonHUDBuilder_getObjectType_()
	ButtonHUDBuilder_getClassName_()
	ButtonHUDBuilder_getType_()
	ButtonHUDBuilder_createArray_size()
	ButtonHUDBuilder_destroyArray_array()
	ButtonHUDBuilder_create_()
	ButtonHUDBuilder_clone_object()
	ButtonHUDBuilder_destroy_object()
	ButtonHUDBuilder_load_object_L_stack_index()
	ButtonHUDBuilder_type_()
end

return Test