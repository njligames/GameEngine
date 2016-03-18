//Factory
%newobject njli::SceneStateBuilder::create;
%delobject njli::SceneStateBuilder::destroy;
%factory(njli::SceneStateBuilder *njli::SceneStateBuilder::create, njli::SceneStateBuilder /*Add the children to the njli::SceneStateBuilder class*/);
%factory(njli::SceneStateBuilder *njli::SceneStateBuilder::clone, njli::SceneStateBuilder /*Add the children to the njli::SceneStateBuilder class*/);
%factory(njli::SceneStateBuilder *njli::SceneStateBuilder::copy, njli::SceneStateBuilder /*Add the children to the njli::SceneStateBuilder class*/);


//Extend
%extend njli::SceneStateBuilder
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