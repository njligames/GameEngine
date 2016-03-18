// ./LinearMath/btQuaternion.i

//Factory

//Extend
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

