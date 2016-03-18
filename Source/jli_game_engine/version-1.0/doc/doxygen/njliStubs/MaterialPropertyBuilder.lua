
--Test the functions for MaterialPropertyBuilder
local Test = {}

local function MaterialPropertyBuilder_calculateSerializeBufferSize_()
--//! [MaterialPropertyBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: MaterialPropertyBuilder:calculateSerializeBufferSize()
--//! [MaterialPropertyBuilder_calculateSerializeBufferSize_]

end

local function MaterialPropertyBuilder_serialize_dataBuffer_btSerializer()
--//! [MaterialPropertyBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: MaterialPropertyBuilder:serialize(dataBuffer, btSerializer)
--//! [MaterialPropertyBuilder_serialize_dataBuffer_btSerializer]

end

local function MaterialPropertyBuilder_getObjectType_()
--//! [MaterialPropertyBuilder_getObjectType_]
-- @TODO: Test: MaterialPropertyBuilder:getObjectType()
--//! [MaterialPropertyBuilder_getObjectType_]

end

local function MaterialPropertyBuilder_getClassName_()
--//! [MaterialPropertyBuilder_getClassName_]
-- @TODO: Test: MaterialPropertyBuilder:getClassName()
--//! [MaterialPropertyBuilder_getClassName_]

end

local function MaterialPropertyBuilder_getType_()
--//! [MaterialPropertyBuilder_getType_]
-- @TODO: Test: MaterialPropertyBuilder:getType()
--//! [MaterialPropertyBuilder_getType_]

end

local function MaterialPropertyBuilder_createArray_size()
--//! [MaterialPropertyBuilder_createArray_size]
-- @TODO:Test: NJLI.MaterialPropertyBuilder.createArray(size)
--//! [MaterialPropertyBuilder_createArray_size]

end

local function MaterialPropertyBuilder_destroyArray_array_size()
--//! [MaterialPropertyBuilder_destroyArray_array_size]
-- @TODO:Test: NJLI.MaterialPropertyBuilder.destroyArray(array, size)
--//! [MaterialPropertyBuilder_destroyArray_array_size]

end

local function MaterialPropertyBuilder_create_()
--//! [MaterialPropertyBuilder_create_]
-- @TODO:Test: NJLI.MaterialPropertyBuilder.create()
--//! [MaterialPropertyBuilder_create_]

end

local function MaterialPropertyBuilder_clone_object()
--//! [MaterialPropertyBuilder_clone_object]
-- @TODO:Test: NJLI.MaterialPropertyBuilder.clone(object)
--//! [MaterialPropertyBuilder_clone_object]

end

local function MaterialPropertyBuilder_destroy_object()
--//! [MaterialPropertyBuilder_destroy_object]
-- @TODO:Test: NJLI.MaterialPropertyBuilder.destroy(object)
--//! [MaterialPropertyBuilder_destroy_object]

end

local function MaterialPropertyBuilder_load_object_L_stack_index()
--//! [MaterialPropertyBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.MaterialPropertyBuilder.load(object, L, stack_index)
--//! [MaterialPropertyBuilder_load_object_L_stack_index]

end

local function MaterialPropertyBuilder_type_()
--//! [MaterialPropertyBuilder_type_]
-- @TODO:Test: NJLI.MaterialPropertyBuilder.type()
--//! [MaterialPropertyBuilder_type_]

end


function Test:testAll()
	MaterialPropertyBuilder_calculateSerializeBufferSize_()
	MaterialPropertyBuilder_serialize_dataBuffer_btSerializer()
	MaterialPropertyBuilder_getObjectType_()
	MaterialPropertyBuilder_getClassName_()
	MaterialPropertyBuilder_getType_()
	MaterialPropertyBuilder_createArray_size()
	MaterialPropertyBuilder_destroyArray_array_size()
	MaterialPropertyBuilder_create_()
	MaterialPropertyBuilder_clone_object()
	MaterialPropertyBuilder_destroy_object()
	MaterialPropertyBuilder_load_object_L_stack_index()
	MaterialPropertyBuilder_type_()
end

return Test