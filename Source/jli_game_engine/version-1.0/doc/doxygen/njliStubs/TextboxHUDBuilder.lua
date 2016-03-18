
--Test the functions for TextboxHUDBuilder
local Test = {}

local function TextboxHUDBuilder_calculateSerializeBufferSize_()
--//! [TextboxHUDBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: TextboxHUDBuilder:calculateSerializeBufferSize()
--//! [TextboxHUDBuilder_calculateSerializeBufferSize_]

end

local function TextboxHUDBuilder_serialize_btSerializer()
--//! [TextboxHUDBuilder_serialize_btSerializer]
-- @TODO: Test: TextboxHUDBuilder:serialize(btSerializer)
--//! [TextboxHUDBuilder_serialize_btSerializer]

end

local function TextboxHUDBuilder_getObjectType_()
--//! [TextboxHUDBuilder_getObjectType_]
-- @TODO: Test: TextboxHUDBuilder:getObjectType()
--//! [TextboxHUDBuilder_getObjectType_]

end

local function TextboxHUDBuilder_getClassName_()
--//! [TextboxHUDBuilder_getClassName_]
-- @TODO: Test: TextboxHUDBuilder:getClassName()
--//! [TextboxHUDBuilder_getClassName_]

end

local function TextboxHUDBuilder_getType_()
--//! [TextboxHUDBuilder_getType_]
-- @TODO: Test: TextboxHUDBuilder:getType()
--//! [TextboxHUDBuilder_getType_]

end

local function TextboxHUDBuilder_createArray_size()
--//! [TextboxHUDBuilder_createArray_size]
-- @TODO:Test: NJLI.TextboxHUDBuilder.createArray(size)
--//! [TextboxHUDBuilder_createArray_size]

end

local function TextboxHUDBuilder_destroyArray_array()
--//! [TextboxHUDBuilder_destroyArray_array]
-- @TODO:Test: NJLI.TextboxHUDBuilder.destroyArray(array)
--//! [TextboxHUDBuilder_destroyArray_array]

end

local function TextboxHUDBuilder_create_()
--//! [TextboxHUDBuilder_create_]
-- @TODO:Test: NJLI.TextboxHUDBuilder.create()
--//! [TextboxHUDBuilder_create_]

end

local function TextboxHUDBuilder_clone_object()
--//! [TextboxHUDBuilder_clone_object]
-- @TODO:Test: NJLI.TextboxHUDBuilder.clone(object)
--//! [TextboxHUDBuilder_clone_object]

end

local function TextboxHUDBuilder_destroy_object()
--//! [TextboxHUDBuilder_destroy_object]
-- @TODO:Test: NJLI.TextboxHUDBuilder.destroy(object)
--//! [TextboxHUDBuilder_destroy_object]

end

local function TextboxHUDBuilder_load_object_L_stack_index()
--//! [TextboxHUDBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.TextboxHUDBuilder.load(object, L, stack_index)
--//! [TextboxHUDBuilder_load_object_L_stack_index]

end

local function TextboxHUDBuilder_type_()
--//! [TextboxHUDBuilder_type_]
-- @TODO:Test: NJLI.TextboxHUDBuilder.type()
--//! [TextboxHUDBuilder_type_]

end


function Test:testAll()
	TextboxHUDBuilder_calculateSerializeBufferSize_()
	TextboxHUDBuilder_serialize_btSerializer()
	TextboxHUDBuilder_getObjectType_()
	TextboxHUDBuilder_getClassName_()
	TextboxHUDBuilder_getType_()
	TextboxHUDBuilder_createArray_size()
	TextboxHUDBuilder_destroyArray_array()
	TextboxHUDBuilder_create_()
	TextboxHUDBuilder_clone_object()
	TextboxHUDBuilder_destroy_object()
	TextboxHUDBuilder_load_object_L_stack_index()
	TextboxHUDBuilder_type_()
end

return Test