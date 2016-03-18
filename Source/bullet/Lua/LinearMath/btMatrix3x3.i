// ./LinearMath/btMatrix3x3.i

//Factory

//Extend
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

