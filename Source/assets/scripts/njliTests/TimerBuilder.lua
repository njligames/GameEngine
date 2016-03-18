
--Test the functions for TimerBuilder
local Test = {}

local function TimerBuilder_calculateSerializeBufferSize_()
--//! [TimerBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: TimerBuilder:calculateSerializeBufferSize()
--//! [TimerBuilder_calculateSerializeBufferSize_]

end

local function TimerBuilder_serialize_btSerializer()
--//! [TimerBuilder_serialize_btSerializer]
-- @TODO: Test: TimerBuilder:serialize(btSerializer)
--//! [TimerBuilder_serialize_btSerializer]

end

local function TimerBuilder_getObjectType_()
--//! [TimerBuilder_getObjectType_]
-- @TODO: Test: TimerBuilder:getObjectType()
--//! [TimerBuilder_getObjectType_]

end

local function TimerBuilder_getClassName_()
--//! [TimerBuilder_getClassName_]
-- @TODO: Test: TimerBuilder:getClassName()
--//! [TimerBuilder_getClassName_]

end

local function TimerBuilder_getType_()
--//! [TimerBuilder_getType_]
-- @TODO: Test: TimerBuilder:getType()
--//! [TimerBuilder_getType_]

end

local function TimerBuilder_createArray_size()
--//! [TimerBuilder_createArray_size]
-- @TODO:Test: NJLI.TimerBuilder.createArray(size)
--//! [TimerBuilder_createArray_size]

end

local function TimerBuilder_destroyArray_array()
--//! [TimerBuilder_destroyArray_array]
-- @TODO:Test: NJLI.TimerBuilder.destroyArray(array)
--//! [TimerBuilder_destroyArray_array]

end

local function TimerBuilder_create_()
--//! [TimerBuilder_create_]
-- @TODO:Test: NJLI.TimerBuilder.create()
--//! [TimerBuilder_create_]

end

local function TimerBuilder_clone_object()
--//! [TimerBuilder_clone_object]
-- @TODO:Test: NJLI.TimerBuilder.clone(object)
--//! [TimerBuilder_clone_object]

end

local function TimerBuilder_destroy_object()
--//! [TimerBuilder_destroy_object]
-- @TODO:Test: NJLI.TimerBuilder.destroy(object)
--//! [TimerBuilder_destroy_object]

end

local function TimerBuilder_load_object_L_stack_index()
--//! [TimerBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.TimerBuilder.load(object, L, stack_index)
--//! [TimerBuilder_load_object_L_stack_index]

end

local function TimerBuilder_type_()
--//! [TimerBuilder_type_]
-- @TODO:Test: NJLI.TimerBuilder.type()
--//! [TimerBuilder_type_]

end


function Test:testAll()
	TimerBuilder_calculateSerializeBufferSize_()
	TimerBuilder_serialize_btSerializer()
	TimerBuilder_getObjectType_()
	TimerBuilder_getClassName_()
	TimerBuilder_getType_()
	TimerBuilder_createArray_size()
	TimerBuilder_destroyArray_array()
	TimerBuilder_create_()
	TimerBuilder_clone_object()
	TimerBuilder_destroy_object()
	TimerBuilder_load_object_L_stack_index()
	TimerBuilder_type_()
end

return Test