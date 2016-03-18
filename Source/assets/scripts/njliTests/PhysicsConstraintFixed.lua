
--Test the functions for PhysicsConstraintFixed
local Test = {}

local function PhysicsConstraintFixed_calculateSerializeBufferSize_()
--//! [PhysicsConstraintFixed_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsConstraintFixed:calculateSerializeBufferSize()
--//! [PhysicsConstraintFixed_calculateSerializeBufferSize_]

end

local function PhysicsConstraintFixed_serialize_dataBuffer_btSerializer()
--//! [PhysicsConstraintFixed_serialize_dataBuffer_btSerializer]
-- @TODO: Test: PhysicsConstraintFixed:serialize(dataBuffer, btSerializer)
--//! [PhysicsConstraintFixed_serialize_dataBuffer_btSerializer]

end

local function PhysicsConstraintFixed_getClassName_()
--//! [PhysicsConstraintFixed_getClassName_]
-- @TODO: Test: PhysicsConstraintFixed:getClassName()
--//! [PhysicsConstraintFixed_getClassName_]

end

local function PhysicsConstraintFixed_getType_()
--//! [PhysicsConstraintFixed_getType_]
-- @TODO: Test: PhysicsConstraintFixed:getType()
--//! [PhysicsConstraintFixed_getType_]

end

local function PhysicsConstraintFixed_setNodes_nodeA_nodeB_frameInA_frameInB()
--//! [PhysicsConstraintFixed_setNodes_nodeA_nodeB_frameInA_frameInB]
-- @TODO: Test: PhysicsConstraintFixed:setNodes(nodeA, nodeB, frameInA, frameInB)
--//! [PhysicsConstraintFixed_setNodes_nodeA_nodeB_frameInA_frameInB]

end

local function PhysicsConstraintFixed_createArray_size()
--//! [PhysicsConstraintFixed_createArray_size]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.createArray(size)
--//! [PhysicsConstraintFixed_createArray_size]

end

local function PhysicsConstraintFixed_destroyArray_array()
--//! [PhysicsConstraintFixed_destroyArray_array]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.destroyArray(array)
--//! [PhysicsConstraintFixed_destroyArray_array]

end

local function PhysicsConstraintFixed_create_()
--//! [PhysicsConstraintFixed_create_]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.create()
--//! [PhysicsConstraintFixed_create_]

end

local function PhysicsConstraintFixed_create_builder()
--//! [PhysicsConstraintFixed_create_builder]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.create(builder)
--//! [PhysicsConstraintFixed_create_builder]

end

local function PhysicsConstraintFixed_clone_object()
--//! [PhysicsConstraintFixed_clone_object]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.clone(object)
--//! [PhysicsConstraintFixed_clone_object]

end

local function PhysicsConstraintFixed_copy_object()
--//! [PhysicsConstraintFixed_copy_object]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.copy(object)
--//! [PhysicsConstraintFixed_copy_object]

end

local function PhysicsConstraintFixed_destroy_object()
--//! [PhysicsConstraintFixed_destroy_object]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.destroy(object)
--//! [PhysicsConstraintFixed_destroy_object]

end

local function PhysicsConstraintFixed_load_object_L_stack_index()
--//! [PhysicsConstraintFixed_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.load(object, L, stack_index)
--//! [PhysicsConstraintFixed_load_object_L_stack_index]

end

local function PhysicsConstraintFixed_type_()
--//! [PhysicsConstraintFixed_type_]
-- @TODO:Test: NJLI.PhysicsConstraintFixed.type()
--//! [PhysicsConstraintFixed_type_]

end


function Test:testAll()
	PhysicsConstraintFixed_calculateSerializeBufferSize_()
	PhysicsConstraintFixed_serialize_dataBuffer_btSerializer()
	PhysicsConstraintFixed_getClassName_()
	PhysicsConstraintFixed_getType_()
	PhysicsConstraintFixed_setNodes_nodeA_nodeB_frameInA_frameInB()
	PhysicsConstraintFixed_createArray_size()
	PhysicsConstraintFixed_destroyArray_array()
	PhysicsConstraintFixed_create_()
	PhysicsConstraintFixed_create_builder()
	PhysicsConstraintFixed_clone_object()
	PhysicsConstraintFixed_copy_object()
	PhysicsConstraintFixed_destroy_object()
	PhysicsConstraintFixed_load_object_L_stack_index()
	PhysicsConstraintFixed_type_()
end

return Test