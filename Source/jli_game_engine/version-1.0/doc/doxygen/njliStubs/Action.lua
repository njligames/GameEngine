
--Test the functions for Action
local Test = {}

local function Action_BT_DECLARE_ALIGNED_ALLOCATOR_()
--//! [Action_BT_DECLARE_ALIGNED_ALLOCATOR_]
-- @TODO: Test: Action:BT_DECLARE_ALIGNED_ALLOCATOR()
--//! [Action_BT_DECLARE_ALIGNED_ALLOCATOR_]

end

local function Action_calculateSerializeBufferSize_()
--//! [Action_calculateSerializeBufferSize_]
-- @TODO: Test: Action:calculateSerializeBufferSize()
--//! [Action_calculateSerializeBufferSize_]

end

local function Action_serialize_dataBuffer_btSerializer()
--//! [Action_serialize_dataBuffer_btSerializer]
-- @TODO: Test: Action:serialize(dataBuffer, btSerializer)
--//! [Action_serialize_dataBuffer_btSerializer]

end

local function Action_getClassName_()
--//! [Action_getClassName_]
-- @TODO: Test: Action:getClassName()
--//! [Action_getClassName_]

end

local function Action_getType_()
--//! [Action_getType_]
-- @TODO: Test: Action:getType()
--//! [Action_getType_]

end

local function Action_setRepeat_count()
--//! [Action_setRepeat_count]
-- @TODO: Test: Action:setRepeat(count)
--//! [Action_setRepeat_count]

end

local function Action_setRepeatForever_()
--//! [Action_setRepeatForever_]
-- @TODO: Test: Action:setRepeatForever()
--//! [Action_setRepeatForever_]

end

local function Action_setSpeedFactor_factor()
--//! [Action_setSpeedFactor_factor]
-- @TODO: Test: Action:setSpeedFactor(factor)
--//! [Action_setSpeedFactor_factor]

end

local function Action_getSpeedFactor_()
--//! [Action_getSpeedFactor_]
-- @TODO: Test: Action:getSpeedFactor()
--//! [Action_getSpeedFactor_]

end

local function Action_setDuration_duration()
--//! [Action_setDuration_duration]
-- @TODO: Test: Action:setDuration(duration)
--//! [Action_setDuration_duration]

end

local function Action_getDuration_()
--//! [Action_getDuration_]
-- @TODO: Test: Action:getDuration()
--//! [Action_getDuration_]

end

local function Action_setTimingMode_mode()
--//! [Action_setTimingMode_mode]
-- @TODO: Test: Action:setTimingMode(mode)
--//! [Action_setTimingMode_mode]

end

local function Action_getTimingMode_()
--//! [Action_getTimingMode_]
-- @TODO: Test: Action:getTimingMode()
--//! [Action_getTimingMode_]

end

local function Action_getTimeLeft_()
--//! [Action_getTimeLeft_]
-- @TODO: Test: Action:getTimeLeft()
--//! [Action_getTimeLeft_]

end

local function Action_isRepeatingForever_()
--//! [Action_isRepeatingForever_]
-- @TODO: Test: Action:isRepeatingForever()
--//! [Action_isRepeatingForever_]

end

local function Action_getRepeatCount_()
--//! [Action_getRepeatCount_]
-- @TODO: Test: Action:getRepeatCount()
--//! [Action_getRepeatCount_]

end

local function Action_getParent_()
--//! [Action_getParent_]
-- @TODO: Test: Action:getParent()
--//! [Action_getParent_]

end

local function Action_getParent_()
--//! [Action_getParent_]
-- @TODO: Test: Action:getParent()
--//! [Action_getParent_]

end

local function Action_createArray_size()
--//! [Action_createArray_size]
-- @TODO:Test: NJLI.Action.createArray(size)
--//! [Action_createArray_size]

end

local function Action_destroyArray_array()
--//! [Action_destroyArray_array]
-- @TODO:Test: NJLI.Action.destroyArray(array)
--//! [Action_destroyArray_array]

end

local function Action_create_()
--//! [Action_create_]
-- @TODO:Test: NJLI.Action.create()
--//! [Action_create_]

end

local function Action_create_builder()
--//! [Action_create_builder]
-- @TODO:Test: NJLI.Action.create(builder)
--//! [Action_create_builder]

end

local function Action_clone_object()
--//! [Action_clone_object]
-- @TODO:Test: NJLI.Action.clone(object)
--//! [Action_clone_object]

end

local function Action_copy_object()
--//! [Action_copy_object]
-- @TODO:Test: NJLI.Action.copy(object)
--//! [Action_copy_object]

end

local function Action_destroy_object()
--//! [Action_destroy_object]
-- @TODO:Test: NJLI.Action.destroy(object)
--//! [Action_destroy_object]

end

local function Action_load_object_L_stack_index()
--//! [Action_load_object_L_stack_index]
-- @TODO:Test: NJLI.Action.load(object, L, stack_index)
--//! [Action_load_object_L_stack_index]

end

local function Action_type_()
--//! [Action_type_]
-- @TODO:Test: NJLI.Action.type()
--//! [Action_type_]

end

local function Action_createGroup_actions_size()
--//! [Action_createGroup_actions_size]
-- @TODO:Test: NJLI.Action.createGroup(actions, size)
--//! [Action_createGroup_actions_size]

end

local function Action_createSequence_actions_size()
--//! [Action_createSequence_actions_size]
-- @TODO:Test: NJLI.Action.createSequence(actions, size)
--//! [Action_createSequence_actions_size]

end


function Test:testAll()
	Action_BT_DECLARE_ALIGNED_ALLOCATOR_()
	Action_calculateSerializeBufferSize_()
	Action_serialize_dataBuffer_btSerializer()
	Action_getClassName_()
	Action_getType_()
	Action_setRepeat_count()
	Action_setRepeatForever_()
	Action_setSpeedFactor_factor()
	Action_getSpeedFactor_()
	Action_setDuration_duration()
	Action_getDuration_()
	Action_setTimingMode_mode()
	Action_getTimingMode_()
	Action_getTimeLeft_()
	Action_isRepeatingForever_()
	Action_getRepeatCount_()
	Action_getParent_()
	Action_getParent_()
	Action_createArray_size()
	Action_destroyArray_array()
	Action_create_()
	Action_create_builder()
	Action_clone_object()
	Action_copy_object()
	Action_destroy_object()
	Action_load_object_L_stack_index()
	Action_type_()
	Action_createGroup_actions_size()
	Action_createSequence_actions_size()
end

return Test