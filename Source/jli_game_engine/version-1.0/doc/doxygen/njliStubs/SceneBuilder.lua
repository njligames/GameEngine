
--Test the functions for SceneBuilder
local Test = {}

local function SceneBuilder_calculateSerializeBufferSize_()
--//! [SceneBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: SceneBuilder:calculateSerializeBufferSize()
--//! [SceneBuilder_calculateSerializeBufferSize_]

end

local function SceneBuilder_serialize_btSerializer()
--//! [SceneBuilder_serialize_btSerializer]
-- @TODO: Test: SceneBuilder:serialize(btSerializer)
--//! [SceneBuilder_serialize_btSerializer]

end

local function SceneBuilder_getObjectType_()
--//! [SceneBuilder_getObjectType_]
-- @TODO: Test: SceneBuilder:getObjectType()
--//! [SceneBuilder_getObjectType_]

end

local function SceneBuilder_getClassName_()
--//! [SceneBuilder_getClassName_]
-- @TODO: Test: SceneBuilder:getClassName()
--//! [SceneBuilder_getClassName_]

end

local function SceneBuilder_getType_()
--//! [SceneBuilder_getType_]
-- @TODO: Test: SceneBuilder:getType()
--//! [SceneBuilder_getType_]

end

local function SceneBuilder_createArray_size()
--//! [SceneBuilder_createArray_size]
-- @TODO:Test: NJLI.SceneBuilder.createArray(size)
--//! [SceneBuilder_createArray_size]

end

local function SceneBuilder_destroyArray_array()
--//! [SceneBuilder_destroyArray_array]
-- @TODO:Test: NJLI.SceneBuilder.destroyArray(array)
--//! [SceneBuilder_destroyArray_array]

end

local function SceneBuilder_create_()
--//! [SceneBuilder_create_]
-- @TODO:Test: NJLI.SceneBuilder.create()
--//! [SceneBuilder_create_]

end

local function SceneBuilder_clone_object()
--//! [SceneBuilder_clone_object]
-- @TODO:Test: NJLI.SceneBuilder.clone(object)
--//! [SceneBuilder_clone_object]

end

local function SceneBuilder_destroy_object()
--//! [SceneBuilder_destroy_object]
-- @TODO:Test: NJLI.SceneBuilder.destroy(object)
--//! [SceneBuilder_destroy_object]

end

local function SceneBuilder_load_object_L_stack_index()
--//! [SceneBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.SceneBuilder.load(object, L, stack_index)
--//! [SceneBuilder_load_object_L_stack_index]

end

local function SceneBuilder_type_()
--//! [SceneBuilder_type_]
-- @TODO:Test: NJLI.SceneBuilder.type()
--//! [SceneBuilder_type_]

end


function Test:testAll()
	SceneBuilder_calculateSerializeBufferSize_()
	SceneBuilder_serialize_btSerializer()
	SceneBuilder_getObjectType_()
	SceneBuilder_getClassName_()
	SceneBuilder_getType_()
	SceneBuilder_createArray_size()
	SceneBuilder_destroyArray_array()
	SceneBuilder_create_()
	SceneBuilder_clone_object()
	SceneBuilder_destroy_object()
	SceneBuilder_load_object_L_stack_index()
	SceneBuilder_type_()
end

return Test