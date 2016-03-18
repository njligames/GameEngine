
--Test the functions for NodeStateMachine
local Test = {}

local function NodeStateMachine_calculateSerializeBufferSize_()
--//! [NodeStateMachine_calculateSerializeBufferSize_]
-- @TODO: Test: NodeStateMachine:calculateSerializeBufferSize()
--//! [NodeStateMachine_calculateSerializeBufferSize_]

end

local function NodeStateMachine_serialize_dataBuffer_btSerializer()
--//! [NodeStateMachine_serialize_dataBuffer_btSerializer]
-- @TODO: Test: NodeStateMachine:serialize(dataBuffer, btSerializer)
--//! [NodeStateMachine_serialize_dataBuffer_btSerializer]

end

local function NodeStateMachine_getClassName_()
--//! [NodeStateMachine_getClassName_]
-- @TODO: Test: NodeStateMachine:getClassName()
--//! [NodeStateMachine_getClassName_]

end

local function NodeStateMachine_getType_()
--//! [NodeStateMachine_getType_]
-- @TODO: Test: NodeStateMachine:getType()
--//! [NodeStateMachine_getType_]

end

local function NodeStateMachine_createArray_size()
--//! [NodeStateMachine_createArray_size]
-- @TODO:Test: NJLI.NodeStateMachine.createArray(size)
--//! [NodeStateMachine_createArray_size]

end

local function NodeStateMachine_destroyArray_array()
--//! [NodeStateMachine_destroyArray_array]
-- @TODO:Test: NJLI.NodeStateMachine.destroyArray(array)
--//! [NodeStateMachine_destroyArray_array]

end

local function NodeStateMachine_create_()
--//! [NodeStateMachine_create_]
-- @TODO:Test: NJLI.NodeStateMachine.create()
--//! [NodeStateMachine_create_]

end

local function NodeStateMachine_create_builder()
--//! [NodeStateMachine_create_builder]
-- @TODO:Test: NJLI.NodeStateMachine.create(builder)
--//! [NodeStateMachine_create_builder]

end

local function NodeStateMachine_clone_object()
--//! [NodeStateMachine_clone_object]
-- @TODO:Test: NJLI.NodeStateMachine.clone(object)
--//! [NodeStateMachine_clone_object]

end

local function NodeStateMachine_copy_object()
--//! [NodeStateMachine_copy_object]
-- @TODO:Test: NJLI.NodeStateMachine.copy(object)
--//! [NodeStateMachine_copy_object]

end

local function NodeStateMachine_destroy_object()
--//! [NodeStateMachine_destroy_object]
-- @TODO:Test: NJLI.NodeStateMachine.destroy(object)
--//! [NodeStateMachine_destroy_object]

end

local function NodeStateMachine_load_object_L_stack_index()
--//! [NodeStateMachine_load_object_L_stack_index]
-- @TODO:Test: NJLI.NodeStateMachine.load(object, L, stack_index)
--//! [NodeStateMachine_load_object_L_stack_index]

end

local function NodeStateMachine_type_()
--//! [NodeStateMachine_type_]
-- @TODO:Test: NJLI.NodeStateMachine.type()
--//! [NodeStateMachine_type_]

end


function Test:testAll()
	NodeStateMachine_calculateSerializeBufferSize_()
	NodeStateMachine_serialize_dataBuffer_btSerializer()
	NodeStateMachine_getClassName_()
	NodeStateMachine_getType_()
	NodeStateMachine_createArray_size()
	NodeStateMachine_destroyArray_array()
	NodeStateMachine_create_()
	NodeStateMachine_create_builder()
	NodeStateMachine_clone_object()
	NodeStateMachine_copy_object()
	NodeStateMachine_destroy_object()
	NodeStateMachine_load_object_L_stack_index()
	NodeStateMachine_type_()
end

return Test