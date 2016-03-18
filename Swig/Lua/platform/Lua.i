//Lua interface file

%ignore operator std::string;

%{
    #include "File.h"
//    #include "Util.h"
    #include "Localization.h"
    
    #include "WorldSound.h"
    #include "WorldInput.h"
    
    #include "Sound.h"
    #include "DeviceTouch.h"
%}

%newobject njli::Sound::create;
%delobject njli::Sound::destroy;
%factory(njli::Sound *njli::Sound::create, njli::Sound /*Add the children to the njli::Sound class*/);
%factory(njli::Sound *njli::Sound::clone, njli::Sound /*Add the children to the njli::Sound class*/);
%factory(njli::Sound *njli::Sound::copy, njli::Sound /*Add the children to the njli::Sound class*/);

#include "File.h"
//#include "Util.h"
#include "Localization.h"

#include "WorldSound.h"
#include "WorldInput.h"

#include "Sound.h"
#include "DeviceTouch.h"

%array_functions(njli::DeviceTouch, DeviceTouchArray);

%array_functions(s8, s8Array);
%array_functions(u8, u8Array);
%array_functions(s16, s16Array);
%array_functions(u16, u16Array);
%array_functions(s32, s32Array);
%array_functions(u32, u32Array);
%array_functions(s64, s64Array);
%array_functions(u64, u64Array);
%array_functions(f32, f32Array);
%array_functions(f64, f64Array);

%extend njli::WorldSound
{
    const char *__str__()
    {
        std::string s(*self);
        static char tmp[1024];
        sprintf(tmp, "%s", s.c_str());
        return tmp;
    }
}

%extend njli::WorldInput
{
    const char *__str__()
    {
        std::string s(*self);
        static char tmp[1024];
        sprintf(tmp, "%s", s.c_str());
        return tmp;
    }
}

%extend njli::Sound
{
    const char *__str__()
    {
        std::string s(*self);
        static char tmp[1024];
        sprintf(tmp, "%s", s.c_str());
        return tmp;
    }
}

%extend njli::DeviceTouch
{
    const char *__str__()
    {
        std::string s(*self);
        static char tmp[1024];
        sprintf(tmp,"%s", s.c_str());
        return tmp;
    }
};