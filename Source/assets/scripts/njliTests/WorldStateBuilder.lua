
--Test the functions for WorldStateBuilder
local Test = {}

local function WorldStateBuilder_calculateSerializeBufferSize_()
--//! [WorldStateBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: WorldStateBuilder:calculateSerializeBufferSize()
--//! [WorldStateBuilder_calculateSerializeBufferSize_]

end

local function WorldStateBuilder_serialize_btSerializer()
--//! [WorldStateBuilder_serialize_btSerializer]
-- @TODO: Test: WorldStateBuilder:serialize(btSerializer)
--//! [WorldStateBuilder_serialize_btSerializer]

end

local function WorldStateBuilder_getObjectType_()
--//! [WorldStateBuilder_getObjectType_]
-- @TODO: Test: WorldStateBuilder:getObjectType()
--//! [WorldStateBuilder_getObjectType_]

end

local function WorldStateBuilder_getClassName_()
--//! [WorldStateBuilder_getClassName_]
-- @TODO: Test: WorldStateBuilder:getClassName()
--//! [WorldStateBuilder_getClassName_]

end

local function WorldStateBuilder_getType_()
--//! [WorldStateBuilder_getType_]
-- @TODO: Test: WorldStateBuilder:getType()
--//! [WorldStateBuilder_getType_]

end

local function WorldStateBuilder_createArray_size()
--//! [WorldStateBuilder_createArray_size]
-- @TODO:Test: NJLI.WorldStateBuilder.createArray(size)
--//! [WorldStateBuilder_createArray_size]

end

local function WorldStateBuilder_destroyArray_array()
--//! [WorldStateBuilder_destroyArray_array]
-- @TODO:Test: NJLI.WorldStateBuilder.destroyArray(array)
--//! [WorldStateBuilder_destroyArray_array]

end

local function WorldStateBuilder_create_()
--//! [WorldStateBuilder_create_]
-- @TODO:Test: NJLI.WorldStateBuilder.create()
--//! [WorldStateBuilder_create_]

end

local function WorldStateBuilder_clone_object()
--//! [WorldStateBuilder_clone_object]
-- @TODO:Test: NJLI.WorldStateBuilder.clone(object)
--//! [WorldStateBuilder_clone_object]

end

local function WorldStateBuilder_destroy_object()
--//! [WorldStateBuilder_destroy_object]
-- @TODO:Test: NJLI.WorldStateBuilder.destroy(object)
--//! [WorldStateBuilder_destroy_object]

end

local function WorldStateBuilder_load_object_L_stack_index()
--//! [WorldStateBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.WorldStateBuilder.load(object, L, stack_index)
--//! [WorldStateBuilder_load_object_L_stack_index]

end

local function WorldStateBuilder_type_()
--//! [WorldStateBuilder_type_]
-- @TODO:Test: NJLI.WorldStateBuilder.type()
--//! [WorldStateBuilder_type_]

end


function Test:testAll()
	WorldStateBuilder_calculateSerializeBufferSize_()
	WorldStateBuilder_serialize_btSerializer()
	WorldStateBuilder_getObjectType_()
	WorldStateBuilder_getClassName_()
	WorldStateBuilder_getType_()
	WorldStateBuilder_createArray_size()
	WorldStateBuilder_destroyArray_array()
	WorldStateBuilder_create_()
	WorldStateBuilder_clone_object()
	WorldStateBuilder_destroy_object()
	WorldStateBuilder_load_object_L_stack_index()
	WorldStateBuilder_type_()
end

return Test