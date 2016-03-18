
--Test the functions for ThreadBuilder
local Test = {}

local function ThreadBuilder_calculateSerializeBufferSize_()
--//! [ThreadBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: ThreadBuilder:calculateSerializeBufferSize()
--//! [ThreadBuilder_calculateSerializeBufferSize_]

end

local function ThreadBuilder_serialize_btSerializer()
--//! [ThreadBuilder_serialize_btSerializer]
-- @TODO: Test: ThreadBuilder:serialize(btSerializer)
--//! [ThreadBuilder_serialize_btSerializer]

end

local function ThreadBuilder_getObjectType_()
--//! [ThreadBuilder_getObjectType_]
-- @TODO: Test: ThreadBuilder:getObjectType()
--//! [ThreadBuilder_getObjectType_]

end

local function ThreadBuilder_getClassName_()
--//! [ThreadBuilder_getClassName_]
-- @TODO: Test: ThreadBuilder:getClassName()
--//! [ThreadBuilder_getClassName_]

end

local function ThreadBuilder_getType_()
--//! [ThreadBuilder_getType_]
-- @TODO: Test: ThreadBuilder:getType()
--//! [ThreadBuilder_getType_]

end

local function ThreadBuilder_createArray_size()
--//! [ThreadBuilder_createArray_size]
-- @TODO:Test: NJLI.ThreadBuilder.createArray(size)
--//! [ThreadBuilder_createArray_size]

end

local function ThreadBuilder_destroyArray_array()
--//! [ThreadBuilder_destroyArray_array]
-- @TODO:Test: NJLI.ThreadBuilder.destroyArray(array)
--//! [ThreadBuilder_destroyArray_array]

end

local function ThreadBuilder_create_()
--//! [ThreadBuilder_create_]
-- @TODO:Test: NJLI.ThreadBuilder.create()
--//! [ThreadBuilder_create_]

end

local function ThreadBuilder_clone_object()
--//! [ThreadBuilder_clone_object]
-- @TODO:Test: NJLI.ThreadBuilder.clone(object)
--//! [ThreadBuilder_clone_object]

end

local function ThreadBuilder_destroy_object()
--//! [ThreadBuilder_destroy_object]
-- @TODO:Test: NJLI.ThreadBuilder.destroy(object)
--//! [ThreadBuilder_destroy_object]

end

local function ThreadBuilder_load_object_L_stack_index()
--//! [ThreadBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.ThreadBuilder.load(object, L, stack_index)
--//! [ThreadBuilder_load_object_L_stack_index]

end

local function ThreadBuilder_type_()
--//! [ThreadBuilder_type_]
-- @TODO:Test: NJLI.ThreadBuilder.type()
--//! [ThreadBuilder_type_]

end


function Test:testAll()
	ThreadBuilder_calculateSerializeBufferSize_()
	ThreadBuilder_serialize_btSerializer()
	ThreadBuilder_getObjectType_()
	ThreadBuilder_getClassName_()
	ThreadBuilder_getType_()
	ThreadBuilder_createArray_size()
	ThreadBuilder_destroyArray_array()
	ThreadBuilder_create_()
	ThreadBuilder_clone_object()
	ThreadBuilder_destroy_object()
	ThreadBuilder_load_object_L_stack_index()
	ThreadBuilder_type_()
end

return Test