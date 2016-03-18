
--Test the functions for DropdownHUD
local Test = {}

local function DropdownHUD_calculateSerializeBufferSize_()
--//! [DropdownHUD_calculateSerializeBufferSize_]
-- @TODO: Test: DropdownHUD:calculateSerializeBufferSize()
--//! [DropdownHUD_calculateSerializeBufferSize_]

end

local function DropdownHUD_serialize_dataBuffer_btSerializer()
--//! [DropdownHUD_serialize_dataBuffer_btSerializer]
-- @TODO: Test: DropdownHUD:serialize(dataBuffer, btSerializer)
--//! [DropdownHUD_serialize_dataBuffer_btSerializer]

end

local function DropdownHUD_getClassName_()
--//! [DropdownHUD_getClassName_]
-- @TODO: Test: DropdownHUD:getClassName()
--//! [DropdownHUD_getClassName_]

end

local function DropdownHUD_getType_()
--//! [DropdownHUD_getType_]
-- @TODO: Test: DropdownHUD:getType()
--//! [DropdownHUD_getType_]

end

local function DropdownHUD_createArray_size()
--//! [DropdownHUD_createArray_size]
-- @TODO:Test: NJLI.DropdownHUD.createArray(size)
--//! [DropdownHUD_createArray_size]

end

local function DropdownHUD_destroyArray_array()
--//! [DropdownHUD_destroyArray_array]
-- @TODO:Test: NJLI.DropdownHUD.destroyArray(array)
--//! [DropdownHUD_destroyArray_array]

end

local function DropdownHUD_create_()
--//! [DropdownHUD_create_]
-- @TODO:Test: NJLI.DropdownHUD.create()
--//! [DropdownHUD_create_]

end

local function DropdownHUD_create_builder()
--//! [DropdownHUD_create_builder]
-- @TODO:Test: NJLI.DropdownHUD.create(builder)
--//! [DropdownHUD_create_builder]

end

local function DropdownHUD_clone_object()
--//! [DropdownHUD_clone_object]
-- @TODO:Test: NJLI.DropdownHUD.clone(object)
--//! [DropdownHUD_clone_object]

end

local function DropdownHUD_copy_object()
--//! [DropdownHUD_copy_object]
-- @TODO:Test: NJLI.DropdownHUD.copy(object)
--//! [DropdownHUD_copy_object]

end

local function DropdownHUD_destroy_object()
--//! [DropdownHUD_destroy_object]
-- @TODO:Test: NJLI.DropdownHUD.destroy(object)
--//! [DropdownHUD_destroy_object]

end

local function DropdownHUD_load_object_L_stack_index()
--//! [DropdownHUD_load_object_L_stack_index]
-- @TODO:Test: NJLI.DropdownHUD.load(object, L, stack_index)
--//! [DropdownHUD_load_object_L_stack_index]

end

local function DropdownHUD_type_()
--//! [DropdownHUD_type_]
-- @TODO:Test: NJLI.DropdownHUD.type()
--//! [DropdownHUD_type_]

end


function Test:testAll()
	DropdownHUD_calculateSerializeBufferSize_()
	DropdownHUD_serialize_dataBuffer_btSerializer()
	DropdownHUD_getClassName_()
	DropdownHUD_getType_()
	DropdownHUD_createArray_size()
	DropdownHUD_destroyArray_array()
	DropdownHUD_create_()
	DropdownHUD_create_builder()
	DropdownHUD_clone_object()
	DropdownHUD_copy_object()
	DropdownHUD_destroy_object()
	DropdownHUD_load_object_L_stack_index()
	DropdownHUD_type_()
end

return Test