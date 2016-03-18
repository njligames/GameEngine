
--Test the functions for NodeStateMachineBuilder
local Test = {}

local function NodeStateMachineBuilder_calculateSerializeBufferSize_()
--//! [NodeStateMachineBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: NodeStateMachineBuilder:calculateSerializeBufferSize()
--//! [NodeStateMachineBuilder_calculateSerializeBufferSize_]

end

local function NodeStateMachineBuilder_serialize_dataBuffer_btSerializer()
--//! [NodeStateMachineBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: NodeStateMachineBuilder:serialize(dataBuffer, btSerializer)
--//! [NodeStateMachineBuilder_serialize_dataBuffer_btSerializer]

end

local function NodeStateMachineBuilder_getObjectType_()
--//! [NodeStateMachineBuilder_getObjectType_]
-- @TODO: Test: NodeStateMachineBuilder:getObjectType()
--//! [NodeStateMachineBuilder_getObjectType_]

end

local function NodeStateMachineBuilder_getClassName_()
--//! [NodeStateMachineBuilder_getClassName_]
-- @TODO: Test: NodeStateMachineBuilder:getClassName()
--//! [NodeStateMachineBuilder_getClassName_]

end

local function NodeStateMachineBuilder_getType_()
--//! [NodeStateMachineBuilder_getType_]
-- @TODO: Test: NodeStateMachineBuilder:getType()
--//! [NodeStateMachineBuilder_getType_]

end

local function NodeStateMachineBuilder_createArray_size()
--//! [NodeStateMachineBuilder_createArray_size]
-- @TODO:Test: NJLI.NodeStateMachineBuilder.createArray(size)
--//! [NodeStateMachineBuilder_createArray_size]

end

local function NodeStateMachineBuilder_destroyArray_array()
--//! [NodeStateMachineBuilder_destroyArray_array]
-- @TODO:Test: NJLI.NodeStateMachineBuilder.destroyArray(array)
--//! [NodeStateMachineBuilder_destroyArray_array]

end

local function NodeStateMachineBuilder_create_()
--//! [NodeStateMachineBuilder_create_]
-- @TODO:Test: NJLI.NodeStateMachineBuilder.create()
--//! [NodeStateMachineBuilder_create_]

end

local function NodeStateMachineBuilder_clone_object()
--//! [NodeStateMachineBuilder_clone_object]
-- @TODO:Test: NJLI.NodeStateMachineBuilder.clone(object)
--//! [NodeStateMachineBuilder_clone_object]

end

local function NodeStateMachineBuilder_destroy_object()
--//! [NodeStateMachineBuilder_destroy_object]
-- @TODO:Test: NJLI.NodeStateMachineBuilder.destroy(object)
--//! [NodeStateMachineBuilder_destroy_object]

end

local function NodeStateMachineBuilder_load_object_L_stack_index()
--//! [NodeStateMachineBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.NodeStateMachineBuilder.load(object, L, stack_index)
--//! [NodeStateMachineBuilder_load_object_L_stack_index]

end

local function NodeStateMachineBuilder_type_()
--//! [NodeStateMachineBuilder_type_]
-- @TODO:Test: NJLI.NodeStateMachineBuilder.type()
--//! [NodeStateMachineBuilder_type_]

end


function Test:testAll()
	NodeStateMachineBuilder_calculateSerializeBufferSize_()
	NodeStateMachineBuilder_serialize_dataBuffer_btSerializer()
	NodeStateMachineBuilder_getObjectType_()
	NodeStateMachineBuilder_getClassName_()
	NodeStateMachineBuilder_getType_()
	NodeStateMachineBuilder_createArray_size()
	NodeStateMachineBuilder_destroyArray_array()
	NodeStateMachineBuilder_create_()
	NodeStateMachineBuilder_clone_object()
	NodeStateMachineBuilder_destroy_object()
	NodeStateMachineBuilder_load_object_L_stack_index()
	NodeStateMachineBuilder_type_()
end

return Test