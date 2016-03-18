
--Test the functions for Clock
local Test = {}

local function Clock_calculateSerializeBufferSize_()
--//! [Clock_calculateSerializeBufferSize_]
-- @TODO: Test: Clock:calculateSerializeBufferSize()
--//! [Clock_calculateSerializeBufferSize_]

end

local function Clock_serialize_dataBuffer_btSerializer()
--//! [Clock_serialize_dataBuffer_btSerializer]
-- @TODO: Test: Clock:serialize(dataBuffer, btSerializer)
--//! [Clock_serialize_dataBuffer_btSerializer]

end

local function Clock_getClassName_()
--//! [Clock_getClassName_]
-- @TODO: Test: Clock:getClassName()
--//! [Clock_getClassName_]

end

local function Clock_getType_()
--//! [Clock_getType_]
-- @TODO: Test: Clock:getType()
--//! [Clock_getType_]

end

local function Clock_update_milliseconds()
--//! [Clock_update_milliseconds]
-- @TODO: Test: Clock:update(milliseconds)
--//! [Clock_update_milliseconds]

end

local function Clock_reset_()
--//! [Clock_reset_]
-- @TODO: Test: Clock:reset()
--//! [Clock_reset_]

end

local function Clock_getTimeMilliseconds_()
--//! [Clock_getTimeMilliseconds_]
-- @TODO: Test: Clock:getTimeMilliseconds()
--//! [Clock_getTimeMilliseconds_]

end

local function Clock_getTimeMicroseconds_()
--//! [Clock_getTimeMicroseconds_]
-- @TODO: Test: Clock:getTimeMicroseconds()
--//! [Clock_getTimeMicroseconds_]

end

local function Clock_createArray_size()
--//! [Clock_createArray_size]
-- @TODO:Test: NJLI.Clock.createArray(size)
--//! [Clock_createArray_size]

end

local function Clock_destroyArray_array()
--//! [Clock_destroyArray_array]
-- @TODO:Test: NJLI.Clock.destroyArray(array)
--//! [Clock_destroyArray_array]

end

local function Clock_create_()
--//! [Clock_create_]
-- @TODO:Test: NJLI.Clock.create()
--//! [Clock_create_]

end

local function Clock_create_builder()
--//! [Clock_create_builder]
-- @TODO:Test: NJLI.Clock.create(builder)
--//! [Clock_create_builder]

end

local function Clock_clone_object()
--//! [Clock_clone_object]
-- @TODO:Test: NJLI.Clock.clone(object)
--//! [Clock_clone_object]

end

local function Clock_copy_object()
--//! [Clock_copy_object]
-- @TODO:Test: NJLI.Clock.copy(object)
--//! [Clock_copy_object]

end

local function Clock_destroy_object()
--//! [Clock_destroy_object]
-- @TODO:Test: NJLI.Clock.destroy(object)
--//! [Clock_destroy_object]

end

local function Clock_load_object_L_stack_index()
--//! [Clock_load_object_L_stack_index]
-- @TODO:Test: NJLI.Clock.load(object, L, stack_index)
--//! [Clock_load_object_L_stack_index]

end

local function Clock_type_()
--//! [Clock_type_]
-- @TODO:Test: NJLI.Clock.type()
--//! [Clock_type_]

end


function Test:testAll()
	Clock_calculateSerializeBufferSize_()
	Clock_serialize_dataBuffer_btSerializer()
	Clock_getClassName_()
	Clock_getType_()
	Clock_update_milliseconds()
	Clock_reset_()
	Clock_getTimeMilliseconds_()
	Clock_getTimeMicroseconds_()
	Clock_createArray_size()
	Clock_destroyArray_array()
	Clock_create_()
	Clock_create_builder()
	Clock_clone_object()
	Clock_copy_object()
	Clock_destroy_object()
	Clock_load_object_L_stack_index()
	Clock_type_()
end

return Test