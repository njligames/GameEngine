
--Test the functions for SliderHUDBuilder
local Test = {}

local function SliderHUDBuilder_calculateSerializeBufferSize_()
--//! [SliderHUDBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: SliderHUDBuilder:calculateSerializeBufferSize()
--//! [SliderHUDBuilder_calculateSerializeBufferSize_]

end

local function SliderHUDBuilder_serialize_btSerializer()
--//! [SliderHUDBuilder_serialize_btSerializer]
-- @TODO: Test: SliderHUDBuilder:serialize(btSerializer)
--//! [SliderHUDBuilder_serialize_btSerializer]

end

local function SliderHUDBuilder_getObjectType_()
--//! [SliderHUDBuilder_getObjectType_]
-- @TODO: Test: SliderHUDBuilder:getObjectType()
--//! [SliderHUDBuilder_getObjectType_]

end

local function SliderHUDBuilder_getClassName_()
--//! [SliderHUDBuilder_getClassName_]
-- @TODO: Test: SliderHUDBuilder:getClassName()
--//! [SliderHUDBuilder_getClassName_]

end

local function SliderHUDBuilder_getType_()
--//! [SliderHUDBuilder_getType_]
-- @TODO: Test: SliderHUDBuilder:getType()
--//! [SliderHUDBuilder_getType_]

end

local function SliderHUDBuilder_createArray_size()
--//! [SliderHUDBuilder_createArray_size]
-- @TODO:Test: NJLI.SliderHUDBuilder.createArray(size)
--//! [SliderHUDBuilder_createArray_size]

end

local function SliderHUDBuilder_destroyArray_array()
--//! [SliderHUDBuilder_destroyArray_array]
-- @TODO:Test: NJLI.SliderHUDBuilder.destroyArray(array)
--//! [SliderHUDBuilder_destroyArray_array]

end

local function SliderHUDBuilder_create_()
--//! [SliderHUDBuilder_create_]
-- @TODO:Test: NJLI.SliderHUDBuilder.create()
--//! [SliderHUDBuilder_create_]

end

local function SliderHUDBuilder_clone_object()
--//! [SliderHUDBuilder_clone_object]
-- @TODO:Test: NJLI.SliderHUDBuilder.clone(object)
--//! [SliderHUDBuilder_clone_object]

end

local function SliderHUDBuilder_destroy_object()
--//! [SliderHUDBuilder_destroy_object]
-- @TODO:Test: NJLI.SliderHUDBuilder.destroy(object)
--//! [SliderHUDBuilder_destroy_object]

end

local function SliderHUDBuilder_load_object_L_stack_index()
--//! [SliderHUDBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.SliderHUDBuilder.load(object, L, stack_index)
--//! [SliderHUDBuilder_load_object_L_stack_index]

end

local function SliderHUDBuilder_type_()
--//! [SliderHUDBuilder_type_]
-- @TODO:Test: NJLI.SliderHUDBuilder.type()
--//! [SliderHUDBuilder_type_]

end


function Test:testAll()
	SliderHUDBuilder_calculateSerializeBufferSize_()
	SliderHUDBuilder_serialize_btSerializer()
	SliderHUDBuilder_getObjectType_()
	SliderHUDBuilder_getClassName_()
	SliderHUDBuilder_getType_()
	SliderHUDBuilder_createArray_size()
	SliderHUDBuilder_destroyArray_array()
	SliderHUDBuilder_create_()
	SliderHUDBuilder_clone_object()
	SliderHUDBuilder_destroy_object()
	SliderHUDBuilder_load_object_L_stack_index()
	SliderHUDBuilder_type_()
end

return Test