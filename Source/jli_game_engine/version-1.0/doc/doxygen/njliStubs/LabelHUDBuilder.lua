
--Test the functions for LabelHUDBuilder
local Test = {}

local function LabelHUDBuilder_calculateSerializeBufferSize_()
--//! [LabelHUDBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: LabelHUDBuilder:calculateSerializeBufferSize()
--//! [LabelHUDBuilder_calculateSerializeBufferSize_]

end

local function LabelHUDBuilder_serialize_dataBuffer_btSerializer()
--//! [LabelHUDBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: LabelHUDBuilder:serialize(dataBuffer, btSerializer)
--//! [LabelHUDBuilder_serialize_dataBuffer_btSerializer]

end

local function LabelHUDBuilder_getObjectType_()
--//! [LabelHUDBuilder_getObjectType_]
-- @TODO: Test: LabelHUDBuilder:getObjectType()
--//! [LabelHUDBuilder_getObjectType_]

end

local function LabelHUDBuilder_getClassName_()
--//! [LabelHUDBuilder_getClassName_]
-- @TODO: Test: LabelHUDBuilder:getClassName()
--//! [LabelHUDBuilder_getClassName_]

end

local function LabelHUDBuilder_getType_()
--//! [LabelHUDBuilder_getType_]
-- @TODO: Test: LabelHUDBuilder:getType()
--//! [LabelHUDBuilder_getType_]

end

local function LabelHUDBuilder_createArray_size()
--//! [LabelHUDBuilder_createArray_size]
-- @TODO:Test: NJLI.LabelHUDBuilder.createArray(size)
--//! [LabelHUDBuilder_createArray_size]

end

local function LabelHUDBuilder_destroyArray_array()
--//! [LabelHUDBuilder_destroyArray_array]
-- @TODO:Test: NJLI.LabelHUDBuilder.destroyArray(array)
--//! [LabelHUDBuilder_destroyArray_array]

end

local function LabelHUDBuilder_create_()
--//! [LabelHUDBuilder_create_]
-- @TODO:Test: NJLI.LabelHUDBuilder.create()
--//! [LabelHUDBuilder_create_]

end

local function LabelHUDBuilder_clone_object()
--//! [LabelHUDBuilder_clone_object]
-- @TODO:Test: NJLI.LabelHUDBuilder.clone(object)
--//! [LabelHUDBuilder_clone_object]

end

local function LabelHUDBuilder_destroy_object()
--//! [LabelHUDBuilder_destroy_object]
-- @TODO:Test: NJLI.LabelHUDBuilder.destroy(object)
--//! [LabelHUDBuilder_destroy_object]

end

local function LabelHUDBuilder_load_object_L_stack_index()
--//! [LabelHUDBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.LabelHUDBuilder.load(object, L, stack_index)
--//! [LabelHUDBuilder_load_object_L_stack_index]

end

local function LabelHUDBuilder_type_()
--//! [LabelHUDBuilder_type_]
-- @TODO:Test: NJLI.LabelHUDBuilder.type()
--//! [LabelHUDBuilder_type_]

end


function Test:testAll()
	LabelHUDBuilder_calculateSerializeBufferSize_()
	LabelHUDBuilder_serialize_dataBuffer_btSerializer()
	LabelHUDBuilder_getObjectType_()
	LabelHUDBuilder_getClassName_()
	LabelHUDBuilder_getType_()
	LabelHUDBuilder_createArray_size()
	LabelHUDBuilder_destroyArray_array()
	LabelHUDBuilder_create_()
	LabelHUDBuilder_clone_object()
	LabelHUDBuilder_destroy_object()
	LabelHUDBuilder_load_object_L_stack_index()
	LabelHUDBuilder_type_()
end

return Test