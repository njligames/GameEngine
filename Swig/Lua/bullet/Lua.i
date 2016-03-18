//Lua interface file

%include <typemaps.i>

%include "BulletLuaTypemaps.i"

%ignore bt32BitAxisSweep3;
%ignore btActivatingCollisionAlgorithm;
%ignore btAngularLimit;
%ignore btAxisSweep3;
%ignore btBoxShape;
%ignore btBvhTriangleMeshShape;
%ignore btCapsuleShape;
%ignore btCapsuleShapeX;
%ignore btCapsuleShapeZ;
%ignore btActivatingCollisionAlgorithm;
%ignore btAngularLimit;
%ignore btBU_Simplex1to4;
%ignore btClock;
%ignore btCollisionDispatcher;
%ignore btCollisionObject;
%ignore btCollisionWorld;
%ignore btCompoundShape;
%ignore btConeShape;
%ignore btConeShapeX;
%ignore btConeShapeZ;
%ignore btConeTwistConstraint;
%ignore btConvexHullShape;



%ignore btStorageResult;
%ignore CProfileIterator;
%ignore btCollisionAlgorithmConstructionInfo::getDispatcherId();
%ignore btMultiSapBroadphase::quicksort(btBroadphasePairArray& a, int lo, int hi);
%ignore btRaycastVehicle::setRaycastWheelInfo(int wheelIndex , bool isInContact, const btVector3& hitPoint, const btVector3& hitNormal,btScalar depth);

%rename(btScalarPtr) operator btScalar*;
%rename(btScalarConstPtr) operator const btScalar*;
%rename(operator_btVector3) operator btVector3;

%rename(operator_new) operator new;
%rename(operator_delete) operator delete;
%rename(operator_new_array) operator new[];
%rename(operator_delete_array) operator delete[];

%ignore btCollisionObjectWrapper;

//%ignore operator new;
//%ignore operator delete;
//%ignore operator new[];
//%ignore operator delete[];

%ignore isInside;
%ignore btSelect;

%rename(btSwapEndian_unsigned_short) btSwapEndian(unsigned short);
%rename(btSwapEndian_signed_int) btSwapEndian(unsigned int);
%rename(btSwapEndian_int) btSwapEndian(int);
%rename(btSwapEndian_shore) btSwapEndian(short);

%rename(upcast_const) btGhostObject::upcast(btCollisionObject const *);
%rename(upcast_const) btSoftBody::upcast(btCollisionObject const *);
%rename(upcast_const) btRigidBody::upcast(btCollisionObject const *);
%rename(getOverlappingPairs_const) btGhostObject::getOverlappingPairs() const;

%ignore processAllOverlappingPairs;

%ignore btAxisSweep3Internal;
%ignore btInternalTriangleInfoMap;


%apply btVector3** OUTPUT {btVector3& aabbMin,btVector3& aabbMax};
%apply btVector3** OUTPUT {btVector3& inertia};
%apply btVector3** OUTPUT {btVector3& planeNormal,btVector3& planeSupport};
%apply btVector3** OUTPUT {btVector3& vtx};
%apply btVector3** OUTPUT {btVector4& plane};
%apply btVector3** OUTPUT {btVector3& pa,btVector3& pb};

%{
    #include "btBulletDynamicsCommon.h"
    #include "btPrint.h"
%}

#include "btBulletDynamicsCommon.h"
#include " btPrint.h"

%array_functions(btVector2, btVector2Array);
%array_functions(btVector3, btVector3Array);
%array_functions(btVector4, btVector4Array);
%array_functions(btScalar, btScalarArray);
%array_functions(btManifoldPoint, btManifoldPointArray);
%array_functions(btMatrix3x3, btMatrix3x3Array);
%array_functions(btQuaternion, btQuaternionArray);
%array_functions(btTransform, btTransformArray);

%extend btMatrix3x3
{
    const char *__str__()
    {
        static char buffer[1024];
        sprintf(buffer,"%s",toJsonString(*self).c_str());
        return buffer;
    }
    
    
    btMatrix3x3 __add__(const btMatrix3x3& b){return *self + b;}
    btMatrix3x3 __sub__(const btMatrix3x3& b){return *self - b;}
    btMatrix3x3 __mul__(const btMatrix3x3& b){return *self * b;}
    btVector3 __mul__(const btVector3& b){return *self * b;}
    btMatrix3x3 __mul__(const btScalar& b){return *self * b;}
    const char *__concat__(const btMatrix3x3& b)
    {
        static char tmp[1024];
        sprintf(tmp,"btMatrix3x3(TODO)");
        std::string t1(tmp);
        
        sprintf(tmp,"btMatrix3x3(TODO)");
        std::string t2(tmp);
        
        return (t1 + t2).c_str();
    }
    bool __eq__(const btMatrix3x3& b){return *self == b;}
};

%extend btQuaternion
{
    const char *__str__()
    {
        static char buffer[1024];
        sprintf(buffer,"%s",toJsonString(*self).c_str());
        return buffer;
    }
    btQuaternion(const btQuaternion &rhs)
    {
        btQuaternion *v = new btQuaternion(rhs);
        return v;
    }
    
    btQuaternion __add__(const btQuaternion& b){return *self + b;}
    btQuaternion __sub__(const btQuaternion& b){return *self - b;}
    btQuaternion __mul__(const btQuaternion& b){return *self * b;}
    btQuaternion __mul__(const btVector3& b){return *self * b;}
    btQuaternion __mul__(const btScalar& b){return *self * b;}
    btQuaternion __div__(const btScalar& b){return *self / b;}
    
    const char *__concat__(const btQuaternion& b) {
        static char tmp[1024];
        sprintf(tmp,"btQuaternion(TODO)");
        std::string t1(tmp);
        
        sprintf(tmp,"btQuaternion(TODO)");
        std::string t2(tmp);
        
        return (t1 + t2).c_str();
    }
};

%extend btTransform
{
    const char *__str__()
    {
        static char buffer[1024];
        sprintf(buffer,"%s",toJsonString(*self).c_str());
        return buffer;
    }
    
    btVector3 __mul__(const btVector3& b){return *self * b;}
    btQuaternion __mul__(const btQuaternion& b){return *self * b;}
    btTransform __mul__(const btTransform& b){return *self * b;}
    bool __eq__(const btTransform& b){return *self == b;}
    
    const char *__concat__(const char *s) {
        static char tmp[1024];
        sprintf(tmp,"btTransform(TODO)");
        
        static std::string temp;
        std::string t1(tmp);
        std::string t2(s);
        
        temp = (t1 + t2);
        return temp.c_str();
    }
};

%extend btVector2
{
    const char *__str__()
    {
        static char buffer[1024];
        sprintf(buffer,"%s",toJsonString(*self).c_str());
        return buffer;
    }
    
    btVector2 __add__(const btVector2& b){return *self + b;}
    btVector2 __sub__(const btVector2& b){return *self - b;}
    btVector2 __mul__(const btVector2& b){return *self * b;}
    btVector2 __mul__(const btScalar& b){return *self * b;}
    btVector2 __div__(const btVector2& b){return *self / b;}
    btVector2 __div__(const btScalar& b){return *self / b;}
    btVector2 __neg__(){return -(*self);}
    
    const char *__concat__(const char *s) {
        static char tmp[1024];
        sprintf(tmp,"btVector2(%f,%f)", self->x(),self->y());
        
        static std::string temp;
        std::string t1(tmp);
        std::string t2(s);
        
        temp = (t1 + t2);
        return temp.c_str();
    }
    bool __eq__(const btVector2& b){return *self == b;}
    bool __lt__( btVector2& b){return *self < b;}
    bool __le__( btVector2& b){return *self <= b;}
};

%extend btVector3
{
    const char *__str__()
    {
        static char buffer[1024];
        sprintf(buffer,"%s",toJsonString(*self).c_str());
        return buffer;
    }
    btVector3(const btVector3 &rhs) {
        btVector3 *v = new btVector3(rhs);
        return v;
    }
    
    
    btVector3 __add__(const btVector3& b){return *self + b;}
    btVector3 __sub__(const btVector3& b){return *self - b;}
    btVector3 __mul__(const btVector3& b){return *self * b;}
    btVector3 __mul__(const btMatrix3x3& b){return *self * b;}
    btVector3 __mul__(const btScalar& b){return *self * b;}
    btQuaternion __mul__(const btQuaternion& b){return *self * b;}
    btVector3 __div__(const btVector3& b){return *self / b;}
    btVector3 __div__(const btScalar& b){return *self / b;}
    btVector3 __neg__(){return -(*self);}
    
    const char *__concat__(const char *s) {
        static char tmp[1024];
        sprintf(tmp,"btVector3(%f,%f,%f)", self->x(),self->y(),self->z());
        
        static std::string temp;
        std::string t1(tmp);
        std::string t2(s);
        
        temp = (t1 + t2);
        return temp.c_str();
    }
    
    bool __eq__(const btVector3& b){return *self == b;}
    bool __lt__( btVector3& b){return *self < b;}
    bool __le__( btVector3& b){return *self <= b;}
   
};

%extend btVector4
{
    const char *__str__()
    {
        static char buffer[1024];
        sprintf(buffer,"%s",toJsonString(*self).c_str());
        return buffer;
    }
    
    btVector4(const btVector4 &rhs)
    {
        btVector4 *v = new btVector4(rhs);
        return v;
    }
    
    const char *__concat__(const char *s) {
        static char tmp[1024];
        sprintf(tmp,"btVector4(%f,%f,%f,%f)", self->x(),self->y(),self->z(),self->w());
        
        static std::string temp;
        std::string t1(tmp);
        std::string t2(s);
        
        temp = (t1 + t2);
        return temp.c_str();
    }
    
    bool __eq__(const btVector4& b){return *self == b;}
    bool __lt__( btVector4& b){return *self < b;}
    bool __le__( btVector4& b){return *self <= b;}
};

%extend btManifoldPoint
{
    const char *__str__()
    {
        static char buffer[1024];
        sprintf(buffer,"%s",toJsonString(*self).c_str());
        return buffer;
    }
    
    const char *__concat__(const char *s) {
        static char tmp[1024];
        sprintf(tmp,"\
                Distance: %f\n\
                LifeTime: %d\n\
                PositionOnA btVector3(%f, %f, %f)\n\
                PositionOnB btVector3(%f, %f, %f)\n\
                Applied Impulse %f\n",
                self->getDistance(),
                self->getLifeTime(),
                self->getPositionWorldOnA().x(), self->getPositionWorldOnA().y(), self->getPositionWorldOnA().z(),
                self->getPositionWorldOnB().x(), self->getPositionWorldOnB().y(), self->getPositionWorldOnB().z(),
                self->getAppliedImpulse());
        
        static std::string temp;
        std::string t1(tmp);
        std::string t2(s);
        
        temp = (t1 + t2);
        return temp.c_str();
    }
}
