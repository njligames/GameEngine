// ./LinearMath/btTransform.i

//Factory

//Extend
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
