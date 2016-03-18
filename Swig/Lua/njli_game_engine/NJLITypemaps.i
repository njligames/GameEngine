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

SWIG_USERDATA_TYPEMAP(Action);
SWIG_USERDATA_TYPEMAP(ActionBuilder);

SWIG_USERDATA_TYPEMAP(Camera);
SWIG_USERDATA_TYPEMAP(CameraBuilder);

SWIG_USERDATA_TYPEMAP(Clock);
SWIG_USERDATA_TYPEMAP(ClockBuilder);

SWIG_USERDATA_TYPEMAP(CollisionResponse);
SWIG_USERDATA_TYPEMAP(CollisionResponseBuilder);

//SWIG_USERDATA_TYPEMAP(CubicTexture);
//SWIG_USERDATA_TYPEMAP(CubicTextureBuilder);

SWIG_USERDATA_TYPEMAP(Font);
SWIG_USERDATA_TYPEMAP(FontBuilder);

SWIG_USERDATA_TYPEMAP(Geometry);
SWIG_USERDATA_TYPEMAP(GeometryBuilder);

SWIG_USERDATA_TYPEMAP(Image);
SWIG_USERDATA_TYPEMAP(ImageBuilder);

SWIG_USERDATA_TYPEMAP(JsonJLI);
SWIG_USERDATA_TYPEMAP(JsonJLIBuilder);

SWIG_USERDATA_TYPEMAP(Light);
SWIG_USERDATA_TYPEMAP(LightBuilder);

SWIG_USERDATA_TYPEMAP(LevelOfDetail);
SWIG_USERDATA_TYPEMAP(LevelOfDetailBuilder);

SWIG_USERDATA_TYPEMAP(Lua);
SWIG_USERDATA_TYPEMAP(LuaBuilder);

SWIG_USERDATA_TYPEMAP(Material);
SWIG_USERDATA_TYPEMAP(MaterialBuilder);

SWIG_USERDATA_TYPEMAP(MaterialProperty);
SWIG_USERDATA_TYPEMAP(MaterialPropertyBuilder);

SWIG_USERDATA_TYPEMAP(Node);
SWIG_USERDATA_TYPEMAP(NodeBuilder);

SWIG_USERDATA_TYPEMAP(NodeState);
SWIG_USERDATA_TYPEMAP(NodeStateBuilder);

SWIG_USERDATA_TYPEMAP(NodeStateMachine);
SWIG_USERDATA_TYPEMAP(NodeStateMachineBuilder);

SWIG_USERDATA_TYPEMAP(ParticleEmitter);
SWIG_USERDATA_TYPEMAP(ParticleEmitterBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsBodyGhost);
SWIG_USERDATA_TYPEMAP(PhysicsBodyGhostBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsBodyRigid);
SWIG_USERDATA_TYPEMAP(PhysicsBodyRigidBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsBodySoft);
SWIG_USERDATA_TYPEMAP(PhysicsBodySoftBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsConstraint);
SWIG_USERDATA_TYPEMAP(PhysicsConstraintBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsConstraintHinge);
SWIG_USERDATA_TYPEMAP(PhysicsConstraintHingeBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsConstraintPointToPoint);
SWIG_USERDATA_TYPEMAP(PhysicsConstraintPointToPointBuilder);


SWIG_USERDATA_TYPEMAP(PhysicsConstraintSlider);
SWIG_USERDATA_TYPEMAP(PhysicsConstraintSliderBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsConstraintConeTwist);
SWIG_USERDATA_TYPEMAP(PhysicsConstraintConeTwistBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsConstraintFixed);
SWIG_USERDATA_TYPEMAP(PhysicsConstraintFixedBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsConstraintGeneric6Dof);
SWIG_USERDATA_TYPEMAP(PhysicsConstraintGeneric6DofBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsConstraintGeneric6DofSpring);
SWIG_USERDATA_TYPEMAP(PhysicsConstraintGeneric6DofSpringBuilder);






SWIG_USERDATA_TYPEMAP(PhysicsCloseContact);
SWIG_USERDATA_TYPEMAP(PhysicsCloseContactBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsContact);
SWIG_USERDATA_TYPEMAP(PhysicsContactBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsField);
SWIG_USERDATA_TYPEMAP(PhysicsFieldBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsRayContact);
SWIG_USERDATA_TYPEMAP(PhysicsRayContactBuilder);

SWIG_USERDATA_TYPEMAP(PhysicsShapeBox);
SWIG_USERDATA_TYPEMAP(PhysicsShapeBoxBuilder);



SWIG_USERDATA_TYPEMAP(PhysicsShapeSphere);
SWIG_USERDATA_TYPEMAP(PhysicsShapeSphereBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeCylinder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeCylinderBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeCapsule);
SWIG_USERDATA_TYPEMAP(PhysicsShapeCapsuleBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeCone);
SWIG_USERDATA_TYPEMAP(PhysicsShapeConeBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeMultiSphere);
SWIG_USERDATA_TYPEMAP(PhysicsShapeMultiSphereBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeConvexHull);
SWIG_USERDATA_TYPEMAP(PhysicsShapeConvexHullBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeConvexTriangleMesh);
SWIG_USERDATA_TYPEMAP(PhysicsShapeConvexTriangleMeshBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeBvhTriangleMesh);
SWIG_USERDATA_TYPEMAP(PhysicsShapeBvhTriangleMeshBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeHeightfieldTerrain);
SWIG_USERDATA_TYPEMAP(PhysicsShapeHeightfieldTerrainBuilder);
SWIG_USERDATA_TYPEMAP(PhysicsShapeStaticPlane);
SWIG_USERDATA_TYPEMAP(PhysicsShapeStaticPlaneBuilder);


SWIG_USERDATA_TYPEMAP(PhysicsWorld);
SWIG_USERDATA_TYPEMAP(PhysicsWorldBuilder);

SWIG_USERDATA_TYPEMAP(Plane);
SWIG_USERDATA_TYPEMAP(PlaneBuilder);

SWIG_USERDATA_TYPEMAP(Scene);
SWIG_USERDATA_TYPEMAP(SceneBuilder);

SWIG_USERDATA_TYPEMAP(SceneState);
SWIG_USERDATA_TYPEMAP(SceneStateBuilder);

SWIG_USERDATA_TYPEMAP(SceneStateMachine);
SWIG_USERDATA_TYPEMAP(SceneStateMachineBuilder);

SWIG_USERDATA_TYPEMAP(ShaderProgram);
SWIG_USERDATA_TYPEMAP(ShaderProgramBuilder);

SWIG_USERDATA_TYPEMAP(Skinner);
SWIG_USERDATA_TYPEMAP(SkinnerBuilder);

SWIG_USERDATA_TYPEMAP(Sound);
SWIG_USERDATA_TYPEMAP(SoundBuilder);

SWIG_USERDATA_TYPEMAP(StopWatch);
SWIG_USERDATA_TYPEMAP(StopWatchBuilder);

SWIG_USERDATA_TYPEMAP(Timer);
SWIG_USERDATA_TYPEMAP(TimerBuilder);

SWIG_USERDATA_TYPEMAP(WorldState);
SWIG_USERDATA_TYPEMAP(WorldStateBuilder);

SWIG_USERDATA_TYPEMAP(WorldStateMachine);
SWIG_USERDATA_TYPEMAP(WorldStateMachineBuilder);

SWIG_USERDATA_TYPEMAP(Xml);
SWIG_USERDATA_TYPEMAP(XmlBuilder);





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




%downcast(jli::Geometry,jli::Sprite2D,jli::Plane,jli::Geometry);
