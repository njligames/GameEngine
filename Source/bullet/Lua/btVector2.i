// ./btVector2.i

//Factory

//Extend
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

