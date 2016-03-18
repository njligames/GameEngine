
--Test the functions for StopWatchBuilder
local Test = {}

local function StopWatchBuilder_calculateSerializeBufferSize_()
--//! [StopWatchBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: StopWatchBuilder:calculateSerializeBufferSize()
--//! [StopWatchBuilder_calculateSerializeBufferSize_]

end

local function StopWatchBuilder_serialize_btSerializer()
--//! [StopWatchBuilder_serialize_btSerializer]
-- @TODO: Test: StopWatchBuilder:serialize(btSerializer)
--//! [StopWatchBuilder_serialize_btSerializer]

end

local function StopWatchBuilder_getObjectType_()
--//! [StopWatchBuilder_getObjectType_]
-- @TODO: Test: StopWatchBuilder:getObjectType()
--//! [StopWatchBuilder_getObjectType_]

end

local function StopWatchBuilder_getClassName_()
--//! [StopWatchBuilder_getClassName_]
-- @TODO: Test: StopWatchBuilder:getClassName()
--//! [StopWatchBuilder_getClassName_]

end

local function StopWatchBuilder_getType_()
--//! [StopWatchBuilder_getType_]
-- @TODO: Test: StopWatchBuilder:getType()
--//! [StopWatchBuilder_getType_]

end

local function StopWatchBuilder_createArray_size()
--//! [StopWatchBuilder_createArray_size]
-- @TODO:Test: NJLI.StopWatchBuilder.createArray(size)
--//! [StopWatchBuilder_createArray_size]

end

local function StopWatchBuilder_destroyArray_array()
--//! [StopWatchBuilder_destroyArray_array]
-- @TODO:Test: NJLI.StopWatchBuilder.destroyArray(array)
--//! [StopWatchBuilder_destroyArray_array]

end

local function StopWatchBuilder_create_()
--//! [StopWatchBuilder_create_]
-- @TODO:Test: NJLI.StopWatchBuilder.create()
--//! [StopWatchBuilder_create_]

end

local function StopWatchBuilder_clone_object()
--//! [StopWatchBuilder_clone_object]
-- @TODO:Test: NJLI.StopWatchBuilder.clone(object)
--//! [StopWatchBuilder_clone_object]

end

local function StopWatchBuilder_destroy_object()
--//! [StopWatchBuilder_destroy_object]
-- @TODO:Test: NJLI.StopWatchBuilder.destroy(object)
--//! [StopWatchBuilder_destroy_object]

end

local function StopWatchBuilder_load_object_L_stack_index()
--//! [StopWatchBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.StopWatchBuilder.load(object, L, stack_index)
--//! [StopWatchBuilder_load_object_L_stack_index]

end

local function StopWatchBuilder_type_()
--//! [StopWatchBuilder_type_]
-- @TODO:Test: NJLI.StopWatchBuilder.type()
--//! [StopWatchBuilder_type_]

end


function Test:testAll()
	StopWatchBuilder_calculateSerializeBufferSize_()
	StopWatchBuilder_serialize_btSerializer()
	StopWatchBuilder_getObjectType_()
	StopWatchBuilder_getClassName_()
	StopWatchBuilder_getType_()
	StopWatchBuilder_createArray_size()
	StopWatchBuilder_destroyArray_array()
	StopWatchBuilder_create_()
	StopWatchBuilder_clone_object()
	StopWatchBuilder_destroy_object()
	StopWatchBuilder_load_object_L_stack_index()
	StopWatchBuilder_type_()
end

return Test