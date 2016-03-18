
--Test the functions for SceneStateBuilder
local Test = {}

local function SceneStateBuilder_calculateSerializeBufferSize_()
--//! [SceneStateBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: SceneStateBuilder:calculateSerializeBufferSize()
--//! [SceneStateBuilder_calculateSerializeBufferSize_]

end

local function SceneStateBuilder_serialize_btSerializer()
--//! [SceneStateBuilder_serialize_btSerializer]
-- @TODO: Test: SceneStateBuilder:serialize(btSerializer)
--//! [SceneStateBuilder_serialize_btSerializer]

end

local function SceneStateBuilder_getObjectType_()
--//! [SceneStateBuilder_getObjectType_]
-- @TODO: Test: SceneStateBuilder:getObjectType()
--//! [SceneStateBuilder_getObjectType_]

end

local function SceneStateBuilder_getClassName_()
--//! [SceneStateBuilder_getClassName_]
-- @TODO: Test: SceneStateBuilder:getClassName()
--//! [SceneStateBuilder_getClassName_]

end

local function SceneStateBuilder_getType_()
--//! [SceneStateBuilder_getType_]
-- @TODO: Test: SceneStateBuilder:getType()
--//! [SceneStateBuilder_getType_]

end

local function SceneStateBuilder_createArray_size()
--//! [SceneStateBuilder_createArray_size]
-- @TODO:Test: NJLI.SceneStateBuilder.createArray(size)
--//! [SceneStateBuilder_createArray_size]

end

local function SceneStateBuilder_destroyArray_array()
--//! [SceneStateBuilder_destroyArray_array]
-- @TODO:Test: NJLI.SceneStateBuilder.destroyArray(array)
--//! [SceneStateBuilder_destroyArray_array]

end

local function SceneStateBuilder_create_()
--//! [SceneStateBuilder_create_]
-- @TODO:Test: NJLI.SceneStateBuilder.create()
--//! [SceneStateBuilder_create_]

end

local function SceneStateBuilder_clone_object()
--//! [SceneStateBuilder_clone_object]
-- @TODO:Test: NJLI.SceneStateBuilder.clone(object)
--//! [SceneStateBuilder_clone_object]

end

local function SceneStateBuilder_destroy_object()
--//! [SceneStateBuilder_destroy_object]
-- @TODO:Test: NJLI.SceneStateBuilder.destroy(object)
--//! [SceneStateBuilder_destroy_object]

end

local function SceneStateBuilder_load_object_L_stack_index()
--//! [SceneStateBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.SceneStateBuilder.load(object, L, stack_index)
--//! [SceneStateBuilder_load_object_L_stack_index]

end

local function SceneStateBuilder_type_()
--//! [SceneStateBuilder_type_]
-- @TODO:Test: NJLI.SceneStateBuilder.type()
--//! [SceneStateBuilder_type_]

end


function Test:testAll()
	SceneStateBuilder_calculateSerializeBufferSize_()
	SceneStateBuilder_serialize_btSerializer()
	SceneStateBuilder_getObjectType_()
	SceneStateBuilder_getClassName_()
	SceneStateBuilder_getType_()
	SceneStateBuilder_createArray_size()
	SceneStateBuilder_destroyArray_array()
	SceneStateBuilder_create_()
	SceneStateBuilder_clone_object()
	SceneStateBuilder_destroy_object()
	SceneStateBuilder_load_object_L_stack_index()
	SceneStateBuilder_type_()
end

return Test