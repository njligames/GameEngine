//Lua interface file
/* File: Lua.i */

//#define SWIG_RUNTIME_VERSION
//#define SWIG_TYPE_TABLE "_JLIENGINE_"

%module njli

%import(module="bullet") "../../../bullet/bullet-2.82-r2704/src/btBulletDynamicsCommon.h"
%import(module="bullet") "../../../bullet/bullet-2.82-r2704/src/btPrint.h"

%include <lua/factory.i>
%include <lua/stl.i>
%include <lua/lua_fnptr.i>
%include <lua/typemaps.i>
%include <lua/carrays.i>

%include "AbstractBehavior.i"
%include "AbstractDecorator.i"
%include "AbstractFactoryObject.i"
%include "AbstractObject.i"
%include "AbstractState.i"
%include "AbstractStateMachine.i"
%include "jliarray.i"
%include "LuaTypemaps.i"
%include "../../../platform/Lua.i"


%ignore getChildrenNodes(std::vector<njli::Node*> &)const;
%ignore getParticleEmitters(std::vector<njli::ParticleEmitter*> &)const;
%ignore getSounds(std::vector<njli::Sound*> &)const;

%ignore getLevelOfDetails(std::vector<njli::LevelOfDetail*> &)const;

%ignore getParticleEmitters(std::vector<njli::ParticleEmitter*> &)const;
%ignore getClocks(std::vector<njli::Clock*> &)const;

%ignore operator std::string;
%ignore njli::PhysicsShapeBox::getPlane(btVector3 &,btVector3 &,int) const;



//%apply btVector3** OUTPUT {btVector3& aabbMin,btVector3& aabbMax};
//%apply btVector3** OUTPUT {Node *node,btVector3& aabbMin,btVector3& aabbMax};
//%apply btVector3** OUTPUT {btVector3* supportVerticesOut};
//%apply btVector3** OUTPUT {btVector3& inertia};
//%apply btVector3** OUTPUT {btVector3& planeNormal,btVector3& planeSupport};
//%apply btVector3** OUTPUT {btVector3& vtx};
//%apply btVector3** OUTPUT {btVector4& plane};
//%apply btVector3** OUTPUT {btVector3& pa,btVector3& pb};
//
//%apply btVector3** OUTPUT {btVector4& pixel};
//
//%apply btVector3** OUTPUT {btVector3 **vertices};
//%apply btVector3** OUTPUT {btVector4 **colorVertices};
//%apply btVector3** OUTPUT {btVector2 **textureCoordinates};
//

//
//%apply btMatrix3x3** OUTPUT {btMatrix3x3 &ascender, btMatrix3x3 &descender, btMatrix3x3 &lineh};





//%apply btMatrix3x3** OUTPUT {btMatrix3x3& floats};
//%apply btMatrix3x3** OUTPUT {btMatrix3x3 &dstx, btMatrix3x3 &dsty, btMatrix3x3 &xform};

//%apply btVector2** OUTPUT {btVector2 &dimensions,btVector2 &spritePivotPoint};
//%apply btVector2** OUTPUT {btVector2 &textureCoordOffset, btVector2 &textureCoordDimensions};
//%apply btVector4** OUTPUT {btVector4 &bottomLeft, btVector4 &bottomRight, btVector4 &topLeft, btVector4 &topRight};




%{
#undef SWIG_fail_arg
#define SWIG_fail_arg(func_name,argnum,type) \
{lua_Debug ar;\
lua_getstack(L, 1, &ar);\
lua_getinfo(L, "nSl", &ar);\
lua_pushfstring(L,"Error (%s:%d) in %s (arg %d), expected '%s' got '%s'",\
ar.source,ar.currentline,func_name,argnum,type,SWIG_Lua_typename(L,argnum));\
goto fail;}
    %}


//http://www.lua.org/manual/5.1/manual.html#lua_getinfo
%{
#undef SWIG_check_num_args
#define SWIG_check_num_args(func_name,a,b) \
if(LUA_WRAPPER_LOGGING){\
lua_Debug ar;\
lua_getstack(L, 1, &ar);\
lua_getinfo(L, "nSl", &ar);\
DEBUG_LOG_V("LUA_INTERFACE","(%s:%d) in %s",\
ar.short_src,ar.currentline,ar.name); \
}\
if (lua_gettop(L)<a || lua_gettop(L)>b) \
{SWIG_Lua_pushferrstring(L,"Error in %s expected %d..%d args, got %d",func_name,a,b,lua_gettop(L));\
goto fail;}
%}




%insert("runtime")

%{
#include "JLIEngine.h"
#include "btBulletDynamicsCommon.h"
#include "btPrint.h"
%}


//%newobject njli::Lua::create;
//%delobject njli::Lua::destroy;
//%factory(njli::Lua *njli::Lua::create, njli::Lua /*Add the children to the njli::Lua class*/);
//%factory(njli::Lua *njli::Lua::clone, njli::Lua /*Add the children to the njli::Lua class*/);
//%factory(njli::Lua *njli::Lua::copy, njli::Lua /*Add the children to the njli::Lua class*/);



#include "JLIEngine.h"













%array_functions(btVector2, btVector2Array);

//%jli_array_functions(njli::Lua, LuaArray);

%jli_array_functions(njli::Sound, SoundArray);
%jli_array_functions(njli::SoundBuilder, SoundBuilderArray);



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









//%extend njli::WorldPythonVirtualMachine
//{
//    const char *__concat__(const char *s) {
//        static std::string temp;
//        std::string t1(*self);
//        std::string t2(s);
//        
//        temp = (t1 + t2);
//        return temp.c_str();
//    }
//    
//    const char *__str__()
//    {
//        std::string s(*self);
//        static char tmp[1024];
//        sprintf(tmp, "%s", s.c_str());
//        return tmp;
//    }
//}








/*%extend njli::WorldFacebook
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
}*/





%extend njli::DeviceTouch
{
    const char *__concat__(const char *s) {
        
        std::string t1(*self);
        std::string t2(s);
        
        static std::string temp = (t1 + t2);
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










%extend njli::Rect
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



//%include "../../../bullet/Lua.i"
//%include "../../../platform/Lua.i"



