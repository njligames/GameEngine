
--Test the functions for CubeBuilder
local Test = {}

local function CubeBuilder_calculateSerializeBufferSize_()
--//! [CubeBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: CubeBuilder:calculateSerializeBufferSize()
--//! [CubeBuilder_calculateSerializeBufferSize_]

end

local function CubeBuilder_serialize_dataBuffer_btSerializer()
--//! [CubeBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: CubeBuilder:serialize(dataBuffer, btSerializer)
--//! [CubeBuilder_serialize_dataBuffer_btSerializer]

end

local function CubeBuilder_getObjectType_()
--//! [CubeBuilder_getObjectType_]
-- @TODO: Test: CubeBuilder:getObjectType()
--//! [CubeBuilder_getObjectType_]

end

local function CubeBuilder_getClassName_()
--//! [CubeBuilder_getClassName_]
-- @TODO: Test: CubeBuilder:getClassName()
--//! [CubeBuilder_getClassName_]

end

local function CubeBuilder_getType_()
--//! [CubeBuilder_getType_]
-- @TODO: Test: CubeBuilder:getType()
--//! [CubeBuilder_getType_]

end

local function CubeBuilder_createArray_size()
--//! [CubeBuilder_createArray_size]
-- @TODO:Test: NJLI.CubeBuilder.createArray(size)
--//! [CubeBuilder_createArray_size]

end

local function CubeBuilder_destroyArray_array()
--//! [CubeBuilder_destroyArray_array]
-- @TODO:Test: NJLI.CubeBuilder.destroyArray(array)
--//! [CubeBuilder_destroyArray_array]

end

local function CubeBuilder_create_()
--//! [CubeBuilder_create_]
-- @TODO:Test: NJLI.CubeBuilder.create()
--//! [CubeBuilder_create_]

end

local function CubeBuilder_clone_object()
--//! [CubeBuilder_clone_object]
-- @TODO:Test: NJLI.CubeBuilder.clone(object)
--//! [CubeBuilder_clone_object]

end

local function CubeBuilder_destroy_object()
--//! [CubeBuilder_destroy_object]
-- @TODO:Test: NJLI.CubeBuilder.destroy(object)
--//! [CubeBuilder_destroy_object]

end

local function CubeBuilder_load_object_L_stack_index()
--//! [CubeBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.CubeBuilder.load(object, L, stack_index)
--//! [CubeBuilder_load_object_L_stack_index]

end

local function CubeBuilder_type_()
--//! [CubeBuilder_type_]
-- @TODO:Test: NJLI.CubeBuilder.type()
--//! [CubeBuilder_type_]

end


function Test:testAll()
	CubeBuilder_calculateSerializeBufferSize_()
	CubeBuilder_serialize_dataBuffer_btSerializer()
	CubeBuilder_getObjectType_()
	CubeBuilder_getClassName_()
	CubeBuilder_getType_()
	CubeBuilder_createArray_size()
	CubeBuilder_destroyArray_array()
	CubeBuilder_create_()
	CubeBuilder_clone_object()
	CubeBuilder_destroy_object()
	CubeBuilder_load_object_L_stack_index()
	CubeBuilder_type_()
end

return Test