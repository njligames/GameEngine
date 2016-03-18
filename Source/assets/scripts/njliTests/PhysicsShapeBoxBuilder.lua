
--Test the functions for PhysicsShapeBoxBuilder
local Test = {}

local function PhysicsShapeBoxBuilder_calculateSerializeBufferSize_()
--//! [PhysicsShapeBoxBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsShapeBoxBuilder:calculateSerializeBufferSize()
--//! [PhysicsShapeBoxBuilder_calculateSerializeBufferSize_]

end

local function PhysicsShapeBoxBuilder_serialize_btSerializer()
--//! [PhysicsShapeBoxBuilder_serialize_btSerializer]
-- @TODO: Test: PhysicsShapeBoxBuilder:serialize(btSerializer)
--//! [PhysicsShapeBoxBuilder_serialize_btSerializer]

end

local function PhysicsShapeBoxBuilder_getObjectType_()
--//! [PhysicsShapeBoxBuilder_getObjectType_]
-- @TODO: Test: PhysicsShapeBoxBuilder:getObjectType()
--//! [PhysicsShapeBoxBuilder_getObjectType_]

end

local function PhysicsShapeBoxBuilder_getClassName_()
--//! [PhysicsShapeBoxBuilder_getClassName_]
-- @TODO: Test: PhysicsShapeBoxBuilder:getClassName()
--//! [PhysicsShapeBoxBuilder_getClassName_]

end

local function PhysicsShapeBoxBuilder_getType_()
--//! [PhysicsShapeBoxBuilder_getType_]
-- @TODO: Test: PhysicsShapeBoxBuilder:getType()
--//! [PhysicsShapeBoxBuilder_getType_]

end

local function PhysicsShapeBoxBuilder_createArray_size()
--//! [PhysicsShapeBoxBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsShapeBoxBuilder.createArray(size)
--//! [PhysicsShapeBoxBuilder_createArray_size]

end

local function PhysicsShapeBoxBuilder_destroyArray_array()
--//! [PhysicsShapeBoxBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsShapeBoxBuilder.destroyArray(array)
--//! [PhysicsShapeBoxBuilder_destroyArray_array]

end

local function PhysicsShapeBoxBuilder_create_()
--//! [PhysicsShapeBoxBuilder_create_]
-- @TODO:Test: NJLI.PhysicsShapeBoxBuilder.create()
--//! [PhysicsShapeBoxBuilder_create_]

end

local function PhysicsShapeBoxBuilder_clone_object()
--//! [PhysicsShapeBoxBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsShapeBoxBuilder.clone(object)
--//! [PhysicsShapeBoxBuilder_clone_object]

end

local function PhysicsShapeBoxBuilder_destroy_object()
--//! [PhysicsShapeBoxBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsShapeBoxBuilder.destroy(object)
--//! [PhysicsShapeBoxBuilder_destroy_object]

end

local function PhysicsShapeBoxBuilder_load_object_L_stack_index()
--//! [PhysicsShapeBoxBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsShapeBoxBuilder.load(object, L, stack_index)
--//! [PhysicsShapeBoxBuilder_load_object_L_stack_index]

end

local function PhysicsShapeBoxBuilder_type_()
--//! [PhysicsShapeBoxBuilder_type_]
-- @TODO:Test: NJLI.PhysicsShapeBoxBuilder.type()
--//! [PhysicsShapeBoxBuilder_type_]

end


function Test:testAll()
	PhysicsShapeBoxBuilder_calculateSerializeBufferSize_()
	PhysicsShapeBoxBuilder_serialize_btSerializer()
	PhysicsShapeBoxBuilder_getObjectType_()
	PhysicsShapeBoxBuilder_getClassName_()
	PhysicsShapeBoxBuilder_getType_()
	PhysicsShapeBoxBuilder_createArray_size()
	PhysicsShapeBoxBuilder_destroyArray_array()
	PhysicsShapeBoxBuilder_create_()
	PhysicsShapeBoxBuilder_clone_object()
	PhysicsShapeBoxBuilder_destroy_object()
	PhysicsShapeBoxBuilder_load_object_L_stack_index()
	PhysicsShapeBoxBuilder_type_()
end

return Test