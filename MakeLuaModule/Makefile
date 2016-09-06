
.PHONY:runtime all

SRC = ../Source

BULLET_SOURCE = ${SRC}/bullet
BULLET_SOURCE0= ${SRC}/bullet/bullet-2.82-r2704/src
BULLET_SOURCE1= ${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision
BULLET_SOURCE2= ${BULLET_SOURCE0}/BulletCollision/CollisionDispatch
BULLET_SOURCE3= ${BULLET_SOURCE0}/BulletCollision/CollisionShapes
BULLET_SOURCE4= ${BULLET_SOURCE0}/BulletCollision/Gimpact
BULLET_SOURCE5= ${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision
BULLET_SOURCE6= ${BULLET_SOURCE0}/BulletDynamics/Character
BULLET_SOURCE7= ${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver
BULLET_SOURCE8= ${BULLET_SOURCE0}/BulletDynamics/Dynamics
BULLET_SOURCE9= ${BULLET_SOURCE0}/BulletDynamics/Featherstone
BULLET_SOURCE10=${BULLET_SOURCE0}/BulletDynamics/MLCPSolvers
BULLET_SOURCE11=${BULLET_SOURCE0}/BulletDynamics/Vehicle
BULLET_SOURCE12=${BULLET_SOURCE0}/BulletSoftBody
BULLET_SOURCE13=${BULLET_SOURCE0}/LinearMath
BULLET_SOURCE14=${BULLET_SOURCE0}/MiniCL
BULLET_SOURCE15=${BULLET_SOURCE0}/MiniCL/MiniCLTask
BULLET_SOURCE16=${BULLET_SOURCE0}/vectormath
BULLET_SOURCE17=${BULLET_SOURCE0}/vectormath/neon
BULLET_SOURCE18=${BULLET_SOURCE0}/vectormath/scalar
BULLET_SOURCE19=${BULLET_SOURCE0}/vectormath/sse

BULLET_MODULE_NAME=bullet
BULLET_XML_FILE="./${BULLET_MODULE_NAME}.xml"
BULLET_CPP_OUTPUT="./${BULLET_MODULE_NAME}_wrap.cpp"
BULLET_INTERFACE_FILE="${SRC}/bullet/Lua/_LuaEntry.i"
BULLET_SYMBOL_FILE="./lua-symbol-${BULLET_MODULE_NAME}.txt"
BULLET_WRAP_OUTPUT=${BULLET_MODULE_NAME}_wrap.o
BULLET_OUTPUT=${BULLET_MODULE_NAME}.o
BULLET_LUA_MODULE=lib${BULLET_MODULE_NAME}.so

NJLI_SOURCE = ${SRC}/jli_game_engine/version-1.0/src
NJLI_CORE_SOURCE=${SRC}/platform/core

MAC_NJLI_SOURCE=${SRC}/platform/mac
IOS_NJLI_SOURCE=${SRC}/platform/ios

#JSON_INCLUDE=${SRC}/json/jsoncpp/include

MAC_FMOD_INCLUDE_DIR = "${SRC}/fmod/mac/FMOD Programmers API/api/lowlevel/inc"
IOS_FMOD_INCLUDE_DIR = "${SRC}/fmod/ios/FMOD Programmers API/api/lowlevel/inc"

#NANOVG_DIR = "${SRC}/nanovg/nanovg/src"

NJLI_MODULE_NAME=njli
NJLI_XML_FILE="./${NJLI_MODULE_NAME}.xml"
NJLI_CPP_OUTPUT="./${NJLI_MODULE_NAME}_wrap.cpp"
NJLI_INTERFACE_FILE="${SRC}/jli_game_engine/Lua/_LuaEntry.i"
NJLI_SYMBOL_FILE="./lua-symbol-${NJLI_MODULE_NAME}.txt"
NJLI_WRAP_OUTPUT=${NJLI_MODULE_NAME}_wrap.o
NJLI_OUTPUT=${NJLI_MODULE_NAME}.o
NJLI_LUA_MODULE=${NJLI_MODULE_NAME}.so

LUA_RUNTIME_OUTPUT="./swig_runtime.h"

BULLET_OBJECTS = \
btClock.o \
btAxisSweep3.o \
btBroadphaseProxy.o \
btCollisionAlgorithm.o \
btDbvt.o \
btDbvtBroadphase.o \
btDispatcher.o \
btMultiSapBroadphase.o \
btOverlappingPairCache.o \
btQuantizedBvh.o \
btSimpleBroadphase.o \
btActivatingCollisionAlgorithm.o \
btBox2dBox2dCollisionAlgorithm.o \
btBoxBoxCollisionAlgorithm.o \
btBoxBoxDetector.o \
btCollisionDispatcher.o \
btCollisionObject.o \
btCollisionWorld.o \
btCompoundCollisionAlgorithm.o \
btCompoundCompoundCollisionAlgorithm.o \
btConvex2dConvex2dAlgorithm.o \
btConvexConcaveCollisionAlgorithm.o \
btConvexConvexAlgorithm.o \
btConvexPlaneCollisionAlgorithm.o \
btDefaultCollisionConfiguration.o \
btEmptyCollisionAlgorithm.o \
btGhostObject.o \
btHashedSimplePairCache.o \
btInternalEdgeUtility.o \
btManifoldResult.o \
btSimulationIslandManager.o \
btSphereBoxCollisionAlgorithm.o \
btSphereSphereCollisionAlgorithm.o \
btSphereTriangleCollisionAlgorithm.o \
btUnionFind.o \
SphereTriangleDetector.o \
btBox2dShape.o \
btBoxShape.o \
btBvhTriangleMeshShape.o \
btCapsuleShape.o \
btCollisionShape.o \
btCompoundShape.o \
btConcaveShape.o \
btConeShape.o \
btConvex2dShape.o \
btConvexHullShape.o \
btConvexInternalShape.o \
btConvexPointCloudShape.o \
btConvexPolyhedron.o \
btConvexShape.o \
btConvexTriangleMeshShape.o \
btCylinderShape.o \
btEmptyShape.o \
btHeightfieldTerrainShape.o \
btMinkowskiSumShape.o \
btMultimaterialTriangleMeshShape.o \
btMultiSphereShape.o \
btOptimizedBvh.o \
btPolyhedralConvexShape.o \
btScaledBvhTriangleMeshShape.o \
btShapeHull.o \
btSphereShape.o \
btStaticPlaneShape.o \
btStridingMeshInterface.o \
btTetrahedronShape.o \
btTriangleBuffer.o \
btTriangleCallback.o \
btTriangleIndexVertexArray.o \
btTriangleIndexVertexMaterialArray.o \
btTriangleMesh.o \
btTriangleMeshShape.o \
btUniformScalingShape.o \
btContactProcessing.o \
btGenericPoolAllocator.o \
btGImpactBvh.o \
btGImpactCollisionAlgorithm.o \
btGImpactQuantizedBvh.o \
btGImpactShape.o \
btTriangleShapeEx.o \
gim_box_set.o \
gim_contact.o \
gim_memory.o \
gim_tri_collision.o \
btContinuousConvexCollision.o \
btConvexCast.o \
btGjkConvexCast.o \
btGjkEpa2.o \
btGjkEpaPenetrationDepthSolver.o \
btGjkPairDetector.o \
btMinkowskiPenetrationDepthSolver.o \
btPersistentManifold.o \
btPolyhedralContactClipping.o \
btRaycastCallback.o \
btSubSimplexConvexCast.o \
btVoronoiSimplexSolver.o \
btKinematicCharacterController.o \
btConeTwistConstraint.o \
btContactConstraint.o \
btFixedConstraint.o \
btGearConstraint.o \
btGeneric6DofConstraint.o \
btGeneric6DofSpringConstraint.o \
btHinge2Constraint.o \
btHingeConstraint.o \
btPoint2PointConstraint.o \
btSequentialImpulseConstraintSolver.o \
btSliderConstraint.o \
btSolve2LinearConstraint.o \
btTypedConstraint.o \
btUniversalConstraint.o \
btDiscreteDynamicsWorld.o \
btRigidBody.o \
btSimpleDynamicsWorld.o \
btMultiBody.o \
btMultiBodyConstraint.o \
btMultiBodyConstraintSolver.o \
btMultiBodyDynamicsWorld.o \
btMultiBodyJointLimitConstraint.o \
btMultiBodyJointMotor.o \
btMultiBodyPoint2Point.o \
btDantzigLCP.o \
btMLCPSolver.o \
btRaycastVehicle.o \
btWheelInfo.o \
btDefaultSoftBodySolver.o \
btSoftBody.o \
btSoftBodyConcaveCollisionAlgorithm.o \
btSoftBodyHelpers.o \
btSoftBodyRigidBodyCollisionConfiguration.o \
btSoftRigidCollisionAlgorithm.o \
btSoftRigidDynamicsWorld.o \
btSoftSoftCollisionAlgorithm.o \
btAlignedAllocator.o \
btConvexHull.o \
btConvexHullComputer.o \
btGeometryUtil.o \
btPolarDecomposition.o \
btQuickprof.o \
btSerializer.o \
btVector3.o \




BULLET_SOURCES = \
${BULLET_SOURCE}/btClock.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btAxisSweep3.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btBroadphaseProxy.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btDbvt.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btDbvtBroadphase.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btDispatcher.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btMultiSapBroadphase.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btOverlappingPairCache.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btQuantizedBvh.cpp \
${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision/btSimpleBroadphase.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btActivatingCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btBox2dBox2dCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btBoxBoxCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btBoxBoxDetector.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btCollisionDispatcher.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btCollisionObject.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btCollisionWorld.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btCompoundCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btCompoundCompoundCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btConvex2dConvex2dAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btConvexConcaveCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btConvexConvexAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btConvexPlaneCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btDefaultCollisionConfiguration.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btEmptyCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btGhostObject.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btHashedSimplePairCache.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btInternalEdgeUtility.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btManifoldResult.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btSimulationIslandManager.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btSphereBoxCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btSphereTriangleCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/btUnionFind.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionDispatch/SphereTriangleDetector.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btBox2dShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btBoxShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btCapsuleShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btCollisionShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btCompoundShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConcaveShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConeShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConvex2dShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConvexHullShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConvexInternalShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConvexPointCloudShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConvexPolyhedron.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConvexShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btCylinderShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btEmptyShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btHeightfieldTerrainShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btMinkowskiSumShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btMultimaterialTriangleMeshShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btMultiSphereShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btOptimizedBvh.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btPolyhedralConvexShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btScaledBvhTriangleMeshShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btShapeHull.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btSphereShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btStaticPlaneShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btStridingMeshInterface.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btTetrahedronShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btTriangleBuffer.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btTriangleCallback.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btTriangleIndexVertexMaterialArray.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btTriangleMesh.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btTriangleMeshShape.cpp \
${BULLET_SOURCE0}/BulletCollision/CollisionShapes/btUniformScalingShape.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/btContactProcessing.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/btGenericPoolAllocator.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/btGImpactBvh.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/btGImpactCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/btGImpactQuantizedBvh.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/btGImpactShape.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/btTriangleShapeEx.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/gim_box_set.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/gim_contact.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/gim_memory.cpp \
${BULLET_SOURCE0}/BulletCollision/Gimpact/gim_tri_collision.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btContinuousConvexCollision.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btConvexCast.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btGjkConvexCast.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btGjkEpa2.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btGjkEpaPenetrationDepthSolver.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btMinkowskiPenetrationDepthSolver.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btPersistentManifold.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btPolyhedralContactClipping.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btRaycastCallback.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btSubSimplexConvexCast.cpp \
${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision/btVoronoiSimplexSolver.cpp \
${BULLET_SOURCE0}/BulletDynamics/Character/btKinematicCharacterController.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btConeTwistConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btContactConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btFixedConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btGearConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btHinge2Constraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btHingeConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btPoint2PointConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btSequentialImpulseConstraintSolver.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btSliderConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btSolve2LinearConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btTypedConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver/btUniversalConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/Dynamics/btDiscreteDynamicsWorld.cpp \
${BULLET_SOURCE0}/BulletDynamics/Dynamics/btRigidBody.cpp \
${BULLET_SOURCE0}/BulletDynamics/Dynamics/btSimpleDynamicsWorld.cpp \
${BULLET_SOURCE0}/BulletDynamics/Featherstone/btMultiBody.cpp \
${BULLET_SOURCE0}/BulletDynamics/Featherstone/btMultiBodyConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/Featherstone/btMultiBodyConstraintSolver.cpp \
${BULLET_SOURCE0}/BulletDynamics/Featherstone/btMultiBodyDynamicsWorld.cpp \
${BULLET_SOURCE0}/BulletDynamics/Featherstone/btMultiBodyJointLimitConstraint.cpp \
${BULLET_SOURCE0}/BulletDynamics/Featherstone/btMultiBodyJointMotor.cpp \
${BULLET_SOURCE0}/BulletDynamics/Featherstone/btMultiBodyPoint2Point.cpp \
${BULLET_SOURCE0}/BulletDynamics/MLCPSolvers/btDantzigLCP.cpp \
${BULLET_SOURCE0}/BulletDynamics/MLCPSolvers/btMLCPSolver.cpp \
${BULLET_SOURCE0}/BulletDynamics/Vehicle/btRaycastVehicle.cpp \
${BULLET_SOURCE0}/BulletDynamics/Vehicle/btWheelInfo.cpp \
${BULLET_SOURCE0}/BulletSoftBody/btDefaultSoftBodySolver.cpp \
${BULLET_SOURCE0}/BulletSoftBody/btSoftBody.cpp \
${BULLET_SOURCE0}/BulletSoftBody/btSoftBodyConcaveCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletSoftBody/btSoftBodyHelpers.cpp \
${BULLET_SOURCE0}/BulletSoftBody/btSoftBodyRigidBodyCollisionConfiguration.cpp \
${BULLET_SOURCE0}/BulletSoftBody/btSoftRigidCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/BulletSoftBody/btSoftRigidDynamicsWorld.cpp \
${BULLET_SOURCE0}/BulletSoftBody/btSoftSoftCollisionAlgorithm.cpp \
${BULLET_SOURCE0}/LinearMath/btAlignedAllocator.cpp \
${BULLET_SOURCE0}/LinearMath/btConvexHull.cpp \
${BULLET_SOURCE0}/LinearMath/btConvexHullComputer.cpp \
${BULLET_SOURCE0}/LinearMath/btGeometryUtil.cpp \
${BULLET_SOURCE0}/LinearMath/btPolarDecomposition.cpp \
${BULLET_SOURCE0}/LinearMath/btQuickprof.cpp \
${BULLET_SOURCE0}/LinearMath/btSerializer.cpp \
${BULLET_SOURCE0}/LinearMath/btVector3.cpp \

NJLI_SOURCES = \
${NJLI_SOURCE}/AbstractActionable.cpp \
${NJLI_SOURCE}/AbstractBuilder.cpp \
${NJLI_SOURCE}/AbstractDecorator.cpp \
${NJLI_SOURCE}/AbstractFactoryObject.cpp \
${NJLI_SOURCE}/AbstractTransform.cpp \
${NJLI_SOURCE}/Action.cpp \
${NJLI_SOURCE}/ActionBuilder.cpp \
${NJLI_SOURCE}/ButtonHUDBuilder.cpp \
${NJLI_SOURCE}/Camera.cpp \
${NJLI_SOURCE}/CameraBuilder.cpp \
${NJLI_SOURCE}/CheckboxHUDBuilder.cpp \
${NJLI_SOURCE}/Clock.cpp \
${NJLI_SOURCE}/ClockBuilder.cpp \
${NJLI_SOURCE}/CollisionResponse.cpp \
${NJLI_SOURCE}/CollisionResponseBuilder.cpp \
${NJLI_SOURCE}/CubeBuilder.cpp \
${NJLI_SOURCE}/DropdownHUDBuilder.cpp \
${NJLI_SOURCE}/Font.cpp \
${NJLI_SOURCE}/FontBuilder.cpp \
${NJLI_SOURCE}/GameClock.cpp \
${NJLI_SOURCE}/Image.cpp \
${NJLI_SOURCE}/ImageBuilder.cpp \
${NJLI_SOURCE}/JLIFactoryTypes.cpp \
${NJLI_SOURCE}/JsonJLI.cpp \
${NJLI_SOURCE}/JsonJLIBuilder.cpp \
${NJLI_SOURCE}/LabelHUDBuilder.cpp \
${NJLI_SOURCE}/LevelOfDetail.cpp \
${NJLI_SOURCE}/LevelOfDetailBuilder.cpp \
${NJLI_SOURCE}/Light.cpp \
${NJLI_SOURCE}/LightBuilder.cpp \
${NJLI_SOURCE}/Material.cpp \
${NJLI_SOURCE}/MaterialBuilder.cpp \
${NJLI_SOURCE}/MaterialPropertyBuilder.cpp \
${NJLI_SOURCE}/Node.cpp \
${NJLI_SOURCE}/NodeBuilder.cpp \
${NJLI_SOURCE}/NodeState.cpp \
${NJLI_SOURCE}/NodeStateBuilder.cpp \
${NJLI_SOURCE}/NodeStateMachine.cpp \
${NJLI_SOURCE}/NodeStateMachineBuilder.cpp \
${NJLI_SOURCE}/ParticleEmitter.cpp \
${NJLI_SOURCE}/ParticleEmitterBuilder.cpp \
${NJLI_SOURCE}/PhysicsBody.cpp \
${NJLI_SOURCE}/PhysicsBodyGhost.cpp \
${NJLI_SOURCE}/PhysicsBodyGhostBuilder.cpp \
${NJLI_SOURCE}/PhysicsBodyRigid.cpp \
${NJLI_SOURCE}/PhysicsBodyRigidBuilder.cpp \
${NJLI_SOURCE}/PhysicsBodySoft.cpp \
${NJLI_SOURCE}/PhysicsBodySoftBuilder.cpp \
${NJLI_SOURCE}/PhysicsCloseContact.cpp \
${NJLI_SOURCE}/PhysicsCloseContactBuilder.cpp \
${NJLI_SOURCE}/PhysicsConstraint.cpp \
${NJLI_SOURCE}/PhysicsConstraintBuilder.cpp \
${NJLI_SOURCE}/PhysicsConstraintConeTwist.cpp \
${NJLI_SOURCE}/PhysicsConstraintConeTwistBuilder.cpp \
${NJLI_SOURCE}/PhysicsConstraintFixed.cpp \
${NJLI_SOURCE}/PhysicsConstraintFixedBuilder.cpp \
${NJLI_SOURCE}/PhysicsConstraintGeneric6Dof.cpp \
${NJLI_SOURCE}/PhysicsConstraintGeneric6DofBuilder.cpp \
${NJLI_SOURCE}/PhysicsConstraintGeneric6DofSpring.cpp \
${NJLI_SOURCE}/PhysicsConstraintGeneric6DofSpringBuilder.cpp \
${NJLI_SOURCE}/PhysicsConstraintHinge.cpp \
${NJLI_SOURCE}/PhysicsConstraintHingeBuilder.cpp \
${NJLI_SOURCE}/PhysicsConstraintPointToPoint.cpp \
${NJLI_SOURCE}/PhysicsConstraintPointToPointBuilder.cpp \
${NJLI_SOURCE}/PhysicsConstraintSlider.cpp \
${NJLI_SOURCE}/PhysicsConstraintSliderBuilder.cpp \
${NJLI_SOURCE}/PhysicsContact.cpp \
${NJLI_SOURCE}/PhysicsContactBuilder.cpp \
${NJLI_SOURCE}/PhysicsField.cpp \
${NJLI_SOURCE}/PhysicsFieldBuilder.cpp \
${NJLI_SOURCE}/PhysicsRayContact.cpp \
${NJLI_SOURCE}/PhysicsRayContactBuilder.cpp \
${NJLI_SOURCE}/PhysicsShape.cpp \
${NJLI_SOURCE}/PhysicsShapeBox.cpp \
${NJLI_SOURCE}/PhysicsShapeBox2D.cpp \
${NJLI_SOURCE}/PhysicsShapeBox2DBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeBoxBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeBvhTriangleMesh.cpp \
${NJLI_SOURCE}/PhysicsShapeBvhTriangleMeshBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeCapsule.cpp \
${NJLI_SOURCE}/PhysicsShapeCapsuleBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeCone.cpp \
${NJLI_SOURCE}/PhysicsShapeConeBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeConvexHull.cpp \
${NJLI_SOURCE}/PhysicsShapeConvexHullBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeConvexTriangleMesh.cpp \
${NJLI_SOURCE}/PhysicsShapeConvexTriangleMeshBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeCylinder.cpp \
${NJLI_SOURCE}/PhysicsShapeCylinderBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeHeightfieldTerrain.cpp \
${NJLI_SOURCE}/PhysicsShapeHeightfieldTerrainBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeMultiSphere.cpp \
${NJLI_SOURCE}/PhysicsShapeMultiSphereBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeSphere.cpp \
${NJLI_SOURCE}/PhysicsShapeSphereBuilder.cpp \
${NJLI_SOURCE}/PhysicsShapeStaticPlane.cpp \
${NJLI_SOURCE}/PhysicsShapeStaticPlaneBuilder.cpp \
${NJLI_SOURCE}/PhysicsWorld.cpp \
${NJLI_SOURCE}/PhysicsWorldBuilder.cpp \
${NJLI_SOURCE}/Plane.cpp \
${NJLI_SOURCE}/PlaneBuilder.cpp \
${NJLI_SOURCE}/Scene.cpp \
${NJLI_SOURCE}/SceneBuilder.cpp \
${NJLI_SOURCE}/SceneState.cpp \
${NJLI_SOURCE}/SceneStateBuilder.cpp \
${NJLI_SOURCE}/SceneStateMachine.cpp \
${NJLI_SOURCE}/SceneStateMachineBuilder.cpp \
${NJLI_SOURCE}/ShaderProgramBuilder.cpp \
${NJLI_SOURCE}/Skinner.cpp \
${NJLI_SOURCE}/SkinnerBuilder.cpp \
${NJLI_SOURCE}/SliderHUDBuilder.cpp \
${NJLI_SOURCE}/SoundBuilder.cpp \
${NJLI_SOURCE}/Sprite2DBuilder.cpp \
${NJLI_SOURCE}/SpriteFrameAtlas.cpp \
${NJLI_SOURCE}/SpriteFrameAtlasBuilder.cpp \
${NJLI_SOURCE}/SteeringBehavior.cpp \
${NJLI_SOURCE}/SteeringBehaviorAlignment.cpp \
${NJLI_SOURCE}/SteeringBehaviorAlignmentBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorArrive.cpp \
${NJLI_SOURCE}/SteeringBehaviorArriveBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorCohesion.cpp \
${NJLI_SOURCE}/SteeringBehaviorCohesionBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorEvade.cpp \
${NJLI_SOURCE}/SteeringBehaviorEvadeBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorFlee.cpp \
${NJLI_SOURCE}/SteeringBehaviorFleeBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorFollowPath.cpp \
${NJLI_SOURCE}/SteeringBehaviorFollowPathBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorHide.cpp \
${NJLI_SOURCE}/SteeringBehaviorHideBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorInterpose.cpp \
${NJLI_SOURCE}/SteeringBehaviorInterposeBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorMachine.cpp \
${NJLI_SOURCE}/SteeringBehaviorMachineBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorMachineDithered.cpp \
${NJLI_SOURCE}/SteeringBehaviorMachineDitheredBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorMachinePrioritized.cpp \
${NJLI_SOURCE}/SteeringBehaviorMachinePrioritizedBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorMachineWeighted.cpp \
${NJLI_SOURCE}/SteeringBehaviorMachineWeightedBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorObstacleAvoidance.cpp \
${NJLI_SOURCE}/SteeringBehaviorObstacleAvoidanceBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorOffsetPursuit.cpp \
${NJLI_SOURCE}/SteeringBehaviorOffsetPursuitBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorPursuit.cpp \
${NJLI_SOURCE}/SteeringBehaviorPursuitBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorSeek.cpp \
${NJLI_SOURCE}/SteeringBehaviorSeekBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorSeparation.cpp \
${NJLI_SOURCE}/SteeringBehaviorSeparationBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorWallAvoidance.cpp \
${NJLI_SOURCE}/SteeringBehaviorWallAvoidanceBuilder.cpp \
${NJLI_SOURCE}/SteeringBehaviorWander.cpp \
${NJLI_SOURCE}/SteeringBehaviorWanderBuilder.cpp \
${NJLI_SOURCE}/StopWatch.cpp \
${NJLI_SOURCE}/StopWatchBuilder.cpp \
${NJLI_SOURCE}/TextboxHUDBuilder.cpp \
${NJLI_SOURCE}/Thread.cpp \
${NJLI_SOURCE}/ThreadBuilder.cpp \
${NJLI_SOURCE}/Timer.cpp \
${NJLI_SOURCE}/TimerBuilder.cpp \
${NJLI_SOURCE}/World.cpp \
${NJLI_SOURCE}/WorldClock.cpp \
${NJLI_SOURCE}/WorldFactory.cpp \
${NJLI_SOURCE}/WorldLuaVirtualMachine.cpp \
${NJLI_SOURCE}/WorldResourceLoader.cpp \
${NJLI_SOURCE}/WorldSQLite.cpp \
${NJLI_SOURCE}/WorldSocket.cpp \
${NJLI_SOURCE}/WorldState.cpp \
${NJLI_SOURCE}/WorldStateBuilder.cpp \
${NJLI_SOURCE}/WorldStateMachine.cpp \
${NJLI_SOURCE}/WorldStateMachineBuilder.cpp \
${NJLI_SOURCE}/Xml.cpp \
${NJLI_SOURCE}/XmlBuilder.cpp \

all: IOS

#LDFLAGS += -L${FMOD_DIR}/lib -lfmod

MAC:${BULLET_OBJS}
	/usr/local/bin/swig -w312 -w201 -c++ -lua -includeall -ignoremissing -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -features directors,autodoc=1 -DBT_INFINITY -xmlout ${BULLET_XML_FILE} -o ${BULLET_CPP_OUTPUT} ${BULLET_INTERFACE_FILE}
	g++ -std=c++11 -frtti -fexceptions -DLUA_WRAPPER_LOGGING=0 -I${MAC_FMOD_INCLUDE_DIR} -I./ -I${NJLI_CORE_SOURCE} -I${MAC_NJLI_SOURCE} -I${NJLI_SOURCE} -I/usr/local/include -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -c ${BULLET_CPP_OUTPUT} -o ${BULLET_WRAP_OUTPUT} 
	g++ -std=c++11 -frtti -fexceptions -DLUA_WRAPPER_LOGGING=0 -I${MAC_FMOD_INCLUDE_DIR} -I./ -I${NJLI_CORE_SOURCE} -I${MAC_NJLI_SOURCE} -I${NJLI_SOURCE} -I/usr/local/include -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -c ${BULLET_SOURCES}  
	g++ -std=c++11 -frtti -fexceptions -DLUA_WRAPPER_LOGGING=0 -I${MAC_FMOD_INCLUDE_DIR} -I./ -I${NJLI_CORE_SOURCE} -I${MAC_NJLI_SOURCE} -I${NJLI_SOURCE} -I/usr/local/include -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -L/usr/local/lib -llua -shared ${BULLET_WRAP_OUTPUT} ${BULLET_OBJECTS} -o ${BULLET_LUA_MODULE}
	cp ${BULLET_LUA_MODULE} /usr/local/lib/lua/5.3/mac

IOS:${BULLET_OBJS}
	/usr/local/bin/swig -w312 -w201 -c++ -lua -includeall -ignoremissing -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -features directors,autodoc=1 -DBT_INFINITY -xmlout ${BULLET_XML_FILE} -o ${BULLET_CPP_OUTPUT} ${BULLET_INTERFACE_FILE}
	g++ -std=c++11 -frtti -fexceptions -DLUA_WRAPPER_LOGGING=0 -I${IOS_FMOD_INCLUDE_DIR} -I./ -I${NJLI_CORE_SOURCE} -I${IOS_NJLI_IOS_SOURCE} -I${NJLI_SOURCE} -I/Users/jamesfolk/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk/include -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -arch arm64 -pipe -Os -gdwarf-2 -isysroot /Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk -mno-thumb -c ${BULLET_CPP_OUTPUT} -o ${BULLET_WRAP_OUTPUT} 
	g++ -std=c++11 -frtti -fexceptions -DLUA_WRAPPER_LOGGING=0 -I${IOS_FMOD_INCLUDE_DIR} -I./ -I${NJLI_CORE_SOURCE} -I${IOS_NJLI_IOS_SOURCE} -I${NJLI_SOURCE} -I/Users/jamesfolk/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk/include -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -arch arm64 -pipe -Os -gdwarf-2 -isysroot /Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk -mno-thumb -c ${BULLET_SOURCES}  
	g++ -std=c++11 -frtti -fexceptions -DLUA_WRAPPER_LOGGING=0 -I${IOS_FMOD_INCLUDE_DIR} -I./ -I${NJLI_CORE_SOURCE} -I${IOS_NJLI_IOS_SOURCE} -I${NJLI_SOURCE} -I/Users/jamesfolk/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk/include -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -arch arm64 -pipe -Os -gdwarf-2 -isysroot /Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk -mno-thumb -L/Users/jamesfolk/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk/lib -ldl -llua -shared ${BULLET_WRAP_OUTPUT} ${BULLET_OBJECTS} -o ${BULLET_LUA_MODULE}
	cp ${BULLET_LUA_MODULE} /Users/jamesfolk/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk/lib/lua/5.3
	cp ${BULLET_LUA_MODULE} /usr/local/lib/lua/5.3
#${NJLI_CPP_OUTPUT}: ${NJLI_SOURCES}
#	/usr/local/bin/swig -w312 -w201 -c++ -lua -includeall -ignoremissing -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -I${NJLI_CORE_SOURCE} -I${NJLI_SOURCE} -features directors,autodoc=1 -xmlout ${NJLI_XML_FILE} -o ${NJLI_CPP_OUTPUT} ${NJLI_INTERFACE_FILE}

#runtime:
#	/usr/local/bin/swig -lua -external-runtime ${LUA_RUNTIME_OUTPUT}



	
# PROJECT_NAME = njli

# SOURCES = \

# INCLUDES = \

# OBJECTS = \

# # TARGET = $(PROJECT_NAME).html
# TARGET = $(PROJECT_NAME).so

# CXXFLAGS = $(INCLUDES:%=-I%) -std=gnu++11 -frtti -fexceptions -O0 --js-opts 0 -g4 -DDEBUG=1 -s FULL_ES2=1 -s ALLOW_MEMORY_GROWTH=1 -s ASSERTIONS=1 -s DEMANGLE_SUPPORT=1 -g
# #CXXFLAGS = $(INCLUDES:%=-I%) -std=gnu++11 -frtti -fexceptions -Oz -s ALLOW_MEMORY_GROWTH=1 -s INLINING_LIMIT=1
# # LDFLAGS = --memory-init-file 1 --embed-file ../COMMON/assets@/
# #LDFLAGS = -lc++ --preload-file ../COMMON/assets@/

# # Targets start here.
# all: $(TARGET)

# $(TARGET): $(OBJECTS)
# 	$(CC) $(CXXFLAGS) -o $@ $(LDFLAGS) $(OBJECTS)

# clean:
# 	$(RM) $(TARGET) $(OBJECTS)
# 	$(RM) $(PROJECT_NAME).*

# depend:
# 	@$(CC) $(CXXFLAGS) -MM $(SOURCES)
	
# # list targets that do not create files (but not all makes understand .PHONY)
# .PHONY:	all clean depend

# # Dependences (call 'make depend' to generate); do not delete:
# # Build for these is implicit, no need to specify compiler command lines.
