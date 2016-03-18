
--Test the functions for NodeBuilder
local Test = {}

local function NodeBuilder_calculateSerializeBufferSize_()
--//! [NodeBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: NodeBuilder:calculateSerializeBufferSize()
--//! [NodeBuilder_calculateSerializeBufferSize_]

end

local function NodeBuilder_serialize_dataBuffer_btSerializer()
--//! [NodeBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: NodeBuilder:serialize(dataBuffer, btSerializer)
--//! [NodeBuilder_serialize_dataBuffer_btSerializer]

end

local function NodeBuilder_getObjectType_()
--//! [NodeBuilder_getObjectType_]
-- @TODO: Test: NodeBuilder:getObjectType()
--//! [NodeBuilder_getObjectType_]

end

local function NodeBuilder_getClassName_()
--//! [NodeBuilder_getClassName_]
-- @TODO: Test: NodeBuilder:getClassName()
--//! [NodeBuilder_getClassName_]

end

local function NodeBuilder_getType_()
--//! [NodeBuilder_getType_]
-- @TODO: Test: NodeBuilder:getType()
--//! [NodeBuilder_getType_]

end

local function NodeBuilder_createArray_size()
--//! [NodeBuilder_createArray_size]
-- @TODO:Test: NJLI.NodeBuilder.createArray(size)
--//! [NodeBuilder_createArray_size]

end

local function NodeBuilder_destroyArray_array()
--//! [NodeBuilder_destroyArray_array]
-- @TODO:Test: NJLI.NodeBuilder.destroyArray(array)
--//! [NodeBuilder_destroyArray_array]

end

local function NodeBuilder_create_()
--//! [NodeBuilder_create_]
-- @TODO:Test: NJLI.NodeBuilder.create()
--//! [NodeBuilder_create_]

end

local function NodeBuilder_clone_object()
--//! [NodeBuilder_clone_object]
-- @TODO:Test: NJLI.NodeBuilder.clone(object)
--//! [NodeBuilder_clone_object]

end

local function NodeBuilder_destroy_object()
--//! [NodeBuilder_destroy_object]
-- @TODO:Test: NJLI.NodeBuilder.destroy(object)
--//! [NodeBuilder_destroy_object]

end

local function NodeBuilder_load_object_L_stack_index()
--//! [NodeBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.NodeBuilder.load(object, L, stack_index)
--//! [NodeBuilder_load_object_L_stack_index]

end

local function NodeBuilder_type_()
--//! [NodeBuilder_type_]
-- @TODO:Test: NJLI.NodeBuilder.type()
--//! [NodeBuilder_type_]

end


function Test:testAll()
	NodeBuilder_calculateSerializeBufferSize_()
	NodeBuilder_serialize_dataBuffer_btSerializer()
	NodeBuilder_getObjectType_()
	NodeBuilder_getClassName_()
	NodeBuilder_getType_()
	NodeBuilder_createArray_size()
	NodeBuilder_destroyArray_array()
	NodeBuilder_create_()
	NodeBuilder_clone_object()
	NodeBuilder_destroy_object()
	NodeBuilder_load_object_L_stack_index()
	NodeBuilder_type_()
end

return Test