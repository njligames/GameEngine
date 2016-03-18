
--Test the functions for StopWatch
local Test = {}

local function StopWatch_calculateSerializeBufferSize_()
--//! [StopWatch_calculateSerializeBufferSize_]
-- @TODO: Test: StopWatch:calculateSerializeBufferSize()
--//! [StopWatch_calculateSerializeBufferSize_]

end

local function StopWatch_serialize_btSerializer()
--//! [StopWatch_serialize_btSerializer]
-- @TODO: Test: StopWatch:serialize(btSerializer)
--//! [StopWatch_serialize_btSerializer]

end

local function StopWatch_getClassName_()
--//! [StopWatch_getClassName_]
-- @TODO: Test: StopWatch:getClassName()
--//! [StopWatch_getClassName_]

end

local function StopWatch_getType_()
--//! [StopWatch_getType_]
-- @TODO: Test: StopWatch:getType()
--//! [StopWatch_getType_]

end

local function StopWatch_update_milliseconds()
--//! [StopWatch_update_milliseconds]
-- @TODO: Test: StopWatch:update(milliseconds)
--//! [StopWatch_update_milliseconds]

end

local function StopWatch_start_()
--//! [StopWatch_start_]
-- @TODO: Test: StopWatch:start()
--//! [StopWatch_start_]

end

local function StopWatch_getMilliseconds_()
--//! [StopWatch_getMilliseconds_]
-- @TODO: Test: StopWatch:getMilliseconds()
--//! [StopWatch_getMilliseconds_]

end

local function StopWatch_stop_()
--//! [StopWatch_stop_]
-- @TODO: Test: StopWatch:stop()
--//! [StopWatch_stop_]

end

local function StopWatch_isStopped_()
--//! [StopWatch_isStopped_]
-- @TODO: Test: StopWatch:isStopped()
--//! [StopWatch_isStopped_]

end

local function StopWatch_lap_()
--//! [StopWatch_lap_]
-- @TODO: Test: StopWatch:lap()
--//! [StopWatch_lap_]

end

local function StopWatch_clearLaps_()
--//! [StopWatch_clearLaps_]
-- @TODO: Test: StopWatch:clearLaps()
--//! [StopWatch_clearLaps_]

end

local function StopWatch_numberOfLaps_()
--//! [StopWatch_numberOfLaps_]
-- @TODO: Test: StopWatch:numberOfLaps()
--//! [StopWatch_numberOfLaps_]

end

local function StopWatch_createArray_size()
--//! [StopWatch_createArray_size]
-- @TODO:Test: NJLI.StopWatch.createArray(size)
--//! [StopWatch_createArray_size]

end

local function StopWatch_destroyArray_array()
--//! [StopWatch_destroyArray_array]
-- @TODO:Test: NJLI.StopWatch.destroyArray(array)
--//! [StopWatch_destroyArray_array]

end

local function StopWatch_create_()
--//! [StopWatch_create_]
-- @TODO:Test: NJLI.StopWatch.create()
--//! [StopWatch_create_]

end

local function StopWatch_create_builder()
--//! [StopWatch_create_builder]
-- @TODO:Test: NJLI.StopWatch.create(builder)
--//! [StopWatch_create_builder]

end

local function StopWatch_clone_object()
--//! [StopWatch_clone_object]
-- @TODO:Test: NJLI.StopWatch.clone(object)
--//! [StopWatch_clone_object]

end

local function StopWatch_copy_object()
--//! [StopWatch_copy_object]
-- @TODO:Test: NJLI.StopWatch.copy(object)
--//! [StopWatch_copy_object]

end

local function StopWatch_destroy_object()
--//! [StopWatch_destroy_object]
-- @TODO:Test: NJLI.StopWatch.destroy(object)
--//! [StopWatch_destroy_object]

end

local function StopWatch_load_object_L_stack_index()
--//! [StopWatch_load_object_L_stack_index]
-- @TODO:Test: NJLI.StopWatch.load(object, L, stack_index)
--//! [StopWatch_load_object_L_stack_index]

end

local function StopWatch_type_()
--//! [StopWatch_type_]
-- @TODO:Test: NJLI.StopWatch.type()
--//! [StopWatch_type_]

end


function Test:testAll()
	StopWatch_calculateSerializeBufferSize_()
	StopWatch_serialize_btSerializer()
	StopWatch_getClassName_()
	StopWatch_getType_()
	StopWatch_update_milliseconds()
	StopWatch_start_()
	StopWatch_getMilliseconds_()
	StopWatch_stop_()
	StopWatch_isStopped_()
	StopWatch_lap_()
	StopWatch_clearLaps_()
	StopWatch_numberOfLaps_()
	StopWatch_createArray_size()
	StopWatch_destroyArray_array()
	StopWatch_create_()
	StopWatch_create_builder()
	StopWatch_clone_object()
	StopWatch_copy_object()
	StopWatch_destroy_object()
	StopWatch_load_object_L_stack_index()
	StopWatch_type_()
end

return Test