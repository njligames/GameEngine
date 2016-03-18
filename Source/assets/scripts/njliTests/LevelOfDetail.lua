
--Test the functions for LevelOfDetail
local Test = {}

local function LevelOfDetail_calculateSerializeBufferSize_()
--//! [LevelOfDetail_calculateSerializeBufferSize_]
-- @TODO: Test: LevelOfDetail:calculateSerializeBufferSize()
--//! [LevelOfDetail_calculateSerializeBufferSize_]

end

local function LevelOfDetail_serialize_dataBuffer_btSerializer()
--//! [LevelOfDetail_serialize_dataBuffer_btSerializer]
-- @TODO: Test: LevelOfDetail:serialize(dataBuffer, btSerializer)
--//! [LevelOfDetail_serialize_dataBuffer_btSerializer]

end

local function LevelOfDetail_getClassName_()
--//! [LevelOfDetail_getClassName_]
-- @TODO: Test: LevelOfDetail:getClassName()
--//! [LevelOfDetail_getClassName_]

end

local function LevelOfDetail_getType_()
--//! [LevelOfDetail_getType_]
-- @TODO: Test: LevelOfDetail:getType()
--//! [LevelOfDetail_getType_]

end

local function LevelOfDetail_createArray_size()
--//! [LevelOfDetail_createArray_size]
-- @TODO:Test: NJLI.LevelOfDetail.createArray(size)
--//! [LevelOfDetail_createArray_size]

end

local function LevelOfDetail_destroyArray_array()
--//! [LevelOfDetail_destroyArray_array]
-- @TODO:Test: NJLI.LevelOfDetail.destroyArray(array)
--//! [LevelOfDetail_destroyArray_array]

end

local function LevelOfDetail_create_()
--//! [LevelOfDetail_create_]
-- @TODO:Test: NJLI.LevelOfDetail.create()
--//! [LevelOfDetail_create_]

end

local function LevelOfDetail_create_builder()
--//! [LevelOfDetail_create_builder]
-- @TODO:Test: NJLI.LevelOfDetail.create(builder)
--//! [LevelOfDetail_create_builder]

end

local function LevelOfDetail_clone_object()
--//! [LevelOfDetail_clone_object]
-- @TODO:Test: NJLI.LevelOfDetail.clone(object)
--//! [LevelOfDetail_clone_object]

end

local function LevelOfDetail_copy_object()
--//! [LevelOfDetail_copy_object]
-- @TODO:Test: NJLI.LevelOfDetail.copy(object)
--//! [LevelOfDetail_copy_object]

end

local function LevelOfDetail_destroy_object()
--//! [LevelOfDetail_destroy_object]
-- @TODO:Test: NJLI.LevelOfDetail.destroy(object)
--//! [LevelOfDetail_destroy_object]

end

local function LevelOfDetail_load_object_L_stack_index()
--//! [LevelOfDetail_load_object_L_stack_index]
-- @TODO:Test: NJLI.LevelOfDetail.load(object, L, stack_index)
--//! [LevelOfDetail_load_object_L_stack_index]

end

local function LevelOfDetail_type_()
--//! [LevelOfDetail_type_]
-- @TODO:Test: NJLI.LevelOfDetail.type()
--//! [LevelOfDetail_type_]

end


function Test:testAll()
	LevelOfDetail_calculateSerializeBufferSize_()
	LevelOfDetail_serialize_dataBuffer_btSerializer()
	LevelOfDetail_getClassName_()
	LevelOfDetail_getType_()
	LevelOfDetail_createArray_size()
	LevelOfDetail_destroyArray_array()
	LevelOfDetail_create_()
	LevelOfDetail_create_builder()
	LevelOfDetail_clone_object()
	LevelOfDetail_copy_object()
	LevelOfDetail_destroy_object()
	LevelOfDetail_load_object_L_stack_index()
	LevelOfDetail_type_()
end

return Test