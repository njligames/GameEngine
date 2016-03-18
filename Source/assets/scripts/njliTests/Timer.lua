
--Test the functions for Timer
local Test = {}

local function Timer_calculateSerializeBufferSize_()
--//! [Timer_calculateSerializeBufferSize_]
-- @TODO: Test: Timer:calculateSerializeBufferSize()
--//! [Timer_calculateSerializeBufferSize_]

end

local function Timer_serialize_btSerializer()
--//! [Timer_serialize_btSerializer]
-- @TODO: Test: Timer:serialize(btSerializer)
--//! [Timer_serialize_btSerializer]

end

local function Timer_getClassName_()
--//! [Timer_getClassName_]
-- @TODO: Test: Timer:getClassName()
--//! [Timer_getClassName_]

end

local function Timer_getType_()
--//! [Timer_getType_]
-- @TODO: Test: Timer:getType()
--//! [Timer_getType_]

end

local function Timer_tick_()
--//! [Timer_tick_]
-- @TODO: Test: Timer:tick()
--//! [Timer_tick_]

end

local function Timer_start_()
--//! [Timer_start_]
-- @TODO: Test: Timer:start()
--//! [Timer_start_]

end

local function Timer_enablePause_()
--//! [Timer_enablePause_]
-- @TODO: Test: Timer:enablePause()
--//! [Timer_enablePause_]

end

local function Timer_isPaused_()
--//! [Timer_isPaused_]
-- @TODO: Test: Timer:isPaused()
--//! [Timer_isPaused_]

end

local function Timer_isFinished_()
--//! [Timer_isFinished_]
-- @TODO: Test: Timer:isFinished()
--//! [Timer_isFinished_]

end

local function Timer_getTimeMillisecondsLeft_()
--//! [Timer_getTimeMillisecondsLeft_]
-- @TODO: Test: Timer:getTimeMillisecondsLeft()
--//! [Timer_getTimeMillisecondsLeft_]

end

local function Timer_createArray_()
--//! [Timer_createArray_]
-- @TODO:Test: NJLI.Timer.createArray()
--//! [Timer_createArray_]

end

local function Timer_destroyArray_array()
--//! [Timer_destroyArray_array]
-- @TODO:Test: NJLI.Timer.destroyArray(array)
--//! [Timer_destroyArray_array]

end

local function Timer_create_()
--//! [Timer_create_]
-- @TODO:Test: NJLI.Timer.create()
--//! [Timer_create_]

end

local function Timer_create_builder()
--//! [Timer_create_builder]
-- @TODO:Test: NJLI.Timer.create(builder)
--//! [Timer_create_builder]

end

local function Timer_clone_object()
--//! [Timer_clone_object]
-- @TODO:Test: NJLI.Timer.clone(object)
--//! [Timer_clone_object]

end

local function Timer_copy_object()
--//! [Timer_copy_object]
-- @TODO:Test: NJLI.Timer.copy(object)
--//! [Timer_copy_object]

end

local function Timer_destroy_object()
--//! [Timer_destroy_object]
-- @TODO:Test: NJLI.Timer.destroy(object)
--//! [Timer_destroy_object]

end

local function Timer_load_object_L_stack_index()
--//! [Timer_load_object_L_stack_index]
-- @TODO:Test: NJLI.Timer.load(object, L, stack_index)
--//! [Timer_load_object_L_stack_index]

end

local function Timer_type_()
--//! [Timer_type_]
-- @TODO:Test: NJLI.Timer.type()
--//! [Timer_type_]

end


function Test:testAll()
	Timer_calculateSerializeBufferSize_()
	Timer_serialize_btSerializer()
	Timer_getClassName_()
	Timer_getType_()
	Timer_tick_()
	Timer_start_()
	Timer_enablePause_()
	Timer_isPaused_()
	Timer_isFinished_()
	Timer_getTimeMillisecondsLeft_()
	Timer_createArray_()
	Timer_destroyArray_array()
	Timer_create_()
	Timer_create_builder()
	Timer_clone_object()
	Timer_copy_object()
	Timer_destroy_object()
	Timer_load_object_L_stack_index()
	Timer_type_()
end

return Test