
--Test the functions for WorldState
local Test = {}

local function WorldState_calculateSerializeBufferSize_()
--//! [WorldState_calculateSerializeBufferSize_]
-- @TODO: Test: WorldState:calculateSerializeBufferSize()
--//! [WorldState_calculateSerializeBufferSize_]

end

local function WorldState_serialize_btSerializer()
--//! [WorldState_serialize_btSerializer]
-- @TODO: Test: WorldState:serialize(btSerializer)
--//! [WorldState_serialize_btSerializer]

end

local function WorldState_getClassName_()
--//! [WorldState_getClassName_]
-- @TODO: Test: WorldState:getClassName()
--//! [WorldState_getClassName_]

end

local function WorldState_getType_()
--//! [WorldState_getType_]
-- @TODO: Test: WorldState:getType()
--//! [WorldState_getType_]

end

local function WorldState_enter_()
--//! [WorldState_enter_]
-- @TODO: Test: WorldState:enter()
--//! [WorldState_enter_]

end

local function WorldState_update_f32()
--//! [WorldState_update_f32]
-- @TODO: Test: WorldState:update(f32)
--//! [WorldState_update_f32]

end

local function WorldState_exit_()
--//! [WorldState_exit_]
-- @TODO: Test: WorldState:exit()
--//! [WorldState_exit_]

end

local function WorldState_onMessage_Telegram&()
--//! [WorldState_onMessage_Telegram&]
-- @TODO: Test: WorldState:onMessage(Telegram&)
--//! [WorldState_onMessage_Telegram&]

end

local function WorldState_touchDown_m_CurrentTouches()
--//! [WorldState_touchDown_m_CurrentTouches]
-- @TODO: Test: WorldState:touchDown(m_CurrentTouches)
--//! [WorldState_touchDown_m_CurrentTouches]

end

local function WorldState_touchUp_m_CurrentTouches()
--//! [WorldState_touchUp_m_CurrentTouches]
-- @TODO: Test: WorldState:touchUp(m_CurrentTouches)
--//! [WorldState_touchUp_m_CurrentTouches]

end

local function WorldState_touchMove_m_CurrentTouches()
--//! [WorldState_touchMove_m_CurrentTouches]
-- @TODO: Test: WorldState:touchMove(m_CurrentTouches)
--//! [WorldState_touchMove_m_CurrentTouches]

end

local function WorldState_touchCancelled_m_CurrentTouches()
--//! [WorldState_touchCancelled_m_CurrentTouches]
-- @TODO: Test: WorldState:touchCancelled(m_CurrentTouches)
--//! [WorldState_touchCancelled_m_CurrentTouches]

end

local function WorldState_createArray_size()
--//! [WorldState_createArray_size]
-- @TODO:Test: NJLI.WorldState.createArray(size)
--//! [WorldState_createArray_size]

end

local function WorldState_destroyArray_array()
--//! [WorldState_destroyArray_array]
-- @TODO:Test: NJLI.WorldState.destroyArray(array)
--//! [WorldState_destroyArray_array]

end

local function WorldState_create_()
--//! [WorldState_create_]
-- @TODO:Test: NJLI.WorldState.create()
--//! [WorldState_create_]

end

local function WorldState_create_builder()
--//! [WorldState_create_builder]
-- @TODO:Test: NJLI.WorldState.create(builder)
--//! [WorldState_create_builder]

end

local function WorldState_clone_object()
--//! [WorldState_clone_object]
-- @TODO:Test: NJLI.WorldState.clone(object)
--//! [WorldState_clone_object]

end

local function WorldState_copy_object()
--//! [WorldState_copy_object]
-- @TODO:Test: NJLI.WorldState.copy(object)
--//! [WorldState_copy_object]

end

local function WorldState_destroy_object()
--//! [WorldState_destroy_object]
-- @TODO:Test: NJLI.WorldState.destroy(object)
--//! [WorldState_destroy_object]

end

local function WorldState_load_object_L_stack_index()
--//! [WorldState_load_object_L_stack_index]
-- @TODO:Test: NJLI.WorldState.load(object, L, stack_index)
--//! [WorldState_load_object_L_stack_index]

end

local function WorldState_type_()
--//! [WorldState_type_]
-- @TODO:Test: NJLI.WorldState.type()
--//! [WorldState_type_]

end


function Test:testAll()
	WorldState_calculateSerializeBufferSize_()
	WorldState_serialize_btSerializer()
	WorldState_getClassName_()
	WorldState_getType_()
	WorldState_enter_()
	WorldState_update_f32()
	WorldState_exit_()
	WorldState_onMessage_Telegram&()
	WorldState_touchDown_m_CurrentTouches()
	WorldState_touchUp_m_CurrentTouches()
	WorldState_touchMove_m_CurrentTouches()
	WorldState_touchCancelled_m_CurrentTouches()
	WorldState_createArray_size()
	WorldState_destroyArray_array()
	WorldState_create_()
	WorldState_create_builder()
	WorldState_clone_object()
	WorldState_copy_object()
	WorldState_destroy_object()
	WorldState_load_object_L_stack_index()
	WorldState_type_()
end

return Test