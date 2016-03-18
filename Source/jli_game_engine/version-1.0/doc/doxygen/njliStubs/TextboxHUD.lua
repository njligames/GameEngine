
--Test the functions for TextboxHUD
local Test = {}

local function TextboxHUD_calculateSerializeBufferSize_()
--//! [TextboxHUD_calculateSerializeBufferSize_]
-- @TODO: Test: TextboxHUD:calculateSerializeBufferSize()
--//! [TextboxHUD_calculateSerializeBufferSize_]

end

local function TextboxHUD_serialize_btSerializer()
--//! [TextboxHUD_serialize_btSerializer]
-- @TODO: Test: TextboxHUD:serialize(btSerializer)
--//! [TextboxHUD_serialize_btSerializer]

end

local function TextboxHUD_getClassName_()
--//! [TextboxHUD_getClassName_]
-- @TODO: Test: TextboxHUD:getClassName()
--//! [TextboxHUD_getClassName_]

end

local function TextboxHUD_getType_()
--//! [TextboxHUD_getType_]
-- @TODO: Test: TextboxHUD:getType()
--//! [TextboxHUD_getType_]

end

local function TextboxHUD_createArray_size()
--//! [TextboxHUD_createArray_size]
-- @TODO:Test: NJLI.TextboxHUD.createArray(size)
--//! [TextboxHUD_createArray_size]

end

local function TextboxHUD_destroyArray_array()
--//! [TextboxHUD_destroyArray_array]
-- @TODO:Test: NJLI.TextboxHUD.destroyArray(array)
--//! [TextboxHUD_destroyArray_array]

end

local function TextboxHUD_create_()
--//! [TextboxHUD_create_]
-- @TODO:Test: NJLI.TextboxHUD.create()
--//! [TextboxHUD_create_]

end

local function TextboxHUD_create_builder()
--//! [TextboxHUD_create_builder]
-- @TODO:Test: NJLI.TextboxHUD.create(builder)
--//! [TextboxHUD_create_builder]

end

local function TextboxHUD_clone_object()
--//! [TextboxHUD_clone_object]
-- @TODO:Test: NJLI.TextboxHUD.clone(object)
--//! [TextboxHUD_clone_object]

end

local function TextboxHUD_copy_object()
--//! [TextboxHUD_copy_object]
-- @TODO:Test: NJLI.TextboxHUD.copy(object)
--//! [TextboxHUD_copy_object]

end

local function TextboxHUD_destroy_object()
--//! [TextboxHUD_destroy_object]
-- @TODO:Test: NJLI.TextboxHUD.destroy(object)
--//! [TextboxHUD_destroy_object]

end

local function TextboxHUD_load_object_L_stack_index()
--//! [TextboxHUD_load_object_L_stack_index]
-- @TODO:Test: NJLI.TextboxHUD.load(object, L, stack_index)
--//! [TextboxHUD_load_object_L_stack_index]

end

local function TextboxHUD_type_()
--//! [TextboxHUD_type_]
-- @TODO:Test: NJLI.TextboxHUD.type()
--//! [TextboxHUD_type_]

end


function Test:testAll()
	TextboxHUD_calculateSerializeBufferSize_()
	TextboxHUD_serialize_btSerializer()
	TextboxHUD_getClassName_()
	TextboxHUD_getType_()
	TextboxHUD_createArray_size()
	TextboxHUD_destroyArray_array()
	TextboxHUD_create_()
	TextboxHUD_create_builder()
	TextboxHUD_clone_object()
	TextboxHUD_copy_object()
	TextboxHUD_destroy_object()
	TextboxHUD_load_object_L_stack_index()
	TextboxHUD_type_()
end

return Test