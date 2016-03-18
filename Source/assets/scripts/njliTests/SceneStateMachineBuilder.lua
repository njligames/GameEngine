
--Test the functions for SceneStateMachineBuilder
local Test = {}

local function SceneStateMachineBuilder_calculateSerializeBufferSize_()
--//! [SceneStateMachineBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: SceneStateMachineBuilder:calculateSerializeBufferSize()
--//! [SceneStateMachineBuilder_calculateSerializeBufferSize_]

end

local function SceneStateMachineBuilder_serialize_btSerializer()
--//! [SceneStateMachineBuilder_serialize_btSerializer]
-- @TODO: Test: SceneStateMachineBuilder:serialize(btSerializer)
--//! [SceneStateMachineBuilder_serialize_btSerializer]

end

local function SceneStateMachineBuilder_getObjectType_()
--//! [SceneStateMachineBuilder_getObjectType_]
-- @TODO: Test: SceneStateMachineBuilder:getObjectType()
--//! [SceneStateMachineBuilder_getObjectType_]

end

local function SceneStateMachineBuilder_getClassName_()
--//! [SceneStateMachineBuilder_getClassName_]
-- @TODO: Test: SceneStateMachineBuilder:getClassName()
--//! [SceneStateMachineBuilder_getClassName_]

end

local function SceneStateMachineBuilder_getType_()
--//! [SceneStateMachineBuilder_getType_]
-- @TODO: Test: SceneStateMachineBuilder:getType()
--//! [SceneStateMachineBuilder_getType_]

end

local function SceneStateMachineBuilder_createArray_size()
--//! [SceneStateMachineBuilder_createArray_size]
-- @TODO:Test: NJLI.SceneStateMachineBuilder.createArray(size)
--//! [SceneStateMachineBuilder_createArray_size]

end

local function SceneStateMachineBuilder_destroyArray_array()
--//! [SceneStateMachineBuilder_destroyArray_array]
-- @TODO:Test: NJLI.SceneStateMachineBuilder.destroyArray(array)
--//! [SceneStateMachineBuilder_destroyArray_array]

end

local function SceneStateMachineBuilder_create_()
--//! [SceneStateMachineBuilder_create_]
-- @TODO:Test: NJLI.SceneStateMachineBuilder.create()
--//! [SceneStateMachineBuilder_create_]

end

local function SceneStateMachineBuilder_clone_object()
--//! [SceneStateMachineBuilder_clone_object]
-- @TODO:Test: NJLI.SceneStateMachineBuilder.clone(object)
--//! [SceneStateMachineBuilder_clone_object]

end

local function SceneStateMachineBuilder_destroy_object()
--//! [SceneStateMachineBuilder_destroy_object]
-- @TODO:Test: NJLI.SceneStateMachineBuilder.destroy(object)
--//! [SceneStateMachineBuilder_destroy_object]

end

local function SceneStateMachineBuilder_load_object_L_stack_index()
--//! [SceneStateMachineBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.SceneStateMachineBuilder.load(object, L, stack_index)
--//! [SceneStateMachineBuilder_load_object_L_stack_index]

end

local function SceneStateMachineBuilder_type_()
--//! [SceneStateMachineBuilder_type_]
-- @TODO:Test: NJLI.SceneStateMachineBuilder.type()
--//! [SceneStateMachineBuilder_type_]

end


function Test:testAll()
	SceneStateMachineBuilder_calculateSerializeBufferSize_()
	SceneStateMachineBuilder_serialize_btSerializer()
	SceneStateMachineBuilder_getObjectType_()
	SceneStateMachineBuilder_getClassName_()
	SceneStateMachineBuilder_getType_()
	SceneStateMachineBuilder_createArray_size()
	SceneStateMachineBuilder_destroyArray_array()
	SceneStateMachineBuilder_create_()
	SceneStateMachineBuilder_clone_object()
	SceneStateMachineBuilder_destroy_object()
	SceneStateMachineBuilder_load_object_L_stack_index()
	SceneStateMachineBuilder_type_()
end

return Test