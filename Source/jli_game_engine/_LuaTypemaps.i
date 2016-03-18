%define SWIG_USERDATA_TYPEMAP(TYPE)
%typemap(in,checkfn="lua_isuserdata")     TYPE *INPUT($*1_ltype temp), TYPE &INPUT($*1_ltype temp)
%{ temp = *(($*1_ltype*)((swig_lua_userdata*)lua_touserdata(L,$input))->ptr);
    $1 = &temp; %}
%typemap(in, numinputs=0) TYPE **OUTPUT ($*1_ltype temp)
%{ $1 = &temp; %}
%typemap(argout) TYPE **OUTPUT
%{  SWIG_NewPointerObj(L,(void *) new $*1_ltype(*$1),$1_descriptor,0); SWIG_arg++;%}
%typemap(in) TYPE *INOUT = TYPE *INPUT;
%typemap(argout) TYPE *INOUT = TYPE **OUTPUT;
%typemap(in) TYPE &OUTPUT = TYPE **OUTPUT;
%typemap(argout) TYPE &OUTPUT = TYPE **OUTPUT;
%typemap(in) TYPE &INOUT = TYPE *INPUT;
%typemap(argout) TYPE &INOUT = TYPE **OUTPUT;
// const version (the $*1_ltype is the basic number without ptr or const's)
%typemap(in,checkfn="lua_isuserdata")     const TYPE *INPUT($*1_ltype temp)
%{ temp = *(($*1_ltype*)((swig_lua_userdata*)lua_touserdata(L,$input))->ptr);
    $1 = &temp; %}
%enddef












//SWIG_USERDATA_TYPEMAP(CubicTexture);
//SWIG_USERDATA_TYPEMAP(CubicTextureBuilder);





SWIG_USERDATA_TYPEMAP(GeometryBuilder);













SWIG_USERDATA_TYPEMAP(Lua);
SWIG_USERDATA_TYPEMAP(LuaBuilder);






















































































































SWIG_USERDATA_TYPEMAP(Sound);





















%define %_convert_dispatch(Type)
if (!dcast)
{
    Type *dobj = dynamic_cast<Type *>($1);
    if (dobj)
    {
        //%_convert_dispatch
        dcast = 1;
        SWIG_NewPointerObj(L, dobj, $descriptor(Type *), $owner);
        SWIG_arg++;
    }
}%enddef

%define %convert(Method,Types...)
%typemap(out) Method
{
    int dcast = 0;
    %formacro(%_convert_dispatch, Types)
    if (!dcast)
    {
        //%convert
        
        SWIG_NewPointerObj(L, $1, $descriptor, $owner);
        SWIG_arg++;
    }
}%enddef




//*********************
// Helper function for %downcast, to be called for each target type
%define %_downcast(Type)
if (dcast==0 && $1)
{
    %ptr(Type) out = %dynptrcast(Type,$1);
    if (out)
    {
        dcast=1;
        %set_output(SWIG_NewPointerObj(new %ptr(Type) out),
                    descriptor(%ptr(Type)*), SWIG_POINTER_OWN));
    }
}
%enddef

%define %downcast(typemaptarget, Types...)
%typemap(out) typemaptarget {
    int dcast = 0;
    %formacro(%_downcast, Types)
    if (!dcast)
        SWIG_exception_fail(SWIG_TypeError,"Can't convert type");
        }
%enddef





