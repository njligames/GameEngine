
--Test the functions for MaterialBuilder
local Test = {}

local function MaterialBuilder_calculateSerializeBufferSize_()
--//! [MaterialBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: MaterialBuilder:calculateSerializeBufferSize()
--//! [MaterialBuilder_calculateSerializeBufferSize_]

end

local function MaterialBuilder_serialize_dataBuffer_btSerializer()
--//! [MaterialBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: MaterialBuilder:serialize(dataBuffer, btSerializer)
--//! [MaterialBuilder_serialize_dataBuffer_btSerializer]

end

local function MaterialBuilder_getObjectType_()
--//! [MaterialBuilder_getObjectType_]
-- @TODO: Test: MaterialBuilder:getObjectType()
--//! [MaterialBuilder_getObjectType_]

end

local function MaterialBuilder_getClassName_()
--//! [MaterialBuilder_getClassName_]
-- @TODO: Test: MaterialBuilder:getClassName()
--//! [MaterialBuilder_getClassName_]

end

local function MaterialBuilder_getType_()
--//! [MaterialBuilder_getType_]
-- @TODO: Test: MaterialBuilder:getType()
--//! [MaterialBuilder_getType_]

end

local function MaterialBuilder_createArray_size()
--//! [MaterialBuilder_createArray_size]
-- @TODO:Test: NJLI.MaterialBuilder.createArray(size)
--//! [MaterialBuilder_createArray_size]

end

local function MaterialBuilder_destroyArray_array()
--//! [MaterialBuilder_destroyArray_array]
-- @TODO:Test: NJLI.MaterialBuilder.destroyArray(array)
--//! [MaterialBuilder_destroyArray_array]

end

local function MaterialBuilder_create_()
--//! [MaterialBuilder_create_]
-- @TODO:Test: NJLI.MaterialBuilder.create()
--//! [MaterialBuilder_create_]

end

local function MaterialBuilder_clone_object()
--//! [MaterialBuilder_clone_object]
-- @TODO:Test: NJLI.MaterialBuilder.clone(object)
--//! [MaterialBuilder_clone_object]

end

local function MaterialBuilder_destroy_object()
--//! [MaterialBuilder_destroy_object]
-- @TODO:Test: NJLI.MaterialBuilder.destroy(object)
--//! [MaterialBuilder_destroy_object]

end

local function MaterialBuilder_load_object_L_stack_index()
--//! [MaterialBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.MaterialBuilder.load(object, L, stack_index)
--//! [MaterialBuilder_load_object_L_stack_index]

end

local function MaterialBuilder_type_()
--//! [MaterialBuilder_type_]
-- @TODO:Test: NJLI.MaterialBuilder.type()
--//! [MaterialBuilder_type_]

end


function Test:testAll()
	MaterialBuilder_calculateSerializeBufferSize_()
	MaterialBuilder_serialize_dataBuffer_btSerializer()
	MaterialBuilder_getObjectType_()
	MaterialBuilder_getClassName_()
	MaterialBuilder_getType_()
	MaterialBuilder_createArray_size()
	MaterialBuilder_destroyArray_array()
	MaterialBuilder_create_()
	MaterialBuilder_clone_object()
	MaterialBuilder_destroy_object()
	MaterialBuilder_load_object_L_stack_index()
	MaterialBuilder_type_()
end

return Test