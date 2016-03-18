
--Test the functions for NodeState
local Test = {}

local function NodeState_calculateSerializeBufferSize_()
--//! [NodeState_calculateSerializeBufferSize_]
-- @TODO: Test: NodeState:calculateSerializeBufferSize()
--//! [NodeState_calculateSerializeBufferSize_]

end

local function NodeState_serialize_dataBuffer_btSerializer()
--//! [NodeState_serialize_dataBuffer_btSerializer]
-- @TODO: Test: NodeState:serialize(dataBuffer, btSerializer)
--//! [NodeState_serialize_dataBuffer_btSerializer]

end

local function NodeState_getClassName_()
--//! [NodeState_getClassName_]
-- @TODO: Test: NodeState:getClassName()
--//! [NodeState_getClassName_]

end

local function NodeState_getType_()
--//! [NodeState_getType_]
-- @TODO: Test: NodeState:getType()
--//! [NodeState_getType_]

end

local function NodeState_enter_node()
--//! [NodeState_enter_node]
-- @TODO: Test: NodeState:enter(node)
--//! [NodeState_enter_node]

end

local function NodeState_update_node_timestep()
--//! [NodeState_update_node_timestep]
-- @TODO: Test: NodeState:update(node, timestep)
--//! [NodeState_update_node_timestep]

end

local function NodeState_exit_node()
--//! [NodeState_exit_node]
-- @TODO: Test: NodeState:exit(node)
--//! [NodeState_exit_node]

end

local function NodeState_onMessage_node_telegram()
--//! [NodeState_onMessage_node_telegram]
-- @TODO: Test: NodeState:onMessage(node, telegram)
--//! [NodeState_onMessage_node_telegram]

end

local function NodeState_createArray_size()
--//! [NodeState_createArray_size]
-- @TODO:Test: NJLI.NodeState.createArray(size)
--//! [NodeState_createArray_size]

end

local function NodeState_destroyArray_array()
--//! [NodeState_destroyArray_array]
-- @TODO:Test: NJLI.NodeState.destroyArray(array)
--//! [NodeState_destroyArray_array]

end

local function NodeState_create_()
--//! [NodeState_create_]
-- @TODO:Test: NJLI.NodeState.create()
--//! [NodeState_create_]

end

local function NodeState_create_builder()
--//! [NodeState_create_builder]
-- @TODO:Test: NJLI.NodeState.create(builder)
--//! [NodeState_create_builder]

end

local function NodeState_clone_object()
--//! [NodeState_clone_object]
-- @TODO:Test: NJLI.NodeState.clone(object)
--//! [NodeState_clone_object]

end

local function NodeState_copy_object()
--//! [NodeState_copy_object]
-- @TODO:Test: NJLI.NodeState.copy(object)
--//! [NodeState_copy_object]

end

local function NodeState_destroy_object()
--//! [NodeState_destroy_object]
-- @TODO:Test: NJLI.NodeState.destroy(object)
--//! [NodeState_destroy_object]

end

local function NodeState_load_object_L_stack_index()
--//! [NodeState_load_object_L_stack_index]
-- @TODO:Test: NJLI.NodeState.load(object, L, stack_index)
--//! [NodeState_load_object_L_stack_index]

end

local function NodeState_type_()
--//! [NodeState_type_]
-- @TODO:Test: NJLI.NodeState.type()
--//! [NodeState_type_]

end


function Test:testAll()
	NodeState_calculateSerializeBufferSize_()
	NodeState_serialize_dataBuffer_btSerializer()
	NodeState_getClassName_()
	NodeState_getType_()
	NodeState_enter_node()
	NodeState_update_node_timestep()
	NodeState_exit_node()
	NodeState_onMessage_node_telegram()
	NodeState_createArray_size()
	NodeState_destroyArray_array()
	NodeState_create_()
	NodeState_create_builder()
	NodeState_clone_object()
	NodeState_copy_object()
	NodeState_destroy_object()
	NodeState_load_object_L_stack_index()
	NodeState_type_()
end

return Test