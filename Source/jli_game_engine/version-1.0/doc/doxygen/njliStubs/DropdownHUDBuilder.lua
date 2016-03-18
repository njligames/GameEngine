
--Test the functions for DropdownHUDBuilder
local Test = {}

local function DropdownHUDBuilder_calculateSerializeBufferSize_()
--//! [DropdownHUDBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: DropdownHUDBuilder:calculateSerializeBufferSize()
--//! [DropdownHUDBuilder_calculateSerializeBufferSize_]

end

local function DropdownHUDBuilder_serialize_dataBuffer_btSerializer()
--//! [DropdownHUDBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: DropdownHUDBuilder:serialize(dataBuffer, btSerializer)
--//! [DropdownHUDBuilder_serialize_dataBuffer_btSerializer]

end

local function DropdownHUDBuilder_getObjectType_()
--//! [DropdownHUDBuilder_getObjectType_]
-- @TODO: Test: DropdownHUDBuilder:getObjectType()
--//! [DropdownHUDBuilder_getObjectType_]

end

local function DropdownHUDBuilder_getClassName_()
--//! [DropdownHUDBuilder_getClassName_]
-- @TODO: Test: DropdownHUDBuilder:getClassName()
--//! [DropdownHUDBuilder_getClassName_]

end

local function DropdownHUDBuilder_getType_()
--//! [DropdownHUDBuilder_getType_]
-- @TODO: Test: DropdownHUDBuilder:getType()
--//! [DropdownHUDBuilder_getType_]

end

local function DropdownHUDBuilder_createArray_size()
--//! [DropdownHUDBuilder_createArray_size]
-- @TODO:Test: NJLI.DropdownHUDBuilder.createArray(size)
--//! [DropdownHUDBuilder_createArray_size]

end

local function DropdownHUDBuilder_destroyArray_array()
--//! [DropdownHUDBuilder_destroyArray_array]
-- @TODO:Test: NJLI.DropdownHUDBuilder.destroyArray(array)
--//! [DropdownHUDBuilder_destroyArray_array]

end

local function DropdownHUDBuilder_create_()
--//! [DropdownHUDBuilder_create_]
-- @TODO:Test: NJLI.DropdownHUDBuilder.create()
--//! [DropdownHUDBuilder_create_]

end

local function DropdownHUDBuilder_clone_object()
--//! [DropdownHUDBuilder_clone_object]
-- @TODO:Test: NJLI.DropdownHUDBuilder.clone(object)
--//! [DropdownHUDBuilder_clone_object]

end

local function DropdownHUDBuilder_destroy_object()
--//! [DropdownHUDBuilder_destroy_object]
-- @TODO:Test: NJLI.DropdownHUDBuilder.destroy(object)
--//! [DropdownHUDBuilder_destroy_object]

end

local function DropdownHUDBuilder_load_object_L_stack_index()
--//! [DropdownHUDBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.DropdownHUDBuilder.load(object, L, stack_index)
--//! [DropdownHUDBuilder_load_object_L_stack_index]

end

local function DropdownHUDBuilder_type_()
--//! [DropdownHUDBuilder_type_]
-- @TODO:Test: NJLI.DropdownHUDBuilder.type()
--//! [DropdownHUDBuilder_type_]

end


function Test:testAll()
	DropdownHUDBuilder_calculateSerializeBufferSize_()
	DropdownHUDBuilder_serialize_dataBuffer_btSerializer()
	DropdownHUDBuilder_getObjectType_()
	DropdownHUDBuilder_getClassName_()
	DropdownHUDBuilder_getType_()
	DropdownHUDBuilder_createArray_size()
	DropdownHUDBuilder_destroyArray_array()
	DropdownHUDBuilder_create_()
	DropdownHUDBuilder_clone_object()
	DropdownHUDBuilder_destroy_object()
	DropdownHUDBuilder_load_object_L_stack_index()
	DropdownHUDBuilder_type_()
end

return Test