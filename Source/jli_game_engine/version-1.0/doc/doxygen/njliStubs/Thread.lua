
--Test the functions for Thread
local Test = {}

local function Thread_calculateSerializeBufferSize_()
--//! [Thread_calculateSerializeBufferSize_]
-- @TODO: Test: Thread:calculateSerializeBufferSize()
--//! [Thread_calculateSerializeBufferSize_]

end

local function Thread_serialize_btSerializer()
--//! [Thread_serialize_btSerializer]
-- @TODO: Test: Thread:serialize(btSerializer)
--//! [Thread_serialize_btSerializer]

end

local function Thread_getClassName_()
--//! [Thread_getClassName_]
-- @TODO: Test: Thread:getClassName()
--//! [Thread_getClassName_]

end

local function Thread_getType_()
--//! [Thread_getType_]
-- @TODO: Test: Thread:getType()
--//! [Thread_getType_]

end

local function Thread_setup_()
--//! [Thread_setup_]
-- @TODO: Test: Thread:setup()
--//! [Thread_setup_]

end

local function Thread_enablePause_()
--//! [Thread_enablePause_]
-- @TODO: Test: Thread:enablePause()
--//! [Thread_enablePause_]

end

local function Thread_isPaused_()
--//! [Thread_isPaused_]
-- @TODO: Test: Thread:isPaused()
--//! [Thread_isPaused_]

end

local function Thread_stop_()
--//! [Thread_stop_]
-- @TODO: Test: Thread:stop()
--//! [Thread_stop_]

end

local function Thread_run_()
--//! [Thread_run_]
-- @TODO: Test: Thread:run()
--//! [Thread_run_]

end

local function Thread_createArray_size()
--//! [Thread_createArray_size]
-- @TODO:Test: NJLI.Thread.createArray(size)
--//! [Thread_createArray_size]

end

local function Thread_destroyArray_array()
--//! [Thread_destroyArray_array]
-- @TODO:Test: NJLI.Thread.destroyArray(array)
--//! [Thread_destroyArray_array]

end

local function Thread_create_()
--//! [Thread_create_]
-- @TODO:Test: NJLI.Thread.create()
--//! [Thread_create_]

end

local function Thread_create_builder()
--//! [Thread_create_builder]
-- @TODO:Test: NJLI.Thread.create(builder)
--//! [Thread_create_builder]

end

local function Thread_clone_object()
--//! [Thread_clone_object]
-- @TODO:Test: NJLI.Thread.clone(object)
--//! [Thread_clone_object]

end

local function Thread_copy_object()
--//! [Thread_copy_object]
-- @TODO:Test: NJLI.Thread.copy(object)
--//! [Thread_copy_object]

end

local function Thread_destroy_object()
--//! [Thread_destroy_object]
-- @TODO:Test: NJLI.Thread.destroy(object)
--//! [Thread_destroy_object]

end

local function Thread_load_object_L_stack_index()
--//! [Thread_load_object_L_stack_index]
-- @TODO:Test: NJLI.Thread.load(object, L, stack_index)
--//! [Thread_load_object_L_stack_index]

end

local function Thread_type_()
--//! [Thread_type_]
-- @TODO:Test: NJLI.Thread.type()
--//! [Thread_type_]

end


function Test:testAll()
	Thread_calculateSerializeBufferSize_()
	Thread_serialize_btSerializer()
	Thread_getClassName_()
	Thread_getType_()
	Thread_setup_()
	Thread_enablePause_()
	Thread_isPaused_()
	Thread_stop_()
	Thread_run_()
	Thread_createArray_size()
	Thread_destroyArray_array()
	Thread_create_()
	Thread_create_builder()
	Thread_clone_object()
	Thread_copy_object()
	Thread_destroy_object()
	Thread_load_object_L_stack_index()
	Thread_type_()
end

return Test