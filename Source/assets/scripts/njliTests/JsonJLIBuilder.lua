
--Test the functions for JsonJLIBuilder
local Test = {}

local function JsonJLIBuilder_calculateSerializeBufferSize_()
--//! [JsonJLIBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: JsonJLIBuilder:calculateSerializeBufferSize()
--//! [JsonJLIBuilder_calculateSerializeBufferSize_]

end

local function JsonJLIBuilder_serialize_dataBuffer_btSerializer()
--//! [JsonJLIBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: JsonJLIBuilder:serialize(dataBuffer, btSerializer)
--//! [JsonJLIBuilder_serialize_dataBuffer_btSerializer]

end

local function JsonJLIBuilder_getObjectType_()
--//! [JsonJLIBuilder_getObjectType_]
-- @TODO: Test: JsonJLIBuilder:getObjectType()
--//! [JsonJLIBuilder_getObjectType_]

end

local function JsonJLIBuilder_getClassName_()
--//! [JsonJLIBuilder_getClassName_]
-- @TODO: Test: JsonJLIBuilder:getClassName()
--//! [JsonJLIBuilder_getClassName_]

end

local function JsonJLIBuilder_getType_()
--//! [JsonJLIBuilder_getType_]
-- @TODO: Test: JsonJLIBuilder:getType()
--//! [JsonJLIBuilder_getType_]

end

local function JsonJLIBuilder_createArray_size()
--//! [JsonJLIBuilder_createArray_size]
-- @TODO:Test: NJLI.JsonJLIBuilder.createArray(size)
--//! [JsonJLIBuilder_createArray_size]

end

local function JsonJLIBuilder_destroyArray_array()
--//! [JsonJLIBuilder_destroyArray_array]
-- @TODO:Test: NJLI.JsonJLIBuilder.destroyArray(array)
--//! [JsonJLIBuilder_destroyArray_array]

end

local function JsonJLIBuilder_create_()
--//! [JsonJLIBuilder_create_]
-- @TODO:Test: NJLI.JsonJLIBuilder.create()
--//! [JsonJLIBuilder_create_]

end

local function JsonJLIBuilder_clone_object()
--//! [JsonJLIBuilder_clone_object]
-- @TODO:Test: NJLI.JsonJLIBuilder.clone(object)
--//! [JsonJLIBuilder_clone_object]

end

local function JsonJLIBuilder_destroy_object()
--//! [JsonJLIBuilder_destroy_object]
-- @TODO:Test: NJLI.JsonJLIBuilder.destroy(object)
--//! [JsonJLIBuilder_destroy_object]

end

local function JsonJLIBuilder_load_object_L_stack_index()
--//! [JsonJLIBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.JsonJLIBuilder.load(object, L, stack_index)
--//! [JsonJLIBuilder_load_object_L_stack_index]

end

local function JsonJLIBuilder_type_()
--//! [JsonJLIBuilder_type_]
-- @TODO:Test: NJLI.JsonJLIBuilder.type()
--//! [JsonJLIBuilder_type_]

end


function Test:testAll()
	JsonJLIBuilder_calculateSerializeBufferSize_()
	JsonJLIBuilder_serialize_dataBuffer_btSerializer()
	JsonJLIBuilder_getObjectType_()
	JsonJLIBuilder_getClassName_()
	JsonJLIBuilder_getType_()
	JsonJLIBuilder_createArray_size()
	JsonJLIBuilder_destroyArray_array()
	JsonJLIBuilder_create_()
	JsonJLIBuilder_clone_object()
	JsonJLIBuilder_destroy_object()
	JsonJLIBuilder_load_object_L_stack_index()
	JsonJLIBuilder_type_()
end

return Test