
--Test the functions for ActionBuilder
local Test = {}

local function ActionBuilder_BT_DECLARE_ALIGNED_ALLOCATOR_()
--//! [ActionBuilder_BT_DECLARE_ALIGNED_ALLOCATOR_]
-- @TODO: Test: ActionBuilder:BT_DECLARE_ALIGNED_ALLOCATOR()
--//! [ActionBuilder_BT_DECLARE_ALIGNED_ALLOCATOR_]

end

local function ActionBuilder_operator=_param1()
--//! [ActionBuilder_operator=_param1]
-- @TODO: Test: ActionBuilder:operator=(param1)
--//! [ActionBuilder_operator=_param1]

end

local function ActionBuilder_calculateSerializeBufferSize_()
--//! [ActionBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: ActionBuilder:calculateSerializeBufferSize()
--//! [ActionBuilder_calculateSerializeBufferSize_]

end

local function ActionBuilder_serialize_dataBuffer_btSerializer()
--//! [ActionBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: ActionBuilder:serialize(dataBuffer, btSerializer)
--//! [ActionBuilder_serialize_dataBuffer_btSerializer]

end

local function ActionBuilder_getObjectType_()
--//! [ActionBuilder_getObjectType_]
-- @TODO: Test: ActionBuilder:getObjectType()
--//! [ActionBuilder_getObjectType_]

end

local function ActionBuilder_getClassName_()
--//! [ActionBuilder_getClassName_]
-- @TODO: Test: ActionBuilder:getClassName()
--//! [ActionBuilder_getClassName_]

end

local function ActionBuilder_getType_()
--//! [ActionBuilder_getType_]
-- @TODO: Test: ActionBuilder:getType()
--//! [ActionBuilder_getType_]

end

local function ActionBuilder_createArray_size()
--//! [ActionBuilder_createArray_size]
-- @TODO:Test: NJLI.ActionBuilder.createArray(size)
--//! [ActionBuilder_createArray_size]

end

local function ActionBuilder_destroyArray_array()
--//! [ActionBuilder_destroyArray_array]
-- @TODO:Test: NJLI.ActionBuilder.destroyArray(array)
--//! [ActionBuilder_destroyArray_array]

end

local function ActionBuilder_create_()
--//! [ActionBuilder_create_]
-- @TODO:Test: NJLI.ActionBuilder.create()
--//! [ActionBuilder_create_]

end

local function ActionBuilder_clone_object()
--//! [ActionBuilder_clone_object]
-- @TODO:Test: NJLI.ActionBuilder.clone(object)
--//! [ActionBuilder_clone_object]

end

local function ActionBuilder_destroy_object()
--//! [ActionBuilder_destroy_object]
-- @TODO:Test: NJLI.ActionBuilder.destroy(object)
--//! [ActionBuilder_destroy_object]

end

local function ActionBuilder_load_object_L_stack_index()
--//! [ActionBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.ActionBuilder.load(object, L, stack_index)
--//! [ActionBuilder_load_object_L_stack_index]

end

local function ActionBuilder_type_()
--//! [ActionBuilder_type_]
-- @TODO:Test: NJLI.ActionBuilder.type()
--//! [ActionBuilder_type_]

end


function Test:testAll()
	ActionBuilder_BT_DECLARE_ALIGNED_ALLOCATOR_()
	ActionBuilder_operator=_param1()
	ActionBuilder_calculateSerializeBufferSize_()
	ActionBuilder_serialize_dataBuffer_btSerializer()
	ActionBuilder_getObjectType_()
	ActionBuilder_getClassName_()
	ActionBuilder_getType_()
	ActionBuilder_createArray_size()
	ActionBuilder_destroyArray_array()
	ActionBuilder_create_()
	ActionBuilder_clone_object()
	ActionBuilder_destroy_object()
	ActionBuilder_load_object_L_stack_index()
	ActionBuilder_type_()
end

return Test