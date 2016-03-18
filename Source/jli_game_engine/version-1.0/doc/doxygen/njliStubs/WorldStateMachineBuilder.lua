
--Test the functions for WorldStateMachineBuilder
local Test = {}

local function WorldStateMachineBuilder_calculateSerializeBufferSize_()
--//! [WorldStateMachineBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: WorldStateMachineBuilder:calculateSerializeBufferSize()
--//! [WorldStateMachineBuilder_calculateSerializeBufferSize_]

end

local function WorldStateMachineBuilder_serialize_btSerializer()
--//! [WorldStateMachineBuilder_serialize_btSerializer]
-- @TODO: Test: WorldStateMachineBuilder:serialize(btSerializer)
--//! [WorldStateMachineBuilder_serialize_btSerializer]

end

local function WorldStateMachineBuilder_getObjectType_()
--//! [WorldStateMachineBuilder_getObjectType_]
-- @TODO: Test: WorldStateMachineBuilder:getObjectType()
--//! [WorldStateMachineBuilder_getObjectType_]

end

local function WorldStateMachineBuilder_getClassName_()
--//! [WorldStateMachineBuilder_getClassName_]
-- @TODO: Test: WorldStateMachineBuilder:getClassName()
--//! [WorldStateMachineBuilder_getClassName_]

end

local function WorldStateMachineBuilder_getType_()
--//! [WorldStateMachineBuilder_getType_]
-- @TODO: Test: WorldStateMachineBuilder:getType()
--//! [WorldStateMachineBuilder_getType_]

end

local function WorldStateMachineBuilder_createArray_size()
--//! [WorldStateMachineBuilder_createArray_size]
-- @TODO:Test: NJLI.WorldStateMachineBuilder.createArray(size)
--//! [WorldStateMachineBuilder_createArray_size]

end

local function WorldStateMachineBuilder_destroyArray_array()
--//! [WorldStateMachineBuilder_destroyArray_array]
-- @TODO:Test: NJLI.WorldStateMachineBuilder.destroyArray(array)
--//! [WorldStateMachineBuilder_destroyArray_array]

end

local function WorldStateMachineBuilder_create_()
--//! [WorldStateMachineBuilder_create_]
-- @TODO:Test: NJLI.WorldStateMachineBuilder.create()
--//! [WorldStateMachineBuilder_create_]

end

local function WorldStateMachineBuilder_clone_object()
--//! [WorldStateMachineBuilder_clone_object]
-- @TODO:Test: NJLI.WorldStateMachineBuilder.clone(object)
--//! [WorldStateMachineBuilder_clone_object]

end

local function WorldStateMachineBuilder_destroy_object()
--//! [WorldStateMachineBuilder_destroy_object]
-- @TODO:Test: NJLI.WorldStateMachineBuilder.destroy(object)
--//! [WorldStateMachineBuilder_destroy_object]

end

local function WorldStateMachineBuilder_load_object_L_stack_index()
--//! [WorldStateMachineBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.WorldStateMachineBuilder.load(object, L, stack_index)
--//! [WorldStateMachineBuilder_load_object_L_stack_index]

end

local function WorldStateMachineBuilder_type_()
--//! [WorldStateMachineBuilder_type_]
-- @TODO:Test: NJLI.WorldStateMachineBuilder.type()
--//! [WorldStateMachineBuilder_type_]

end


function Test:testAll()
	WorldStateMachineBuilder_calculateSerializeBufferSize_()
	WorldStateMachineBuilder_serialize_btSerializer()
	WorldStateMachineBuilder_getObjectType_()
	WorldStateMachineBuilder_getClassName_()
	WorldStateMachineBuilder_getType_()
	WorldStateMachineBuilder_createArray_size()
	WorldStateMachineBuilder_destroyArray_array()
	WorldStateMachineBuilder_create_()
	WorldStateMachineBuilder_clone_object()
	WorldStateMachineBuilder_destroy_object()
	WorldStateMachineBuilder_load_object_L_stack_index()
	WorldStateMachineBuilder_type_()
end

return Test