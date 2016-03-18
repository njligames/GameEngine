
--Test the functions for PhysicsShapeConeBuilder
local Test = {}

local function PhysicsShapeConeBuilder_calculateSerializeBufferSize_()
--//! [PhysicsShapeConeBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsShapeConeBuilder:calculateSerializeBufferSize()
--//! [PhysicsShapeConeBuilder_calculateSerializeBufferSize_]

end

local function PhysicsShapeConeBuilder_serialize_btSerializer()
--//! [PhysicsShapeConeBuilder_serialize_btSerializer]
-- @TODO: Test: PhysicsShapeConeBuilder:serialize(btSerializer)
--//! [PhysicsShapeConeBuilder_serialize_btSerializer]

end

local function PhysicsShapeConeBuilder_getObjectType_()
--//! [PhysicsShapeConeBuilder_getObjectType_]
-- @TODO: Test: PhysicsShapeConeBuilder:getObjectType()
--//! [PhysicsShapeConeBuilder_getObjectType_]

end

local function PhysicsShapeConeBuilder_getClassName_()
--//! [PhysicsShapeConeBuilder_getClassName_]
-- @TODO: Test: PhysicsShapeConeBuilder:getClassName()
--//! [PhysicsShapeConeBuilder_getClassName_]

end

local function PhysicsShapeConeBuilder_getType_()
--//! [PhysicsShapeConeBuilder_getType_]
-- @TODO: Test: PhysicsShapeConeBuilder:getType()
--//! [PhysicsShapeConeBuilder_getType_]

end

local function PhysicsShapeConeBuilder_createArray_size()
--//! [PhysicsShapeConeBuilder_createArray_size]
-- @TODO:Test: NJLI.PhysicsShapeConeBuilder.createArray(size)
--//! [PhysicsShapeConeBuilder_createArray_size]

end

local function PhysicsShapeConeBuilder_destroyArray_array()
--//! [PhysicsShapeConeBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsShapeConeBuilder.destroyArray(array)
--//! [PhysicsShapeConeBuilder_destroyArray_array]

end

local function PhysicsShapeConeBuilder_create_()
--//! [PhysicsShapeConeBuilder_create_]
-- @TODO:Test: NJLI.PhysicsShapeConeBuilder.create()
--//! [PhysicsShapeConeBuilder_create_]

end

local function PhysicsShapeConeBuilder_clone_object()
--//! [PhysicsShapeConeBuilder_clone_object]
-- @TODO:Test: NJLI.PhysicsShapeConeBuilder.clone(object)
--//! [PhysicsShapeConeBuilder_clone_object]

end

local function PhysicsShapeConeBuilder_destroy_object()
--//! [PhysicsShapeConeBuilder_destroy_object]
-- @TODO:Test: NJLI.PhysicsShapeConeBuilder.destroy(object)
--//! [PhysicsShapeConeBuilder_destroy_object]

end

local function PhysicsShapeConeBuilder_load_object_L_stack_index()
--//! [PhysicsShapeConeBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsShapeConeBuilder.load(object, L, stack_index)
--//! [PhysicsShapeConeBuilder_load_object_L_stack_index]

end

local function PhysicsShapeConeBuilder_type_()
--//! [PhysicsShapeConeBuilder_type_]
-- @TODO:Test: NJLI.PhysicsShapeConeBuilder.type()
--//! [PhysicsShapeConeBuilder_type_]

end


function Test:testAll()
	PhysicsShapeConeBuilder_calculateSerializeBufferSize_()
	PhysicsShapeConeBuilder_serialize_btSerializer()
	PhysicsShapeConeBuilder_getObjectType_()
	PhysicsShapeConeBuilder_getClassName_()
	PhysicsShapeConeBuilder_getType_()
	PhysicsShapeConeBuilder_createArray_size()
	PhysicsShapeConeBuilder_destroyArray_array()
	PhysicsShapeConeBuilder_create_()
	PhysicsShapeConeBuilder_clone_object()
	PhysicsShapeConeBuilder_destroy_object()
	PhysicsShapeConeBuilder_load_object_L_stack_index()
	PhysicsShapeConeBuilder_type_()
end

return Test