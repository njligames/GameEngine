
--Test the functions for SceneState
local Test = {}

local function SceneState_calculateSerializeBufferSize_()
--//! [SceneState_calculateSerializeBufferSize_]
-- @TODO: Test: SceneState:calculateSerializeBufferSize()
--//! [SceneState_calculateSerializeBufferSize_]

end

local function SceneState_serialize_btSerializer()
--//! [SceneState_serialize_btSerializer]
-- @TODO: Test: SceneState:serialize(btSerializer)
--//! [SceneState_serialize_btSerializer]

end

local function SceneState_getClassName_()
--//! [SceneState_getClassName_]
-- @TODO: Test: SceneState:getClassName()
--//! [SceneState_getClassName_]

end

local function SceneState_getType_()
--//! [SceneState_getType_]
-- @TODO: Test: SceneState:getType()
--//! [SceneState_getType_]

end

local function SceneState_enter_scene()
--//! [SceneState_enter_scene]
-- @TODO: Test: SceneState:enter(scene)
--//! [SceneState_enter_scene]

end

local function SceneState_update_scene_timestep()
--//! [SceneState_update_scene_timestep]
-- @TODO: Test: SceneState:update(scene, timestep)
--//! [SceneState_update_scene_timestep]

end

local function SceneState_exit_scene()
--//! [SceneState_exit_scene]
-- @TODO: Test: SceneState:exit(scene)
--//! [SceneState_exit_scene]

end

local function SceneState_onMessage_scene_telegram()
--//! [SceneState_onMessage_scene_telegram]
-- @TODO: Test: SceneState:onMessage(scene, telegram)
--//! [SceneState_onMessage_scene_telegram]

end

local function SceneState_createArray_size()
--//! [SceneState_createArray_size]
-- @TODO:Test: NJLI.SceneState.createArray(size)
--//! [SceneState_createArray_size]

end

local function SceneState_destroyArray_array()
--//! [SceneState_destroyArray_array]
-- @TODO:Test: NJLI.SceneState.destroyArray(array)
--//! [SceneState_destroyArray_array]

end

local function SceneState_create_()
--//! [SceneState_create_]
-- @TODO:Test: NJLI.SceneState.create()
--//! [SceneState_create_]

end

local function SceneState_create_builder()
--//! [SceneState_create_builder]
-- @TODO:Test: NJLI.SceneState.create(builder)
--//! [SceneState_create_builder]

end

local function SceneState_clone_object()
--//! [SceneState_clone_object]
-- @TODO:Test: NJLI.SceneState.clone(object)
--//! [SceneState_clone_object]

end

local function SceneState_copy_object()
--//! [SceneState_copy_object]
-- @TODO:Test: NJLI.SceneState.copy(object)
--//! [SceneState_copy_object]

end

local function SceneState_destroy_object()
--//! [SceneState_destroy_object]
-- @TODO:Test: NJLI.SceneState.destroy(object)
--//! [SceneState_destroy_object]

end

local function SceneState_load_object_L_stack_index()
--//! [SceneState_load_object_L_stack_index]
-- @TODO:Test: NJLI.SceneState.load(object, L, stack_index)
--//! [SceneState_load_object_L_stack_index]

end

local function SceneState_type_()
--//! [SceneState_type_]
-- @TODO:Test: NJLI.SceneState.type()
--//! [SceneState_type_]

end


function Test:testAll()
	SceneState_calculateSerializeBufferSize_()
	SceneState_serialize_btSerializer()
	SceneState_getClassName_()
	SceneState_getType_()
	SceneState_enter_scene()
	SceneState_update_scene_timestep()
	SceneState_exit_scene()
	SceneState_onMessage_scene_telegram()
	SceneState_createArray_size()
	SceneState_destroyArray_array()
	SceneState_create_()
	SceneState_create_builder()
	SceneState_clone_object()
	SceneState_copy_object()
	SceneState_destroy_object()
	SceneState_load_object_L_stack_index()
	SceneState_type_()
end

return Test