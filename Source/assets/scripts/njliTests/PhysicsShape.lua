
--Test the functions for PhysicsShape
local Test = {}

local function PhysicsShape_calculateSerializeBufferSize_()
--//! [PhysicsShape_calculateSerializeBufferSize_]
-- @TODO: Test: PhysicsShape:calculateSerializeBufferSize()
--//! [PhysicsShape_calculateSerializeBufferSize_]

end

local function PhysicsShape_serialize_btSerializer()
--//! [PhysicsShape_serialize_btSerializer]
-- @TODO: Test: PhysicsShape:serialize(btSerializer)
--//! [PhysicsShape_serialize_btSerializer]

end

local function PhysicsShape_getClassName_()
--//! [PhysicsShape_getClassName_]
-- @TODO: Test: PhysicsShape:getClassName()
--//! [PhysicsShape_getClassName_]

end

local function PhysicsShape_getType_()
--//! [PhysicsShape_getType_]
-- @TODO: Test: PhysicsShape:getType()
--//! [PhysicsShape_getType_]

end

local function PhysicsShape_createRigidBodyWithShape_mass_motionState_localInertia()
--//! [PhysicsShape_createRigidBodyWithShape_mass_motionState_localInertia]
-- @TODO: Test: PhysicsShape:createRigidBodyWithShape(mass, motionState, localInertia)
--//! [PhysicsShape_createRigidBodyWithShape_mass_motionState_localInertia]

end

local function PhysicsShape_calculateLocalInertia_mass()
--//! [PhysicsShape_calculateLocalInertia_mass]
-- @TODO: Test: PhysicsShape:calculateLocalInertia(mass)
--//! [PhysicsShape_calculateLocalInertia_mass]

end

local function PhysicsShape_getNumVertices_()
--//! [PhysicsShape_getNumVertices_]
-- @TODO: Test: PhysicsShape:getNumVertices()
--//! [PhysicsShape_getNumVertices_]

end

local function PhysicsShape_getNumEdges_()
--//! [PhysicsShape_getNumEdges_]
-- @TODO: Test: PhysicsShape:getNumEdges()
--//! [PhysicsShape_getNumEdges_]

end

local function PhysicsShape_getEdge_i_pa_pb()
--//! [PhysicsShape_getEdge_i_pa_pb]
-- @TODO: Test: PhysicsShape:getEdge(i, pa, pb)
--//! [PhysicsShape_getEdge_i_pa_pb]

end

local function PhysicsShape_getVertex_i_vtx()
--//! [PhysicsShape_getVertex_i_vtx]
-- @TODO: Test: PhysicsShape:getVertex(i, vtx)
--//! [PhysicsShape_getVertex_i_vtx]

end

local function PhysicsShape_getNumPlanes_()
--//! [PhysicsShape_getNumPlanes_]
-- @TODO: Test: PhysicsShape:getNumPlanes()
--//! [PhysicsShape_getNumPlanes_]

end

local function PhysicsShape_getPlane_planeNormal_planeSupport_i()
--//! [PhysicsShape_getPlane_planeNormal_planeSupport_i]
-- @TODO: Test: PhysicsShape:getPlane(planeNormal, planeSupport, i)
--//! [PhysicsShape_getPlane_planeNormal_planeSupport_i]

end

local function PhysicsShape_isInside_pt_tolerance()
--//! [PhysicsShape_isInside_pt_tolerance]
-- @TODO: Test: PhysicsShape:isInside(pt, tolerance)
--//! [PhysicsShape_isInside_pt_tolerance]

end

local function PhysicsShape_setLocalScaling_scaling()
--//! [PhysicsShape_setLocalScaling_scaling]
-- @TODO: Test: PhysicsShape:setLocalScaling(scaling)
--//! [PhysicsShape_setLocalScaling_scaling]

end

local function PhysicsShape_getAabb_t_aabbMin_aabbMax()
--//! [PhysicsShape_getAabb_t_aabbMin_aabbMax]
-- @TODO: Test: PhysicsShape:getAabb(t, aabbMin, aabbMax)
--//! [PhysicsShape_getAabb_t_aabbMin_aabbMax]

end

local function PhysicsShape_create_type()
--//! [PhysicsShape_create_type]
-- @TODO:Test: NJLI.PhysicsShape.create(type)
--//! [PhysicsShape_create_type]

end

local function PhysicsShape_destroy_object()
--//! [PhysicsShape_destroy_object]
-- @TODO:Test: NJLI.PhysicsShape.destroy(object)
--//! [PhysicsShape_destroy_object]

end

local function PhysicsShape_load_object_L_stack_index()
--//! [PhysicsShape_load_object_L_stack_index]
-- @TODO:Test: NJLI.PhysicsShape.load(object, L, stack_index)
--//! [PhysicsShape_load_object_L_stack_index]

end

local function PhysicsShape_type_()
--//! [PhysicsShape_type_]
-- @TODO:Test: NJLI.PhysicsShape.type()
--//! [PhysicsShape_type_]

end


function Test:testAll()
	PhysicsShape_calculateSerializeBufferSize_()
	PhysicsShape_serialize_btSerializer()
	PhysicsShape_getClassName_()
	PhysicsShape_getType_()
	PhysicsShape_createRigidBodyWithShape_mass_motionState_localInertia()
	PhysicsShape_calculateLocalInertia_mass()
	PhysicsShape_getNumVertices_()
	PhysicsShape_getNumEdges_()
	PhysicsShape_getEdge_i_pa_pb()
	PhysicsShape_getVertex_i_vtx()
	PhysicsShape_getNumPlanes_()
	PhysicsShape_getPlane_planeNormal_planeSupport_i()
	PhysicsShape_isInside_pt_tolerance()
	PhysicsShape_setLocalScaling_scaling()
	PhysicsShape_getAabb_t_aabbMin_aabbMax()
	PhysicsShape_create_type()
	PhysicsShape_destroy_object()
	PhysicsShape_load_object_L_stack_index()
	PhysicsShape_type_()
end

return Test