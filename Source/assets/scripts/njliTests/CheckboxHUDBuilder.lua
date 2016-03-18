
--Test the functions for CheckboxHUDBuilder
local Test = {}

local function CheckboxHUDBuilder_calculateSerializeBufferSize_()
--//! [CheckboxHUDBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: CheckboxHUDBuilder:calculateSerializeBufferSize()
--//! [CheckboxHUDBuilder_calculateSerializeBufferSize_]

end

local function CheckboxHUDBuilder_serialize_dataBuffer_btSerializer()
--//! [CheckboxHUDBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: CheckboxHUDBuilder:serialize(dataBuffer, btSerializer)
--//! [CheckboxHUDBuilder_serialize_dataBuffer_btSerializer]

end

local function CheckboxHUDBuilder_getObjectType_()
--//! [CheckboxHUDBuilder_getObjectType_]
-- @TODO: Test: CheckboxHUDBuilder:getObjectType()
--//! [CheckboxHUDBuilder_getObjectType_]

end

local function CheckboxHUDBuilder_getClassName_()
--//! [CheckboxHUDBuilder_getClassName_]
-- @TODO: Test: CheckboxHUDBuilder:getClassName()
--//! [CheckboxHUDBuilder_getClassName_]

end

local function CheckboxHUDBuilder_getType_()
--//! [CheckboxHUDBuilder_getType_]
-- @TODO: Test: CheckboxHUDBuilder:getType()
--//! [CheckboxHUDBuilder_getType_]

end

local function CheckboxHUDBuilder_createArray_size()
--//! [CheckboxHUDBuilder_createArray_size]
-- @TODO:Test: NJLI.CheckboxHUDBuilder.createArray(size)
--//! [CheckboxHUDBuilder_createArray_size]

end

local function CheckboxHUDBuilder_destroyArray_array()
--//! [CheckboxHUDBuilder_destroyArray_array]
-- @TODO:Test: NJLI.CheckboxHUDBuilder.destroyArray(array)
--//! [CheckboxHUDBuilder_destroyArray_array]

end

local function CheckboxHUDBuilder_create_()
--//! [CheckboxHUDBuilder_create_]
-- @TODO:Test: NJLI.CheckboxHUDBuilder.create()
--//! [CheckboxHUDBuilder_create_]

end

local function CheckboxHUDBuilder_clone_object()
--//! [CheckboxHUDBuilder_clone_object]
-- @TODO:Test: NJLI.CheckboxHUDBuilder.clone(object)
--//! [CheckboxHUDBuilder_clone_object]

end

local function CheckboxHUDBuilder_destroy_object()
--//! [CheckboxHUDBuilder_destroy_object]
-- @TODO:Test: NJLI.CheckboxHUDBuilder.destroy(object)
--//! [CheckboxHUDBuilder_destroy_object]

end

local function CheckboxHUDBuilder_load_object_L_stack_index()
--//! [CheckboxHUDBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.CheckboxHUDBuilder.load(object, L, stack_index)
--//! [CheckboxHUDBuilder_load_object_L_stack_index]

end

local function CheckboxHUDBuilder_type_()
--//! [CheckboxHUDBuilder_type_]
-- @TODO:Test: NJLI.CheckboxHUDBuilder.type()
--//! [CheckboxHUDBuilder_type_]

end


function Test:testAll()
	CheckboxHUDBuilder_calculateSerializeBufferSize_()
	CheckboxHUDBuilder_serialize_dataBuffer_btSerializer()
	CheckboxHUDBuilder_getObjectType_()
	CheckboxHUDBuilder_getClassName_()
	CheckboxHUDBuilder_getType_()
	CheckboxHUDBuilder_createArray_size()
	CheckboxHUDBuilder_destroyArray_array()
	CheckboxHUDBuilder_create_()
	CheckboxHUDBuilder_clone_object()
	CheckboxHUDBuilder_destroy_object()
	CheckboxHUDBuilder_load_object_L_stack_index()
	CheckboxHUDBuilder_type_()
end

return Test