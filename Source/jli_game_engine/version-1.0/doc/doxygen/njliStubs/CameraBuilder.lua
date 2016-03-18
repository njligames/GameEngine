
--Test the functions for CameraBuilder
local Test = {}

local function CameraBuilder_calculateSerializeBufferSize_()
--//! [CameraBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: CameraBuilder:calculateSerializeBufferSize()
--//! [CameraBuilder_calculateSerializeBufferSize_]

end

local function CameraBuilder_serialize_dataBuffer_btSerializer()
--//! [CameraBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: CameraBuilder:serialize(dataBuffer, btSerializer)
--//! [CameraBuilder_serialize_dataBuffer_btSerializer]

end

local function CameraBuilder_getObjectType_()
--//! [CameraBuilder_getObjectType_]
-- @TODO: Test: CameraBuilder:getObjectType()
--//! [CameraBuilder_getObjectType_]

end

local function CameraBuilder_getClassName_()
--//! [CameraBuilder_getClassName_]
-- @TODO: Test: CameraBuilder:getClassName()
--//! [CameraBuilder_getClassName_]

end

local function CameraBuilder_getType_()
--//! [CameraBuilder_getType_]
-- @TODO: Test: CameraBuilder:getType()
--//! [CameraBuilder_getType_]

end

local function CameraBuilder_createArray_size()
--//! [CameraBuilder_createArray_size]
-- @TODO:Test: NJLI.CameraBuilder.createArray(size)
--//! [CameraBuilder_createArray_size]

end

local function CameraBuilder_destroyArray_array()
--//! [CameraBuilder_destroyArray_array]
-- @TODO:Test: NJLI.CameraBuilder.destroyArray(array)
--//! [CameraBuilder_destroyArray_array]

end

local function CameraBuilder_create_()
--//! [CameraBuilder_create_]
-- @TODO:Test: NJLI.CameraBuilder.create()
--//! [CameraBuilder_create_]

end

local function CameraBuilder_clone_object()
--//! [CameraBuilder_clone_object]
-- @TODO:Test: NJLI.CameraBuilder.clone(object)
--//! [CameraBuilder_clone_object]

end

local function CameraBuilder_destroy_object()
--//! [CameraBuilder_destroy_object]
-- @TODO:Test: NJLI.CameraBuilder.destroy(object)
--//! [CameraBuilder_destroy_object]

end

local function CameraBuilder_load_object_L_stack_index()
--//! [CameraBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.CameraBuilder.load(object, L, stack_index)
--//! [CameraBuilder_load_object_L_stack_index]

end

local function CameraBuilder_type_()
--//! [CameraBuilder_type_]
-- @TODO:Test: NJLI.CameraBuilder.type()
--//! [CameraBuilder_type_]

end


function Test:testAll()
	CameraBuilder_calculateSerializeBufferSize_()
	CameraBuilder_serialize_dataBuffer_btSerializer()
	CameraBuilder_getObjectType_()
	CameraBuilder_getClassName_()
	CameraBuilder_getType_()
	CameraBuilder_createArray_size()
	CameraBuilder_destroyArray_array()
	CameraBuilder_create_()
	CameraBuilder_clone_object()
	CameraBuilder_destroy_object()
	CameraBuilder_load_object_L_stack_index()
	CameraBuilder_type_()
end

return Test