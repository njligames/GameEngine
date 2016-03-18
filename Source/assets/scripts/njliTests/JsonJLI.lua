
--Test the functions for JsonJLI
local Test = {}

local function JsonJLI_calculateSerializeBufferSize_()
--//! [JsonJLI_calculateSerializeBufferSize_]
-- @TODO: Test: JsonJLI:calculateSerializeBufferSize()
--//! [JsonJLI_calculateSerializeBufferSize_]

end

local function JsonJLI_serialize_dataBuffer_btSerializer()
--//! [JsonJLI_serialize_dataBuffer_btSerializer]
-- @TODO: Test: JsonJLI:serialize(dataBuffer, btSerializer)
--//! [JsonJLI_serialize_dataBuffer_btSerializer]

end

local function JsonJLI_getClassName_()
--//! [JsonJLI_getClassName_]
-- @TODO: Test: JsonJLI:getClassName()
--//! [JsonJLI_getClassName_]

end

local function JsonJLI_getType_()
--//! [JsonJLI_getType_]
-- @TODO: Test: JsonJLI:getType()
--//! [JsonJLI_getType_]

end

local function JsonJLI_parseJson_()
--//! [JsonJLI_parseJson_]
-- @TODO: Test: JsonJLI:parseJson()
--//! [JsonJLI_parseJson_]

end

local function JsonJLI_addValue_()
--//! [JsonJLI_addValue_]
-- @TODO: Test: JsonJLI:addValue()
--//! [JsonJLI_addValue_]

end

local function JsonJLI_addValue_()
--//! [JsonJLI_addValue_]
-- @TODO: Test: JsonJLI:addValue()
--//! [JsonJLI_addValue_]

end

local function JsonJLI_getValue_()
--//! [JsonJLI_getValue_]
-- @TODO: Test: JsonJLI:getValue()
--//! [JsonJLI_getValue_]

end

local function JsonJLI_append_()
--//! [JsonJLI_append_]
-- @TODO: Test: JsonJLI:append()
--//! [JsonJLI_append_]

end

local function JsonJLI_append_()
--//! [JsonJLI_append_]
-- @TODO: Test: JsonJLI:append()
--//! [JsonJLI_append_]

end

local function JsonJLI_createArray_size()
--//! [JsonJLI_createArray_size]
-- @TODO:Test: NJLI.JsonJLI.createArray(size)
--//! [JsonJLI_createArray_size]

end

local function JsonJLI_destroyArray_array()
--//! [JsonJLI_destroyArray_array]
-- @TODO:Test: NJLI.JsonJLI.destroyArray(array)
--//! [JsonJLI_destroyArray_array]

end

local function JsonJLI_create_()
--//! [JsonJLI_create_]
-- @TODO:Test: NJLI.JsonJLI.create()
--//! [JsonJLI_create_]

end

local function JsonJLI_create_builder()
--//! [JsonJLI_create_builder]
-- @TODO:Test: NJLI.JsonJLI.create(builder)
--//! [JsonJLI_create_builder]

end

local function JsonJLI_clone_object()
--//! [JsonJLI_clone_object]
-- @TODO:Test: NJLI.JsonJLI.clone(object)
--//! [JsonJLI_clone_object]

end

local function JsonJLI_copy_object()
--//! [JsonJLI_copy_object]
-- @TODO:Test: NJLI.JsonJLI.copy(object)
--//! [JsonJLI_copy_object]

end

local function JsonJLI_destroy_object()
--//! [JsonJLI_destroy_object]
-- @TODO:Test: NJLI.JsonJLI.destroy(object)
--//! [JsonJLI_destroy_object]

end

local function JsonJLI_load_object_L_stack_index()
--//! [JsonJLI_load_object_L_stack_index]
-- @TODO:Test: NJLI.JsonJLI.load(object, L, stack_index)
--//! [JsonJLI_load_object_L_stack_index]

end

local function JsonJLI_type_()
--//! [JsonJLI_type_]
-- @TODO:Test: NJLI.JsonJLI.type()
--//! [JsonJLI_type_]

end

local function JsonJLI_parse_()
--//! [JsonJLI_parse_]
-- @TODO:Test: NJLI.JsonJLI.parse()
--//! [JsonJLI_parse_]

end


function Test:testAll()
	JsonJLI_calculateSerializeBufferSize_()
	JsonJLI_serialize_dataBuffer_btSerializer()
	JsonJLI_getClassName_()
	JsonJLI_getType_()
	JsonJLI_parseJson_()
	JsonJLI_addValue_()
	JsonJLI_addValue_()
	JsonJLI_getValue_()
	JsonJLI_append_()
	JsonJLI_append_()
	JsonJLI_createArray_size()
	JsonJLI_destroyArray_array()
	JsonJLI_create_()
	JsonJLI_create_builder()
	JsonJLI_clone_object()
	JsonJLI_copy_object()
	JsonJLI_destroy_object()
	JsonJLI_load_object_L_stack_index()
	JsonJLI_type_()
	JsonJLI_parse_()
end

return Test