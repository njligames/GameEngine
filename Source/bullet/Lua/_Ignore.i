//%ignore bt32BitAxisSweep3;
//%ignore btActivatingCollisionAlgorithm;
//%ignore btAngularLimit;
//%ignore btAxisSweep3;
//%ignore btBoxShape;
//%ignore btBvhTriangleMeshShape;
//%ignore btCapsuleShape;
//%ignore btCapsuleShapeX;
//%ignore btCapsuleShapeZ;
//%ignore btActivatingCollisionAlgorithm;
//%ignore btAngularLimit;
//%ignore btBU_Simplex1to4;
//%ignore btClock;
//%ignore btCollisionDispatcher;
//%ignore btCollisionObject;
//%ignore btCollisionWorld;
//%ignore btCompoundShape;
//%ignore btConeShape;
//%ignore btConeShapeX;
//%ignore btConeShapeZ;
//%ignore btConeTwistConstraint;
//%ignore btConvexHullShape;

//%ignore CProfileIterator;
//%ignore btCollisionAlgorithmConstructionInfo::getDispatcherId();
%ignore btMultiSapBroadphase::quicksort(btBroadphasePairArray& a, int lo, int hi);
//%ignore btRaycastVehicle::setRaycastWheelInfo(int wheelIndex , bool isInContact, const btVector3& hitPoint, const btVector3& hitNormal,btScalar depth);

%ignore isInside;
//%ignore btSelect;
//%ignore processAllOverlappingPairs;
//%ignore btAxisSweep3Internal;
//%ignore btAxisSweep3Internal< unsigned short >;
//%ignore btAxisSweep3Internal< unsigned int >;
%ignore btInternalTriangleInfoMap;
//%ignore TEST_CROSS_EDGE_BOX_MCR;
//%ignore btMultiBodyLinkCollider::upcast(btCollisionObject const *);
//%ignore btDiscreteCollisionDetectorInterface::Result;



%ignore btSelect(unsigned int,int,int) ;
%ignore btSelect(unsigned int,unsigned int,unsigned int);
%ignore btSelect(unsigned int,unsigned int,unsigned int);
%ignore btSwapEndian(unsigned short);
%ignore btSwapEndian(unsigned int);
%ignore btSwapEndian(unsigned int);
%ignore btSwapEndian(short);
%ignore btSwapEndian(unsigned int);


%ignore btCollisionObjectWrapper;

%ignore operator new;
%ignore operator delete;
%ignore operator new[];
%ignore operator delete[];

%ignore btAlignedAllocator::rebind;
%ignore btAlignedObjectArray::less;
%ignore btRigidBody::btRigidBodyConstructionInfo;

%ignore btDbvt::sStkNN;
%ignore btDbvt::sStkNP;
%ignore btDbvt::sStkNPS;
%ignore btDbvt::sStkCLN;
%ignore btDbvt::ICollide;
%ignore btDbvt::IWriter;
%ignore btDbvt::IClone;

%ignore btAxisSweep3Internal::Edge;
%ignore btAxisSweep3Internal::Handle;

%ignore btMultiSapBroadphase::btMultiSapProxy;

%ignore btBoxBoxCollisionAlgorithm::CreateFunc;
%ignore btBox2dBox2dCollisionAlgorithm::CreateFunc;

%ignore btDiscreteCollisionDetectorInterface::Result;
%ignore btDiscreteCollisionDetectorInterface::ClosestPointInput;

%ignore btCollisionWorld::LocalShapeInfo;
%ignore btCollisionWorld::LocalRayResult;
%ignore btCollisionWorld::RayResultCallback;
%ignore btCollisionWorld::ClosestRayResultCallback;
%ignore btCollisionWorld::AllHitsRayResultCallback;
%ignore btCollisionWorld::LocalConvexResult;
%ignore btCollisionWorld::ConvexResultCallback;
%ignore btCollisionWorld::ClosestConvexResultCallback;
%ignore btCollisionWorld::ContactResultCallback;

%ignore btCompoundCollisionAlgorithm::CreateFunc;
%ignore btCompoundCollisionAlgorithm::SwappedCreateFunc;

%ignore btCompoundCompoundCollisionAlgorithm::CreateFunc;
%ignore btCompoundCompoundCollisionAlgorithm::SwappedCreateFunc;

%ignore btConvex2dConvex2dAlgorithm::CreateFunc;

%ignore btConvexConcaveCollisionAlgorithm::CreateFunc;
%ignore btConvexConcaveCollisionAlgorithm::SwappedCreateFunc;

%ignore btConvexConvexAlgorithm::CreateFunc;

%ignore btConvexPlaneCollisionAlgorithm::CreateFunc;

%ignore btEmptyAlgorithm::CreateFunc;

%ignore btSimulationIslandManager::IslandCallback;

%ignore btSphereBoxCollisionAlgorithm::CreateFunc;

%ignore btSphereSphereCollisionAlgorithm::CreateFunc;

%ignore btSphereTriangleCollisionAlgorithm::CreateFunc;

%ignore btConvexCast::CastResult;

%ignore btGjkEpaSolver2::sResults;

%ignore btTypedConstraint::btConstraintInfo1;
%ignore btTypedConstraint::btConstraintInfo2;

%ignore btVehicleRaycaster::btVehicleRaycasterResult;

%ignore btWheelInfo::RaycastInfo;

%ignore btRaycastVehicle::btVehicleTuning;

%ignore btSparseSdf::IntFrac;
%ignore btSparseSdf::Cell;

%ignore btSoftBody::eAeroModel;
%ignore btSoftBody::eVSolver;
%ignore btSoftBody::ePSolver;
%ignore btSoftBody::eSolverPresets;
%ignore btSoftBody::eFeature;
%ignore btSoftBody::fCollision;
%ignore btSoftBody::fMaterial;
%ignore btSoftBody::sRayCast;
%ignore btSoftBody::ImplicitFn;
%ignore btSoftBody::sCti;
%ignore btSoftBody::sMedium;
%ignore btSoftBody::Element;
%ignore btSoftBody::Material;
%ignore btSoftBody::Feature;
%ignore btSoftBody::Node;
%ignore btSoftBody::Link;
%ignore btSoftBody::Face;
%ignore btSoftBody::Tetra;
%ignore btSoftBody::RContact;
%ignore btSoftBody::SContact;
%ignore btSoftBody::Anchor;
%ignore btSoftBody::Note;
%ignore btSoftBody::Pose;
%ignore btSoftBody::Cluster;
%ignore btSoftBody::Impulse;
%ignore btSoftBody::Body;
%ignore btSoftBody::Joint;
%ignore btSoftBody::LJoint;
%ignore btSoftBody::AJoint;
%ignore btSoftBody::CJoint;
%ignore btSoftBody::Config;
%ignore btSoftBody::SolverState;
%ignore btSoftBody::RayFromToCaster;

%ignore btSoftBodyConcaveCollisionAlgorithm::CreateFunc;
%ignore btSoftBodyConcaveCollisionAlgorithm::SwappedCreateFunc;

%ignore btSoftColliders::ClusterBase;
%ignore btSoftColliders::CollideCL_RS;
%ignore btSoftColliders::CollideCL_SS;
%ignore btSoftColliders::CollideSDF_RS;
%ignore btSoftColliders::CollideVF_SS;

%ignore btSoftRigidCollisionAlgorithm::CreateFunc;

%ignore btSoftSoftCollisionAlgorithm::CreateFunc;

%ignore ConvexH::HalfEdge;

%ignore btConvexHullComputer::Edge;

%ignore btHashString;

%ignore btStorageResult;
