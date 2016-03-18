
--Test the functions for NodeStateBuilder
local Test = {}

local function NodeStateBuilder_calculateSerializeBufferSize_()
--//! [NodeStateBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: NodeStateBuilder:calculateSerializeBufferSize()
--//! [NodeStateBuilder_calculateSerializeBufferSize_]

end

local function NodeStateBuilder_serialize_dataBuffer_btSerializer()
--//! [NodeStateBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: NodeStateBuilder:serialize(dataBuffer, btSerializer)
--//! [NodeStateBuilder_serialize_dataBuffer_btSerializer]

end

local function NodeStateBuilder_getObjectType_()
--//! [NodeStateBuilder_getObjectType_]
-- @TODO: Test: NodeStateBuilder:getObjectType()
--//! [NodeStateBuilder_getObjectType_]

end

local function NodeStateBuilder_getClassName_()
--//! [NodeStateBuilder_getClassName_]
-- @TODO: Test: NodeStateBuilder:getClassName()
--//! [NodeStateBuilder_getClassName_]

end

local function NodeStateBuilder_getType_()
--//! [NodeStateBuilder_getType_]
-- @TODO: Test: NodeStateBuilder:getType()
--//! [NodeStateBuilder_getType_]

end

local function NodeStateBuilder_createArray_size()
--//! [NodeStateBuilder_createArray_size]
-- @TODO:Test: NJLI.NodeStateBuilder.createArray(size)
--//! [NodeStateBuilder_createArray_size]

end

local function NodeStateBuilder_destroyArray_array()
--//! [NodeStateBuilder_destroyArray_array]
-- @TODO:Test: NJLI.NodeStateBuilder.destroyArray(array)
--//! [NodeStateBuilder_destroyArray_array]

end

local function NodeStateBuilder_create_()
--//! [NodeStateBuilder_create_]
-- @TODO:Test: NJLI.NodeStateBuilder.create()
--//! [NodeStateBuilder_create_]

end

local function NodeStateBuilder_clone_object()
--//! [NodeStateBuilder_clone_object]
-- @TODO:Test: NJLI.NodeStateBuilder.clone(object)
--//! [NodeStateBuilder_clone_object]

end

local function NodeStateBuilder_destroy_object()
--//! [NodeStateBuilder_destroy_object]
-- @TODO:Test: NJLI.NodeStateBuilder.destroy(object)
--//! [NodeStateBuilder_destroy_object]

end

local function NodeStateBuilder_load_object_L_stack_index()
--//! [NodeStateBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.NodeStateBuilder.load(object, L, stack_index)
--//! [NodeStateBuilder_load_object_L_stack_index]

end

local function NodeStateBuilder_type_()
--//! [NodeStateBuilder_type_]
-- @TODO:Test: NJLI.NodeStateBuilder.type()
--//! [NodeStateBuilder_type_]

end


function Test:testAll()
	NodeStateBuilder_calculateSerializeBufferSize_()
	NodeStateBuilder_serialize_dataBuffer_btSerializer()
	NodeStateBuilder_getObjectType_()
	NodeStateBuilder_getClassName_()
	NodeStateBuilder_getType_()
	NodeStateBuilder_createArray_size()
	NodeStateBuilder_destroyArray_array()
	NodeStateBuilder_create_()
	NodeStateBuilder_clone_object()
	NodeStateBuilder_destroy_object()
	NodeStateBuilder_load_object_L_stack_index()
	NodeStateBuilder_type_()
end

return Test