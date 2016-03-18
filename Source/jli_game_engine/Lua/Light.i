//Factory
%newobject njli::Light::create;
%delobject njli::Light::destroy;
%factory(njli::Light *njli::Light::create, njli::Light /*Add the children to the njli::Light class*/);
%factory(njli::Light *njli::Light::clone, njli::Light /*Add the children to the njli::Light class*/);
%factory(njli::Light *njli::Light::copy, njli::Light /*Add the children to the njli::Light class*/);

//Extend
%extend njli::Light
{
    const char *__concat__(const char *s) {
        static std::string temp;
        std::string t1(*self);
        std::string t2(s);
        
        temp = (t1 + t2);
        return temp.c_str();
    }
    
    const char *__str__()
    {
            std::string s(*self);
            static char tmp[1024];
            sprintf(tmp, "%s", s.c_str());
            return tmp;
    }
}
