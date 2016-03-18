
--Test the functions for SceneStateMachine
local Test = {}

local function SceneStateMachine_calculateSerializeBufferSize_()
--//! [SceneStateMachine_calculateSerializeBufferSize_]
-- @TODO: Test: SceneStateMachine:calculateSerializeBufferSize()
--//! [SceneStateMachine_calculateSerializeBufferSize_]

end

local function SceneStateMachine_serialize_btSerializer()
--//! [SceneStateMachine_serialize_btSerializer]
-- @TODO: Test: SceneStateMachine:serialize(btSerializer)
--//! [SceneStateMachine_serialize_btSerializer]

end

local function SceneStateMachine_getClassName_()
--//! [SceneStateMachine_getClassName_]
-- @TODO: Test: SceneStateMachine:getClassName()
--//! [SceneStateMachine_getClassName_]

end

local function SceneStateMachine_getType_()
--//! [SceneStateMachine_getType_]
-- @TODO: Test: SceneStateMachine:getType()
--//! [SceneStateMachine_getType_]

end

local function SceneStateMachine_createArray_size()
--//! [SceneStateMachine_createArray_size]
-- @TODO:Test: NJLI.SceneStateMachine.createArray(size)
--//! [SceneStateMachine_createArray_size]

end

local function SceneStateMachine_destroyArray_array()
--//! [SceneStateMachine_destroyArray_array]
-- @TODO:Test: NJLI.SceneStateMachine.destroyArray(array)
--//! [SceneStateMachine_destroyArray_array]

end

local function SceneStateMachine_create_()
--//! [SceneStateMachine_create_]
-- @TODO:Test: NJLI.SceneStateMachine.create()
--//! [SceneStateMachine_create_]

end

local function SceneStateMachine_create_builder()
--//! [SceneStateMachine_create_builder]
-- @TODO:Test: NJLI.SceneStateMachine.create(builder)
--//! [SceneStateMachine_create_builder]

end

local function SceneStateMachine_clone_object()
--//! [SceneStateMachine_clone_object]
-- @TODO:Test: NJLI.SceneStateMachine.clone(object)
--//! [SceneStateMachine_clone_object]

end

local function SceneStateMachine_copy_object()
--//! [SceneStateMachine_copy_object]
-- @TODO:Test: NJLI.SceneStateMachine.copy(object)
--//! [SceneStateMachine_copy_object]

end

local function SceneStateMachine_destroy_object()
--//! [SceneStateMachine_destroy_object]
-- @TODO:Test: NJLI.SceneStateMachine.destroy(object)
--//! [SceneStateMachine_destroy_object]

end

local function SceneStateMachine_load_object_L_stack_index()
--//! [SceneStateMachine_load_object_L_stack_index]
-- @TODO:Test: NJLI.SceneStateMachine.load(object, L, stack_index)
--//! [SceneStateMachine_load_object_L_stack_index]

end

local function SceneStateMachine_type_()
--//! [SceneStateMachine_type_]
-- @TODO:Test: NJLI.SceneStateMachine.type()
--//! [SceneStateMachine_type_]

end


function Test:testAll()
	SceneStateMachine_calculateSerializeBufferSize_()
	SceneStateMachine_serialize_btSerializer()
	SceneStateMachine_getClassName_()
	SceneStateMachine_getType_()
	SceneStateMachine_createArray_size()
	SceneStateMachine_destroyArray_array()
	SceneStateMachine_create_()
	SceneStateMachine_create_builder()
	SceneStateMachine_clone_object()
	SceneStateMachine_copy_object()
	SceneStateMachine_destroy_object()
	SceneStateMachine_load_object_L_stack_index()
	SceneStateMachine_type_()
end

return Test