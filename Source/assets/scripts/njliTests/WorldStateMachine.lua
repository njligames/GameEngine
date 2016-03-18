
--Test the functions for WorldStateMachine
local Test = {}

local function WorldStateMachine_calculateSerializeBufferSize_()
--//! [WorldStateMachine_calculateSerializeBufferSize_]
-- @TODO: Test: WorldStateMachine:calculateSerializeBufferSize()
--//! [WorldStateMachine_calculateSerializeBufferSize_]

end

local function WorldStateMachine_serialize_btSerializer()
--//! [WorldStateMachine_serialize_btSerializer]
-- @TODO: Test: WorldStateMachine:serialize(btSerializer)
--//! [WorldStateMachine_serialize_btSerializer]

end

local function WorldStateMachine_getClassName_()
--//! [WorldStateMachine_getClassName_]
-- @TODO: Test: WorldStateMachine:getClassName()
--//! [WorldStateMachine_getClassName_]

end

local function WorldStateMachine_getType_()
--//! [WorldStateMachine_getType_]
-- @TODO: Test: WorldStateMachine:getType()
--//! [WorldStateMachine_getType_]

end

local function WorldStateMachine_createArray_size()
--//! [WorldStateMachine_createArray_size]
-- @TODO:Test: NJLI.WorldStateMachine.createArray(size)
--//! [WorldStateMachine_createArray_size]

end

local function WorldStateMachine_destroyArray_array()
--//! [WorldStateMachine_destroyArray_array]
-- @TODO:Test: NJLI.WorldStateMachine.destroyArray(array)
--//! [WorldStateMachine_destroyArray_array]

end

local function WorldStateMachine_create_()
--//! [WorldStateMachine_create_]
-- @TODO:Test: NJLI.WorldStateMachine.create()
--//! [WorldStateMachine_create_]

end

local function WorldStateMachine_create_builder()
--//! [WorldStateMachine_create_builder]
-- @TODO:Test: NJLI.WorldStateMachine.create(builder)
--//! [WorldStateMachine_create_builder]

end

local function WorldStateMachine_clone_object()
--//! [WorldStateMachine_clone_object]
-- @TODO:Test: NJLI.WorldStateMachine.clone(object)
--//! [WorldStateMachine_clone_object]

end

local function WorldStateMachine_copy_object()
--//! [WorldStateMachine_copy_object]
-- @TODO:Test: NJLI.WorldStateMachine.copy(object)
--//! [WorldStateMachine_copy_object]

end

local function WorldStateMachine_destroy_object()
--//! [WorldStateMachine_destroy_object]
-- @TODO:Test: NJLI.WorldStateMachine.destroy(object)
--//! [WorldStateMachine_destroy_object]

end

local function WorldStateMachine_load_object_L_stack_index()
--//! [WorldStateMachine_load_object_L_stack_index]
-- @TODO:Test: NJLI.WorldStateMachine.load(object, L, stack_index)
--//! [WorldStateMachine_load_object_L_stack_index]

end

local function WorldStateMachine_type_()
--//! [WorldStateMachine_type_]
-- @TODO:Test: NJLI.WorldStateMachine.type()
--//! [WorldStateMachine_type_]

end


function Test:testAll()
	WorldStateMachine_calculateSerializeBufferSize_()
	WorldStateMachine_serialize_btSerializer()
	WorldStateMachine_getClassName_()
	WorldStateMachine_getType_()
	WorldStateMachine_createArray_size()
	WorldStateMachine_destroyArray_array()
	WorldStateMachine_create_()
	WorldStateMachine_create_builder()
	WorldStateMachine_clone_object()
	WorldStateMachine_copy_object()
	WorldStateMachine_destroy_object()
	WorldStateMachine_load_object_L_stack_index()
	WorldStateMachine_type_()
end

return Test