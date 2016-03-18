//Lua interface file
/* File: Lua.i */

//#define SWIG_RUNTIME_VERSION
//#define SWIG_TYPE_TABLE "_JLIENGINE_"

%module njli

%include <lua/factory.i>
%include <lua/stl.i>
%include <lua/lua_fnptr.i>
%include <lua/typemaps.i>
%include <lua/carrays.i>

%include "NJLILuaTypemaps.i"

%include "../bullet/Lua.i"
%include "../platform/Lua.i"

%import "AbstractBehavior.i"
%import "AbstractDecorator.i"
%import "AbstractFactoryObject.i"
%import "AbstractObject.i"
%import "AbstractState.i"
%import "AbstractStateMachine.i"
%import "NJLIArray.i"

%ignore getChildrenNodes(std::vector<njli::Node*> &)const;
%ignore getParticleEmitters(std::vector<njli::ParticleEmitter*> &)const;
%ignore getSounds(std::vector<njli::Sound*> &)const;

%ignore getLevelOfDetails(std::vector<njli::LevelOfDetail*> &)const;

%ignore getParticleEmitters(std::vector<njli::ParticleEmitter*> &)const;
%ignore getClocks(std::vector<njli::Clock*> &)const;

%ignore operator std::string;
%ignore njli::PhysicsShapeBox::getPlane(btVector3 &,btVector3 &,int) const;

%template(NodeState_Lua)  njli::AbstractState< njli::Node >;
%template(NodeStateMachine_Lua) njli::AbstractStateMachine< njli::Node >;

%template(SceneState_Lua)  njli::AbstractState< njli::Scene >;
%template(SceneStateMachine_Lua) njli::AbstractStateMachine< njli::Scene >;

%template(WorldState_Lua)  njli::AbstractState< void >;
%template(WorldStateMachine_Lua) njli::AbstractStateMachine< void >;

%apply btVector3** OUTPUT {btVector3& aabbMin,btVector3& aabbMax};
%apply btVector3** OUTPUT {Node *node,btVector3& aabbMin,btVector3& aabbMax};
%apply btVector3** OUTPUT {btVector3* supportVerticesOut};
%apply btVector3** OUTPUT {btVector3& inertia};
%apply btVector3** OUTPUT {btVector3& planeNormal,btVector3& planeSupport};
%apply btVector3** OUTPUT {btVector3& vtx};
%apply btVector3** OUTPUT {btVector4& plane};
%apply btVector3** OUTPUT {btVector3& pa,btVector3& pb};

%apply btVector3** OUTPUT {btVector4& pixel};

%apply btVector3** OUTPUT {btVector3 **vertices};
%apply btVector3** OUTPUT {btVector4 **colorVertices};
%apply btVector3** OUTPUT {btVector2 **textureCoordinates};

%apply s32* OUTPUT {s32  &w, s32 &h};

%apply btMatrix3x3** OUTPUT {btMatrix3x3 &ascender, btMatrix3x3 &descender, btMatrix3x3 &lineh};



%template(btAlignedObjectArray_JLIGlyphPosition)  btAlignedObjectArray<njli::JLIGlyphPosition>;
%template(btAlignedObjectArray_JLITextRow)  btAlignedObjectArray<njli::JLITextRow>;

%apply btMatrix3x3** OUTPUT {btMatrix3x3& floats};
%apply btMatrix3x3** OUTPUT {btMatrix3x3 &dstx, btMatrix3x3 &dsty, btMatrix3x3 &xform};

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
//    #include "../../Source/jli_game_engine/version-1.0/src/JLIEngine.h"
    #include "JLIEngine.h"
%}

%newobject njli::Action::create;
%delobject njli::Action::destroy;
%factory(njli::Action *njli::Action::create, njli::Action /*Add the children to the Action class*/);
%factory(njli::Action *njli::Action::clone, njli::Action /*Add the children to the Action class*/);
%factory(njli::Action *njli::Action::copy, njli::Action /*Add the children to the Action class*/);

%newobject njli::ActionBuilder::create;
%delobject njli::ActionBuilder::destroy;
%factory(njli::ActionBuilder *njli::ActionBuilder::create, njli::ActionBuilder /*Add the children to the njli::ActionBuilder class*/);
%factory(njli::ActionBuilder *njli::ActionBuilder::clone, njli::ActionBuilder /*Add the children to the njli::ActionBuilder class*/);
%factory(njli::ActionBuilder *njli::ActionBuilder::copy, njli::ActionBuilder /*Add the children to the njli::ActionBuilder class*/);

%newobject njli::ButtonHUD::create;
%delobject njli::ButtonHUD::destroy;
%factory(njli::ButtonHUD *njli::ButtonHUD::create, njli::ButtonHUD /*Add the children to the ButtonHUD class*/);
%factory(njli::ButtonHUD *njli::ButtonHUD::clone, njli::ButtonHUD /*Add the children to the ButtonHUD class*/);
%factory(njli::ButtonHUD *njli::ButtonHUD::copy, njli::ButtonHUD /*Add the children to the ButtonHUD class*/);

%newobject njli::ButtonHUDBuilder::create;
%delobject njli::ButtonHUDBuilder::destroy;
%factory(njli::ButtonHUDBuilder *njli::ButtonHUDBuilder::create, njli::ButtonHUDBuilder /*Add the children to the ButtonHUDBuilder class*/);
%factory(njli::ButtonHUDBuilder *njli::ButtonHUDBuilder::clone, njli::ButtonHUDBuilder /*Add the children to the ButtonHUDBuilder class*/);
%factory(njli::ButtonHUDBuilder *njli::ButtonHUDBuilder::copy, njli::ButtonHUDBuilder /*Add the children to the ButtonHUDBuilder class*/);

%newobject njli::Camera::create;
%delobject njli::Camera::destroy;
%factory(njli::Camera *njli::Camera::create, njli::Camera /*Add the children to the njli::Camera class*/);
%factory(njli::Camera *njli::Camera::clone, njli::Camera /*Add the children to the njli::Camera class*/);
%factory(njli::Camera *njli::Camera::copy, njli::Camera /*Add the children to the njli::Camera class*/);

%newobject njli::CameraBuilder::create;
%delobject njli::CameraBuilder::destroy;
%factory(njli::CameraBuilder *njli::CameraBuilder::create, njli::CameraBuilder /*Add the children to the njli::CameraBuilder class*/);
%factory(njli::CameraBuilder *njli::CameraBuilder::clone, njli::CameraBuilder /*Add the children to the njli::CameraBuilder class*/);
%factory(njli::CameraBuilder *njli::CameraBuilder::copy, njli::CameraBuilder /*Add the children to the njli::CameraBuilder class*/);

%newobject njli::CheckboxHUD::create;
%delobject njli::CheckboxHUD::destroy;
%factory(njli::CheckboxHUD *njli::CheckboxHUD::create, njli::CheckboxHUD /*Add the children to the CheckboxHUD class*/);
%factory(njli::CheckboxHUD *njli::CheckboxHUD::clone, njli::CheckboxHUD /*Add the children to the CheckboxHUD class*/);
%factory(njli::CheckboxHUD *njli::CheckboxHUD::copy, njli::CheckboxHUD /*Add the children to the CheckboxHUD class*/);

%newobject njli::CheckboxHUDBuilder::create;
%delobject njli::CheckboxHUDBuilder::destroy;
%factory(njli::CheckboxHUDBuilder *njli::CheckboxHUDBuilder::create, njli::CheckboxHUDBuilder /*Add the children to the CheckboxHUDBuilder class*/);
%factory(njli::CheckboxHUDBuilder *njli::CheckboxHUDBuilder::clone, njli::CheckboxHUDBuilder /*Add the children to the CheckboxHUDBuilder class*/);
%factory(njli::CheckboxHUDBuilder *njli::CheckboxHUDBuilder::copy, njli::CheckboxHUDBuilder /*Add the children to the CheckboxHUDBuilder class*/);

%newobject njli::Clock::create;
%delobject njli::Clock::destroy;
%factory(njli::Clock *njli::Clock::create, njli::Clock /*Add the children to the njli::Clock class*/);
%factory(njli::Clock *njli::Clock::clone, njli::Clock /*Add the children to the njli::Clock class*/);
%factory(njli::Clock *njli::Clock::copy, njli::Clock /*Add the children to the njli::Clock class*/);

%newobject njli::ClockBuilder::create;
%delobject njli::ClockBuilder::destroy;
%factory(njli::ClockBuilder *njli::ClockBuilder::create, njli::ClockBuilder /*Add the children to the njli::ClockBuilder class*/);
%factory(njli::ClockBuilder *njli::ClockBuilder::clone, njli::ClockBuilder /*Add the children to the njli::ClockBuilder class*/);
%factory(njli::ClockBuilder *njli::ClockBuilder::copy, njli::ClockBuilder /*Add the children to the njli::ClockBuilder class*/);

%newobject njli::CollisionResponse::create;
%delobject njli::CollisionResponse::destroy;
%factory(njli::CollisionResponse *njli::CollisionResponse::create, njli::CollisionResponse /*Add the children to the njli::CollisionResponse class*/);
%factory(njli::CollisionResponse *njli::CollisionResponse::clone, njli::CollisionResponse /*Add the children to the njli::CollisionResponse class*/);
%factory(njli::CollisionResponse *njli::CollisionResponse::copy, njli::CollisionResponse /*Add the children to the njli::CollisionResponse class*/);

%newobject njli::CollisionResponseBuilder::create;
%delobject njli::CollisionResponseBuilder::destroy;
%factory(njli::CollisionResponseBuilder *njli::CollisionResponseBuilder::create, njli::CollisionResponseBuilder /*Add the children to the njli::CollisionResponseBuilder class*/);
%factory(njli::CollisionResponseBuilder *njli::CollisionResponseBuilder::clone, njli::CollisionResponseBuilder /*Add the children to the njli::CollisionResponseBuilder class*/);
%factory(njli::CollisionResponseBuilder *njli::CollisionResponseBuilder::copy, njli::CollisionResponseBuilder /*Add the children to the njli::CollisionResponseBuilder class*/);

%newobject njli::Cube::create;
%delobject njli::Cube::destroy;
%factory(njli::Cube *njli::Cube::create, njli::Cube /*Add the children to the njli::Cube class*/);
%factory(njli::Cube *njli::Cube::clone, njli::Cube /*Add the children to the njli::Cube class*/);
%factory(njli::Cube *njli::Cube::copy, njli::Cube /*Add the children to the njli::Cube class*/);

%newobject njli::CubeBuilder::create;
%delobject njli::CubeBuilder::destroy;
%factory(njli::CubeBuilder *njli::CubeBuilder::create, njli::CubeBuilder /*Add the children to the njli::CubeBuilder class*/);
%factory(njli::CubeBuilder *njli::CubeBuilder::clone, njli::CubeBuilder /*Add the children to the njli::CubeBuilder class*/);
%factory(njli::CubeBuilder *njli::CubeBuilder::copy, njli::CubeBuilder /*Add the children to the njli::CubeBuilder class*/);

%newobject njli::DropdownHUD::create;
%delobject njli::DropdownHUD::destroy;
%factory(njli::DropdownHUD *njli::DropdownHUD::create, njli::DropdownHUD /*Add the children to the DropdownHUD class*/);
%factory(njli::DropdownHUD *njli::DropdownHUD::clone, njli::DropdownHUD /*Add the children to the DropdownHUD class*/);
%factory(njli::DropdownHUD *njli::DropdownHUD::copy, njli::DropdownHUD /*Add the children to the DropdownHUD class*/);

%newobject njli::DropdownHUDBuilder::create;
%delobject njli::DropdownHUDBuilder::destroy;
%factory(njli::DropdownHUDBuilder *njli::DropdownHUDBuilder::create, njli::DropdownHUDBuilder /*Add the children to the DropdownHUDBuilder class*/);
%factory(njli::DropdownHUDBuilder *njli::DropdownHUDBuilder::clone, njli::DropdownHUDBuilder /*Add the children to the DropdownHUDBuilder class*/);
%factory(njli::DropdownHUDBuilder *njli::DropdownHUDBuilder::copy, njli::DropdownHUDBuilder /*Add the children to the DropdownHUDBuilder class*/);

%newobject njli::Font::create;
%delobject njli::Font::destroy;
%factory(njli::Font *njli::Font::create, njli::Font /*Add the children to the njli::Font class*/);
%factory(njli::Font *njli::Font::clone, njli::Font /*Add the children to the njli::Font class*/);
%factory(njli::Font *njli::Font::copy, njli::Font /*Add the children to the njli::Font class*/);

%newobject njli::FontBuilder::create;
%delobject njli::FontBuilder::destroy;
%factory(njli::FontBuilder *njli::FontBuilder::create, njli::FontBuilder /*Add the children to the njli::FontBuilder class*/);
%factory(njli::FontBuilder *njli::FontBuilder::clone, njli::FontBuilder /*Add the children to the njli::FontBuilder class*/);
%factory(njli::FontBuilder *njli::FontBuilder::copy, njli::FontBuilder /*Add the children to the njli::FontBuilder class*/);

%newobject njli::Geometry::create;
%delobject njli::Geometry::destroy;
%factory(njli::Geometry *njli::Geometry::create, njli::Geometry, njli::Sprite2D, njli::Cube, njli::Plane /*Add the children to the njli::Geometry class*/);
%convert(njli::Material *njli::Geometry::getMaterial, njli::Material);
%convert(njli::ShaderProgram *njli::Geometry::getShaderProgram, njli::ShaderProgram);

%newobject njli::Image::create;
%newobject njli::Image::createSubImage;
%delobject njli::Image::destroy;
%factory(njli::Image *njli::Image::create, njli::Image /*Add the children to the njli::Image class*/);
%factory(njli::Image *njli::Image::createSubImage, njli::Image /*Add the children to the njli::Image class*/);
%factory(njli::Image *njli::Image::clone, njli::Image /*Add the children to the njli::Image class*/);
%factory(njli::Image *njli::Image::copy, njli::Image /*Add the children to the njli::Image class*/);

%newobject njli::ImageBuilder::create;
%delobject njli::ImageBuilder::destroy;
%factory(njli::ImageBuilder *njli::ImageBuilder::create, njli::ImageBuilder /*Add the children to the njli::ImageBuilder class*/);
%factory(njli::ImageBuilder *njli::ImageBuilder::clone, njli::ImageBuilder /*Add the children to the njli::ImageBuilder class*/);
%factory(njli::ImageBuilder *njli::ImageBuilder::copy, njli::ImageBuilder /*Add the children to the njli::ImageBuilder class*/);

%newobject njli::JsonJLI::create;
%delobject njli::JsonJLI::destroy;
%factory(njli::JsonJLI *njli::JsonJLI::create, njli::JsonJLI /*Add the children to the njli::JsonJLI class*/);
%factory(njli::JsonJLI *njli::JsonJLI::clone, njli::JsonJLI /*Add the children to the njli::JsonJLI class*/);
%factory(njli::JsonJLI *njli::JsonJLI::copy, njli::JsonJLI /*Add the children to the njli::JsonJLI class*/);

%newobject njli::JsonJLIBuilder::create;
%delobject njli::JsonJLIBuilder::destroy;
%factory(njli::JsonJLIBuilder *njli::JsonJLIBuilder::create, njli::JsonJLIBuilder /*Add the children to the njli::JsonJLIBuilder class*/);
%factory(njli::JsonJLIBuilder *njli::JsonJLIBuilder::clone, njli::JsonJLIBuilder /*Add the children to the njli::JsonJLIBuilder class*/);
%factory(njli::JsonJLIBuilder *njli::JsonJLIBuilder::copy, njli::JsonJLIBuilder /*Add the children to the njli::JsonJLIBuilder class*/);

%newobject njli::LabelHUD::create;
%delobject njli::LabelHUD::destroy;
%factory(njli::LabelHUD *njli::LabelHUD::create, njli::LabelHUD /*Add the children to the LabelHUD class*/);
%factory(njli::LabelHUD *njli::LabelHUD::clone, njli::LabelHUD /*Add the children to the LabelHUD class*/);
%factory(njli::LabelHUD *njli::LabelHUD::copy, njli::LabelHUD /*Add the children to the LabelHUD class*/);

%newobject njli::LabelHUDBuilder::create;
%delobject njli::LabelHUDBuilder::destroy;
%factory(njli::LabelHUDBuilder *njli::LabelHUDBuilder::create, njli::LabelHUDBuilder /*Add the children to the LabelHUDBuilder class*/);
%factory(njli::LabelHUDBuilder *njli::LabelHUDBuilder::clone, njli::LabelHUDBuilder /*Add the children to the LabelHUDBuilder class*/);
%factory(njli::LabelHUDBuilder *njli::LabelHUDBuilder::copy, njli::LabelHUDBuilder /*Add the children to the LabelHUDBuilder class*/);

%newobject njli::LevelOfDetail::create;
%delobject njli::LevelOfDetail::destroy;
%factory(njli::LevelOfDetail *njli::LevelOfDetail::create, njli::LevelOfDetail /*Add the children to the njli::LevelOfDetail class*/);
%factory(njli::LevelOfDetail *njli::LevelOfDetail::clone, njli::LevelOfDetail /*Add the children to the njli::LevelOfDetail class*/);
%factory(njli::LevelOfDetail *njli::LevelOfDetail::copy, njli::LevelOfDetail /*Add the children to the njli::LevelOfDetail class*/);

%newobject njli::LevelOfDetailBuilder::create;
%delobject njli::LevelOfDetailBuilder::destroy;
%factory(njli::LevelOfDetailBuilder *njli::LevelOfDetailBuilder::create, njli::LevelOfDetailBuilder /*Add the children to the njli::LevelOfDetailBuilder class*/);
%factory(njli::LevelOfDetailBuilder *njli::LevelOfDetailBuilder::clone, njli::LevelOfDetailBuilder /*Add the children to the njli::LevelOfDetailBuilder class*/);
%factory(njli::LevelOfDetailBuilder *njli::LevelOfDetailBuilder::copy, njli::LevelOfDetailBuilder /*Add the children to the njli::LevelOfDetailBuilder class*/);

%newobject njli::Light::create;
%delobject njli::Light::destroy;
%factory(njli::Light *njli::Light::create, njli::Light /*Add the children to the njli::Light class*/);
%factory(njli::Light *njli::Light::clone, njli::Light /*Add the children to the njli::Light class*/);
%factory(njli::Light *njli::Light::copy, njli::Light /*Add the children to the njli::Light class*/);

%newobject njli::LightBuilder::create;
%delobject njli::LightBuilder::destroy;
%factory(njli::LightBuilder *njli::LightBuilder::create, njli::LightBuilder /*Add the children to the njli::LightBuilder class*/);
%factory(njli::LightBuilder *njli::LightBuilder::clone, njli::LightBuilder /*Add the children to the njli::LightBuilder class*/);
%factory(njli::LightBuilder *njli::LightBuilder::copy, njli::LightBuilder /*Add the children to the njli::LightBuilder class*/);

%newobject njli::Lua::create;
%delobject njli::Lua::destroy;
%factory(njli::Lua *njli::Lua::create, njli::Lua /*Add the children to the njli::Lua class*/);
%factory(njli::Lua *njli::Lua::clone, njli::Lua /*Add the children to the njli::Lua class*/);
%factory(njli::Lua *njli::Lua::copy, njli::Lua /*Add the children to the njli::Lua class*/);

%newobject njli::LuaBuilder::create;
%delobject njli::LuaBuilder::destroy;
%factory(njli::LuaBuilder *njli::LuaBuilder::create, njli::LuaBuilder /*Add the children to the njli::LuaBuilder class*/);
%factory(njli::LuaBuilder *njli::LuaBuilder::clone, njli::LuaBuilder /*Add the children to the njli::LuaBuilder class*/);
%factory(njli::LuaBuilder *njli::LuaBuilder::copy, njli::LuaBuilder /*Add the children to the njli::LuaBuilder class*/);

%newobject njli::Material::create;
%delobject njli::Material::destroy;
%factory(njli::Material *njli::Material::create, njli::Material /*Add the children to the njli::Material class*/);
%factory(njli::Material *njli::Material::clone, njli::Material /*Add the children to the njli::Material class*/);
%factory(njli::Material *njli::Material::copy, njli::Material /*Add the children to the njli::Material class*/);

%newobject njli::MaterialBuilder::create;
%delobject njli::MaterialBuilder::destroy;
%factory(njli::MaterialBuilder *njli::MaterialBuilder::create, njli::MaterialBuilder /*Add the children to the njli::MaterialBuilder class*/);
%factory(njli::MaterialBuilder *njli::MaterialBuilder::clone, njli::MaterialBuilder /*Add the children to the njli::MaterialBuilder class*/);
%factory(njli::MaterialBuilder *njli::MaterialBuilder::copy, njli::MaterialBuilder /*Add the children to the njli::MaterialBuilder class*/);

%newobject njli::MaterialProperty::create;
%delobject njli::MaterialProperty::destroy;
%factory(njli::MaterialProperty *njli::MaterialProperty::create, njli::MaterialProperty /*Add the children to the njli::MaterialProperty class*/);
%factory(njli::MaterialProperty *njli::MaterialProperty::clone, njli::MaterialProperty /*Add the children to the njli::MaterialProperty class*/);
%factory(njli::MaterialProperty *njli::MaterialProperty::copy, njli::MaterialProperty /*Add the children to the njli::MaterialProperty class*/);

%newobject njli::MaterialPropertyBuilder::create;
%delobject njli::MaterialPropertyBuilder::destroy;
%factory(njli::MaterialPropertyBuilder *njli::MaterialPropertyBuilder::create, njli::MaterialPropertyBuilder /*Add the children to the njli::MaterialPropertyBuilder class*/);
%factory(njli::MaterialPropertyBuilder *njli::MaterialPropertyBuilder::clone, njli::MaterialPropertyBuilder /*Add the children to the njli::MaterialPropertyBuilder class*/);
%factory(njli::MaterialPropertyBuilder *njli::MaterialPropertyBuilder::copy, njli::MaterialPropertyBuilder /*Add the children to the njli::MaterialPropertyBuilder class*/);

%newobject njli::Node::create;
%delobject njli::Node::destroy;
%factory(njli::Node *njli::Node::create, njli::Node /*Add the children to the njli::Node class*/);
%factory(njli::Node *njli::Node::clone, njli::Node /*Add the children to the njli::Node class*/);
%factory(njli::Node *njli::Node::copy, njli::Node /*Add the children to the njli::Node class*/);
%convert(njli::Geometry *njli::Node::getGeometry, njli::Sprite2D, njli::Cube, njli::Plane, njli::Geometry);
%convert(njli::NodeStateMachine *njli::Node::getStateMachine, njli::NodeStateMachine);
%convert(njli::Camera *njli::Node::getCamera, njli::Camera);
%convert(njli::Light *njli::Node::getLight, njli::Light);
%convert(njli::PhysicsBody *njli::Node::getPhysicsBody, njli::PhysicsBodyRigid, njli::PhysicsBodyGhost, njli::PhysicsBodySoft);
%convert(njli::PhysicsField *njli::Node::getPhysicsField, njli::PhysicsField);

%newobject njli::NodeBuilder::create;
%delobject njli::NodeBuilder::destroy;
%factory(njli::NodeBuilder *njli::NodeBuilder::create, njli::NodeBuilder /*Add the children to the njli::NodeBuilder class*/);
%factory(njli::NodeBuilder *njli::NodeBuilder::clone, njli::NodeBuilder /*Add the children to the njli::NodeBuilder class*/);
%factory(njli::NodeBuilder *njli::NodeBuilder::copy, njli::NodeBuilder /*Add the children to the njli::NodeBuilder class*/);

%newobject njli::NodeState::create;
%delobject njli::NodeState::destroy;
%factory(njli::NodeState *njli::NodeState::create, njli::NodeState /*Add the children to the njli::NodeState class*/);
%factory(njli::NodeState *njli::NodeState::clone, njli::NodeState /*Add the children to the njli::NodeState class*/);
%factory(njli::NodeState *njli::NodeState::copy, njli::NodeState /*Add the children to the njli::NodeState class*/);

%newobject njli::NodeStateBuilder::create;
%delobject njli::NodeStateBuilder::destroy;
%factory(njli::NodeStateBuilder *njli::NodeStateBuilder::create, njli::NodeStateBuilder /*Add the children to the njli::NodeStateBuilder class*/);
%factory(njli::NodeStateBuilder *njli::NodeStateBuilder::clone, njli::NodeStateBuilder /*Add the children to the njli::NodeStateBuilder class*/);
%factory(njli::NodeStateBuilder *njli::NodeStateBuilder::copy, njli::NodeStateBuilder /*Add the children to the njli::NodeStateBuilder class*/);

%newobject njli::NodeStateMachine::create;
%delobject njli::NodeStateMachine::destroy;
%factory(njli::NodeStateMachine *njli::NodeStateMachine::create, njli::NodeStateMachine /*Add the children to the njli::NodeStateMachine class*/);
%factory(njli::NodeStateMachine *njli::NodeStateMachine::clone, njli::NodeStateMachine /*Add the children to the njli::NodeStateMachine class*/);
%factory(njli::NodeStateMachine *njli::NodeStateMachine::copy, njli::NodeStateMachine /*Add the children to the njli::NodeStateMachine class*/);

%newobject njli::NodeStateMachineBuilder::create;
%delobject njli::NodeStateMachineBuilder::destroy;
%factory(njli::NodeStateMachineBuilder *njli::NodeStateMachineBuilder::create, njli::NodeStateMachineBuilder /*Add the children to the njli::NodeStateMachineBuilder class*/);
%factory(njli::NodeStateMachineBuilder *njli::NodeStateMachineBuilder::clone, njli::NodeStateMachineBuilder /*Add the children to the njli::NodeStateMachineBuilder class*/);
%factory(njli::NodeStateMachineBuilder *njli::NodeStateMachineBuilder::copy, njli::NodeStateMachineBuilder /*Add the children to the njli::NodeStateMachineBuilder class*/);

%newobject njli::ParticleEmitter::create;
%delobject njli::ParticleEmitter::destroy;
%factory(njli::ParticleEmitter *njli::ParticleEmitter::create, njli::ParticleEmitter /*Add the children to the njli::ParticleEmitter class*/);
%factory(njli::ParticleEmitter *njli::ParticleEmitter::clone, njli::ParticleEmitter /*Add the children to the njli::ParticleEmitter class*/);
%factory(njli::ParticleEmitter *njli::ParticleEmitter::copy, njli::ParticleEmitter /*Add the children to the njli::ParticleEmitter class*/);
%convert(njli::ShaderProgram* njli::ParticleEmitter::getShaderProgram, njli::ShaderProgram);

%newobject njli::ParticleEmitterBuilder::create;
%delobject njli::ParticleEmitterBuilder::destroy;
%factory(njli::ParticleEmitterBuilder *njli::ParticleEmitterBuilder::create, njli::ParticleEmitterBuilder /*Add the children to the njli::ParticleEmitterBuilder class*/);
%factory(njli::ParticleEmitterBuilder *njli::ParticleEmitterBuilder::clone, njli::ParticleEmitterBuilder /*Add the children to the njli::ParticleEmitterBuilder class*/);
%factory(njli::ParticleEmitterBuilder *njli::ParticleEmitterBuilder::copy, njli::ParticleEmitterBuilder /*Add the children to the njli::ParticleEmitterBuilder class*/);

%newobject njli::PhysicsBody::create;
%delobject njli::PhysicsBody::destroy;
%factory(njli::PhysicsBody *njli::PhysicsBody::create, njli::PhysicsBodyRigid, njli::PhysicsBodyGhost, njli::PhysicsBodySoft /*Add the children to the njli::PhysicsBody class*/);

%newobject njli::PhysicsBodyGhost::create;
%delobject njli::PhysicsBodyGhost::destroy;
%factory(njli::PhysicsBodyGhost *njli::PhysicsBodyGhost::create, njli::PhysicsBodyGhost /*Add the children to the njli::PhysicsBodyGhost class*/);
%factory(njli::PhysicsBodyGhost *njli::PhysicsBodyGhost::clone, njli::PhysicsBodyGhost /*Add the children to the njli::PhysicsBodyGhost class*/);
%factory(njli::PhysicsBodyGhost *njli::PhysicsBodyGhost::copy, njli::PhysicsBodyGhost /*Add the children to the njli::PhysicsBodyGhost class*/);

%newobject njli::PhysicsBodyGhostBuilder::create;
%delobject njli::PhysicsBodyGhostBuilder::destroy;
%factory(njli::PhysicsBodyGhostBuilder *njli::PhysicsBodyGhostBuilder::create, njli::PhysicsBodyGhostBuilder /*Add the children to the njli::PhysicsBodyGhostBuilder class*/);
%factory(njli::PhysicsBodyGhostBuilder *njli::PhysicsBodyGhostBuilder::clone, njli::PhysicsBodyGhostBuilder /*Add the children to the njli::PhysicsBodyGhostBuilder class*/);
%factory(njli::PhysicsBodyGhostBuilder *njli::PhysicsBodyGhostBuilder::copy, njli::PhysicsBodyGhostBuilder /*Add the children to the njli::PhysicsBodyGhostBuilder class*/);

%newobject njli::PhysicsBodyRigid::create;
%delobject njli::PhysicsBodyRigid::destroy;
%factory(njli::PhysicsBodyRigid *njli::PhysicsBodyRigid::create, njli::PhysicsBodyRigid /*Add the children to the njli::PhysicsBodyRigid class*/);
%factory(njli::PhysicsBodyRigid *njli::PhysicsBodyRigid::clone, njli::PhysicsBodyRigid /*Add the children to the njli::PhysicsBodyRigid class*/);
%factory(njli::PhysicsBodyRigid *njli::PhysicsBodyRigid::copy, njli::PhysicsBodyRigid /*Add the children to the njli::PhysicsBodyRigid class*/);

%newobject njli::PhysicsBodyRigidBuilder::create;
%delobject njli::PhysicsBodyRigidBuilder::destroy;
%factory(njli::PhysicsBodyRigidBuilder *njli::PhysicsBodyRigidBuilder::create, njli::PhysicsBodyRigidBuilder /*Add the children to the njli::PhysicsBodyRigidBuilder class*/);
%factory(njli::PhysicsBodyRigidBuilder *njli::PhysicsBodyRigidBuilder::clone, njli::PhysicsBodyRigidBuilder /*Add the children to the njli::PhysicsBodyRigidBuilder class*/);
%factory(njli::PhysicsBodyRigidBuilder *njli::PhysicsBodyRigidBuilder::copy, njli::PhysicsBodyRigidBuilder /*Add the children to the njli::PhysicsBodyRigidBuilder class*/);

%newobject njli::PhysicsBodySoft::create;
%delobject njli::PhysicsBodySoft::destroy;
%factory(njli::PhysicsBodySoft *njli::PhysicsBodySoft::create, njli::PhysicsBodySoft /*Add the children to the njli::PhysicsBodySoft class*/);
%factory(njli::PhysicsBodySoft *njli::PhysicsBodySoft::clone, njli::PhysicsBodySoft /*Add the children to the njli::PhysicsBodySoft class*/);
%factory(njli::PhysicsBodySoft *njli::PhysicsBodySoft::copy, njli::PhysicsBodySoft /*Add the children to the njli::PhysicsBodySoft class*/);

%newobject njli::PhysicsBodySoftBuilder::create;
%delobject njli::PhysicsBodySoftBuilder::destroy;
%factory(njli::PhysicsBodySoftBuilder *njli::PhysicsBodySoftBuilder::create, njli::PhysicsBodySoftBuilder /*Add the children to the njli::PhysicsBodySoftBuilder class*/);
%factory(njli::PhysicsBodySoftBuilder *njli::PhysicsBodySoftBuilder::clone, njli::PhysicsBodySoftBuilder /*Add the children to the njli::PhysicsBodySoftBuilder class*/);
%factory(njli::PhysicsBodySoftBuilder *njli::PhysicsBodySoftBuilder::copy, njli::PhysicsBodySoftBuilder /*Add the children to the njli::PhysicsBodySoftBuilder class*/);









%newobject njli::PhysicsConstraint::create;
%delobject njli::PhysicsConstraint::destroy;
%factory(njli::PhysicsConstraint *njli::PhysicsConstraint::create, njli::PhysicsConstraintPointToPoint, njli::PhysicsConstraintHinge, njli::PhysicsConstraintSlider, njli::PhysicsConstraintConeTwist, njli::PhysicsConstraintFixed, njli::PhysicsConstraintGeneric6Dof, njli::PhysicsConstraintGeneric6DofSpring /*Add the children to the njli::PhysicsConstraint class*/);






%newobject njli::PhysicsConstraintHinge::create;
%delobject njli::PhysicsConstraintHinge::destroy;
%factory(njli::PhysicsConstraintHinge *njli::PhysicsConstraintHinge::create, njli::PhysicsConstraintHinge /*Add the children to the njli::PhysicsConstraintHinge class*/);
%factory(njli::PhysicsConstraintHinge *njli::PhysicsConstraintHinge::clone, njli::PhysicsConstraintHinge /*Add the children to the njli::PhysicsConstraintHinge class*/);
%factory(njli::PhysicsConstraintHinge *njli::PhysicsConstraintHinge::copy, njli::PhysicsConstraintHinge /*Add the children to the njli::PhysicsConstraintHinge class*/);

%newobject njli::PhysicsConstraintHingeBuilder::create;
%delobject njli::PhysicsConstraintHingeBuilder::destroy;
%factory(njli::PhysicsConstraintHingeBuilder *njli::PhysicsConstraintHingeBuilder::create, njli::PhysicsConstraintHingeBuilder /*Add the children to the njli::PhysicsConstraintHingeBuilder class*/);
%factory(njli::PhysicsConstraintHingeBuilder *njli::PhysicsConstraintHingeBuilder::clone, njli::PhysicsConstraintHingeBuilder /*Add the children to the njli::PhysicsConstraintHingeBuilder class*/);
%factory(njli::PhysicsConstraintHingeBuilder *njli::PhysicsConstraintHingeBuilder::copy, njli::PhysicsConstraintHingeBuilder /*Add the children to the njli::PhysicsConstraintHingeBuilder class*/);








%newobject njli::PhysicsConstraintPointToPoint::create;
%delobject njli::PhysicsConstraintPointToPoint::destroy;
%factory(njli::PhysicsConstraintPointToPoint *njli::PhysicsConstraintPointToPoint::create, njli::PhysicsConstraintPointToPoint /*Add the children to the njli::PhysicsConstraintPointToPoint class*/);
%factory(njli::PhysicsConstraintPointToPoint *njli::PhysicsConstraintPointToPoint::clone, njli::PhysicsConstraintPointToPoint /*Add the children to the njli::PhysicsConstraintPointToPoint class*/);
%factory(njli::PhysicsConstraintPointToPoint *njli::PhysicsConstraintPointToPoint::copy, njli::PhysicsConstraintPointToPoint /*Add the children to the njli::PhysicsConstraintPointToPoint class*/);





%newobject njli::PhysicsConstraintPointToPointBuilder::create;
%delobject njli::PhysicsConstraintPointToPointBuilder::destroy;
%factory(njli::PhysicsConstraintPointToPointBuilder *njli::PhysicsConstraintPointToPointBuilder::create, njli::PhysicsConstraintPointToPointBuilder /*Add the children to the njli::PhysicsConstraintPointToPointBuilder class*/);
%factory(njli::PhysicsConstraintPointToPointBuilder *njli::PhysicsConstraintPointToPointBuilder::clone, njli::PhysicsConstraintPointToPointBuilder /*Add the children to the njli::PhysicsConstraintPointToPointBuilder class*/);
%factory(njli::PhysicsConstraintPointToPointBuilder *njli::PhysicsConstraintPointToPointBuilder::copy, njli::PhysicsConstraintPointToPointBuilder /*Add the children to the njli::PhysicsConstraintPointToPointBuilder class*/);


%newobject njli::PhysicsConstraintSlider::create;
%delobject njli::PhysicsConstraintSlider::destroy;
%factory(njli::PhysicsConstraintSlider *njli::PhysicsConstraintSlider::create, njli::PhysicsConstraintSlider /*Add the children to the njli::PhysicsConstraintSlider class*/);
%factory(njli::PhysicsConstraintSlider *njli::PhysicsConstraintSlider::close, njli::PhysicsConstraintSlider /*Add the children to the njli::PhysicsConstraintSlider class*/);
%factory(njli::PhysicsConstraintSlider *njli::PhysicsConstraintSlider::copy, njli::PhysicsConstraintSlider /*Add the children to the njli::PhysicsConstraintSlider class*/);

%newobject njli::PhysicsConstraintSliderBuilder::create;
%delobject njli::PhysicsConstraintSliderBuilder::destroy;
%factory(njli::PhysicsConstraintSliderBuilder *njli::PhysicsConstraintSliderBuilder::create, njli::PhysicsConstraintSliderBuilder /*Add the children to the njli::PhysicsConstraintSliderBuilder class*/);
%factory(njli::PhysicsConstraintSliderBuilder *njli::PhysicsConstraintSliderBuilder::close, njli::PhysicsConstraintSliderBuilder /*Add the children to the njli::PhysicsConstraintSliderBuilder class*/);
%factory(njli::PhysicsConstraintSliderBuilder *njli::PhysicsConstraintSliderBuilder::copy, njli::PhysicsConstraintSliderBuilder /*Add the children to the njli::PhysicsConstraintSliderBuilder class*/);

%newobject njli::PhysicsConstraintConeTwist::create;
%delobject njli::PhysicsConstraintConeTwist::destroy;
%factory(njli::PhysicsConstraintConeTwist *njli::PhysicsConstraintConeTwist::create, njli::PhysicsConstraintConeTwist /*Add the children to the njli::PhysicsConstraintConeTwist class*/);
%factory(njli::PhysicsConstraintConeTwist *njli::PhysicsConstraintConeTwist::close, njli::PhysicsConstraintConeTwist /*Add the children to the njli::PhysicsConstraintConeTwist class*/);
%factory(njli::PhysicsConstraintConeTwist *njli::PhysicsConstraintConeTwist::copy, njli::PhysicsConstraintConeTwist /*Add the children to the njli::PhysicsConstraintConeTwist class*/);

%newobject njli::PhysicsConstraintConeTwistBuilder::create;
%delobject njli::PhysicsConstraintConeTwistBuilder::destroy;
%factory(njli::PhysicsConstraintConeTwistBuilder *njli::PhysicsConstraintConeTwistBuilder::create, njli::PhysicsConstraintConeTwistBuilder /*Add the children to the njli::PhysicsConstraintConeTwistBuilder class*/);
%factory(njli::PhysicsConstraintConeTwistBuilder *njli::PhysicsConstraintConeTwistBuilder::close, njli::PhysicsConstraintConeTwistBuilder /*Add the children to the njli::PhysicsConstraintConeTwistBuilder class*/);
%factory(njli::PhysicsConstraintConeTwistBuilder *njli::PhysicsConstraintConeTwistBuilder::copy, njli::PhysicsConstraintConeTwistBuilder /*Add the children to the njli::PhysicsConstraintConeTwistBuilder class*/);

%newobject njli::PhysicsConstraintFixed::create;
%delobject njli::PhysicsConstraintFixed::destroy;
%factory(njli::PhysicsConstraintFixed *njli::PhysicsConstraintFixed::create, njli::PhysicsConstraintFixed /*Add the children to the njli::PhysicsConstraintFixed class*/);
%factory(njli::PhysicsConstraintFixed *njli::PhysicsConstraintFixed::close, njli::PhysicsConstraintFixed /*Add the children to the njli::PhysicsConstraintFixed class*/);
%factory(njli::PhysicsConstraintFixed *njli::PhysicsConstraintFixed::copy, njli::PhysicsConstraintFixed /*Add the children to the njli::PhysicsConstraintFixed class*/);

%newobject njli::PhysicsConstraintFixedBuilder::create;
%delobject njli::PhysicsConstraintFixedBuilder::destroy;
%factory(njli::PhysicsConstraintFixedBuilder *njli::PhysicsConstraintFixedBuilder::create, njli::PhysicsConstraintFixedBuilder /*Add the children to the njli::PhysicsConstraintFixedBuilder class*/);
%factory(njli::PhysicsConstraintFixedBuilder *njli::PhysicsConstraintFixedBuilder::close, njli::PhysicsConstraintFixedBuilder /*Add the children to the njli::PhysicsConstraintFixedBuilder class*/);
%factory(njli::PhysicsConstraintFixedBuilder *njli::PhysicsConstraintFixedBuilder::copy, njli::PhysicsConstraintFixedBuilder /*Add the children to the njli::PhysicsConstraintFixedBuilder class*/);

%newobject njli::PhysicsConstraintGeneric6Dof::create;
%delobject njli::PhysicsConstraintGeneric6Dof::destroy;
%factory(njli::PhysicsConstraintGeneric6Dof *njli::PhysicsConstraintGeneric6Dof::create, njli::PhysicsConstraintGeneric6Dof /*Add the children to the njli::PhysicsConstraintGeneric6Dof class*/);
%factory(njli::PhysicsConstraintGeneric6Dof *njli::PhysicsConstraintGeneric6Dof::close, njli::PhysicsConstraintGeneric6Dof /*Add the children to the njli::PhysicsConstraintGeneric6Dof class*/);
%factory(njli::PhysicsConstraintGeneric6Dof *njli::PhysicsConstraintGeneric6Dof::copy, njli::PhysicsConstraintGeneric6Dof /*Add the children to the njli::PhysicsConstraintGeneric6Dof class*/);

%newobject njli::PhysicsConstraintGeneric6DofBuilder::create;
%delobject njli::PhysicsConstraintGeneric6DofBuilder::destroy;
%factory(njli::PhysicsConstraintGeneric6DofBuilder *njli::PhysicsConstraintGeneric6DofBuilder::create, njli::PhysicsConstraintGeneric6DofBuilder /*Add the children to the njli::PhysicsConstraintGeneric6DofBuilder class*/);
%factory(njli::PhysicsConstraintGeneric6DofBuilder *njli::PhysicsConstraintGeneric6DofBuilder::close, njli::PhysicsConstraintGeneric6DofBuilder /*Add the children to the njli::PhysicsConstraintGeneric6DofBuilder class*/);
%factory(njli::PhysicsConstraintGeneric6DofBuilder *njli::PhysicsConstraintGeneric6DofBuilder::copy, njli::PhysicsConstraintGeneric6DofBuilder /*Add the children to the njli::PhysicsConstraintGeneric6DofBuilder class*/);

%newobject njli::PhysicsConstraintGeneric6DofSpring::create;
%delobject njli::PhysicsConstraintGeneric6DofSpring::destroy;
%factory(njli::PhysicsConstraintGeneric6DofSpring *njli::PhysicsConstraintGeneric6DofSpring::create, njli::PhysicsConstraintGeneric6DofSpring /*Add the children to the njli::PhysicsConstraintGeneric6DofSpring class*/);
%factory(njli::PhysicsConstraintGeneric6DofSpring *njli::PhysicsConstraintGeneric6DofSpring::close, njli::PhysicsConstraintGeneric6DofSpring /*Add the children to the njli::PhysicsConstraintGeneric6DofSpring class*/);
%factory(njli::PhysicsConstraintGeneric6DofSpring *njli::PhysicsConstraintGeneric6DofSpring::copy, njli::PhysicsConstraintGeneric6DofSpring /*Add the children to the njli::PhysicsConstraintGeneric6DofSpring class*/);

%newobject njli::PhysicsConstraintGeneric6DofSpringBuilder::create;
%delobject njli::PhysicsConstraintGeneric6DofSpringBuilder::destroy;
%factory(njli::PhysicsConstraintGeneric6DofSpringBuilder *njli::PhysicsConstraintGeneric6DofSpringBuilder::create, njli::PhysicsConstraintGeneric6DofSpringBuilder /*Add the children to the njli::PhysicsConstraintGeneric6DofSpringBuilder class*/);
%factory(njli::PhysicsConstraintGeneric6DofSpringBuilder *njli::PhysicsConstraintGeneric6DofSpringBuilder::close, njli::PhysicsConstraintGeneric6DofSpringBuilder /*Add the children to the njli::PhysicsConstraintGeneric6DofSpringBuilder class*/);
%factory(njli::PhysicsConstraintGeneric6DofSpringBuilder *njli::PhysicsConstraintGeneric6DofSpringBuilder::copy, njli::PhysicsConstraintGeneric6DofSpringBuilder /*Add the children to the njli::PhysicsConstraintGeneric6DofSpringBuilder class*/);











%newobject njli::PhysicsCloseContact::create;
%delobject njli::PhysicsCloseContact::destroy;
%factory(njli::PhysicsCloseContact *njli::PhysicsCloseContact::create, njli::PhysicsCloseContact /*Add the children to the njli::PhysicsCloseContact class*/);
%factory(njli::PhysicsCloseContact *njli::PhysicsCloseContact::clone, njli::PhysicsCloseContact /*Add the children to the njli::PhysicsCloseContact class*/);
%factory(njli::PhysicsCloseContact *njli::PhysicsCloseContact::copy, njli::PhysicsCloseContact /*Add the children to the njli::PhysicsCloseContact class*/);

%newobject njli::PhysicsCloseContactBuilder::create;
%delobject njli::PhysicsCloseContactBuilder::destroy;
%factory(njli::PhysicsCloseContactBuilder *njli::PhysicsCloseContactBuilder::create, njli::PhysicsCloseContactBuilder /*Add the children to the njli::PhysicsCloseContactBuilder class*/);
%factory(njli::PhysicsCloseContactBuilder *njli::PhysicsCloseContactBuilder::clone, njli::PhysicsCloseContactBuilder /*Add the children to the njli::PhysicsCloseContactBuilder class*/);
%factory(njli::PhysicsCloseContactBuilder *njli::PhysicsCloseContactBuilder::copy, njli::PhysicsCloseContactBuilder /*Add the children to the njli::PhysicsCloseContactBuilder class*/);

%newobject njli::PhysicsContact::create;
%delobject njli::PhysicsContact::destroy;
%factory(njli::PhysicsContact *njli::PhysicsContact::create, njli::PhysicsContact /*Add the children to the njli::PhysicsContact class*/);
%factory(njli::PhysicsContact *njli::PhysicsContact::clone, njli::PhysicsContact /*Add the children to the njli::PhysicsContact class*/);
%factory(njli::PhysicsContact *njli::PhysicsContact::copy, njli::PhysicsContact /*Add the children to the njli::PhysicsContact class*/);

%newobject njli::PhysicsContactBuilder::create;
%delobject njli::PhysicsContactBuilder::destroy;
%factory(njli::PhysicsContactBuilder *njli::PhysicsContactBuilder::create, njli::PhysicsContactBuilder /*Add the children to the njli::PhysicsContactBuilder class*/);
%factory(njli::PhysicsContactBuilder *njli::PhysicsContactBuilder::clone, njli::PhysicsContactBuilder /*Add the children to the njli::PhysicsContactBuilder class*/);
%factory(njli::PhysicsContactBuilder *njli::PhysicsContactBuilder::copy, njli::PhysicsContactBuilder /*Add the children to the njli::PhysicsContactBuilder class*/);

%newobject njli::PhysicsField::create;
%delobject njli::PhysicsField::destroy;
%factory(njli::PhysicsField *njli::PhysicsField::create, njli::PhysicsField /*Add the children to the njli::PhysicsField class*/);
%factory(njli::PhysicsField *njli::PhysicsField::clone, njli::PhysicsField /*Add the children to the njli::PhysicsField class*/);
%factory(njli::PhysicsField *njli::PhysicsField::copy, njli::PhysicsField /*Add the children to the njli::PhysicsField class*/);

%newobject njli::PhysicsFieldBuilder::create;
%delobject njli::PhysicsFieldBuilder::destroy;
%factory(njli::PhysicsFieldBuilder *njli::PhysicsFieldBuilder::create, njli::PhysicsFieldBuilder /*Add the children to the njli::PhysicsFieldBuilder class*/);
%factory(njli::PhysicsFieldBuilder *njli::PhysicsFieldBuilder::clone, njli::PhysicsFieldBuilder /*Add the children to the njli::PhysicsFieldBuilder class*/);
%factory(njli::PhysicsFieldBuilder *njli::PhysicsFieldBuilder::copy, njli::PhysicsFieldBuilder /*Add the children to the njli::PhysicsFieldBuilder class*/);

%newobject njli::PhysicsRayContact::create;
%delobject njli::PhysicsRayContact::destroy;
%factory(njli::PhysicsRayContact *njli::PhysicsRayContact::create, njli::PhysicsRayContact /*Add the children to the njli::PhysicsRayContact class*/);
%factory(njli::PhysicsRayContact *njli::PhysicsRayContact::clone, njli::PhysicsRayContact /*Add the children to the njli::PhysicsRayContact class*/);
%factory(njli::PhysicsRayContact *njli::PhysicsRayContact::copy, njli::PhysicsRayContact /*Add the children to the njli::PhysicsRayContact class*/);

%newobject njli::PhysicsRayContactBuilder::create;
%delobject njli::PhysicsRayContactBuilder::destroy;
%factory(njli::PhysicsRayContactBuilder *njli::PhysicsRayContactBuilder::create, njli::PhysicsRayContactBuilder /*Add the children to the njli::PhysicsRayContactBuilder class*/);
%factory(njli::PhysicsRayContactBuilder *njli::PhysicsRayContactBuilder::clone, njli::PhysicsRayContactBuilder /*Add the children to the njli::PhysicsRayContactBuilder class*/);
%factory(njli::PhysicsRayContactBuilder *njli::PhysicsRayContactBuilder::copy, njli::PhysicsRayContactBuilder /*Add the children to the njli::PhysicsRayContactBuilder class*/);

%newobject njli::PhysicsShape::create;
%delobject njli::PhysicsShape::destroy;
%factory(njli::PhysicsShape *njli::PhysicsShape::create,
         njli::PhysicsShapeBox,
         njli::PhysicsShapeBox2D,
         njli::PhysicsShapeSphere,
         njli::PhysicsShapeCylinder,
         njli::PhysicsShapeCapsule,
         njli::PhysicsShapeCone,
         njli::PhysicsShapeMultiSphere,
         njli::PhysicsShapeConvexHull,
         njli::PhysicsShapeConvexTriangleMesh,
         njli::PhysicsShapeBvhTriangleMesh,
         njli::PhysicsShapeHeightfieldTerrain,
         njli::PhysicsShapeStaticPlane

/*Add the children to the njli::PhysicsShape class*/);

%newobject njli::PhysicsShapeBox::create;
%delobject njli::PhysicsShapeBox::destroy;
%factory(njli::PhysicsShapeBox *njli::PhysicsShapeBox::create, njli::PhysicsShapeBox /*Add the children to the njli::PhysicsShapeBox class*/);
%factory(njli::PhysicsShapeBox *njli::PhysicsShapeBox::clone, njli::PhysicsShapeBox /*Add the children to the njli::PhysicsShapeBox class*/);
%factory(njli::PhysicsShapeBox *njli::PhysicsShapeBox::copy, njli::PhysicsShapeBox /*Add the children to the njli::PhysicsShapeBox class*/);

%newobject njli::PhysicsShapeBoxBuilder::create;
%delobject njli::PhysicsShapeBoxBuilder::destroy;
%factory(njli::PhysicsShapeBoxBuilder *njli::PhysicsShapeBoxBuilder::create, njli::PhysicsShapeBoxBuilder /*Add the children to the njli::PhysicsShapeBoxBuilder class*/);
%factory(njli::PhysicsShapeBoxBuilder *njli::PhysicsShapeBoxBuilder::clone, njli::PhysicsShapeBoxBuilder /*Add the children to the njli::PhysicsShapeBoxBuilder class*/);
%factory(njli::PhysicsShapeBoxBuilder *njli::PhysicsShapeBoxBuilder::copy, njli::PhysicsShapeBoxBuilder /*Add the children to the njli::PhysicsShapeBoxBuilder class*/);

%newobject njli::PhysicsShapeBox2D::create;
%delobject njli::PhysicsShapeBox2D::destroy;
%factory(njli::PhysicsShapeBox2D *njli::PhysicsShapeBox2D::create, njli::PhysicsShapeBox2D /*Add the children to the njli::PhysicsShapeBox2D class*/);
%factory(njli::PhysicsShapeBox2D *njli::PhysicsShapeBox2D::clone, njli::PhysicsShapeBox2D /*Add the children to the njli::PhysicsShapeBox2D class*/);
%factory(njli::PhysicsShapeBox2D *njli::PhysicsShapeBox2D::copy, njli::PhysicsShapeBox2D /*Add the children to the njli::PhysicsShapeBox2D class*/);

%newobject njli::PhysicsShapeBox2DBuilder::create;
%delobject njli::PhysicsShapeBox2DBuilder::destroy;
%factory(njli::PhysicsShapeBox2DBuilder *njli::PhysicsShapeBox2DBuilder::create, njli::PhysicsShapeBox2DBuilder /*Add the children to the njli::PhysicsShapeBox2DBuilder class*/);
%factory(njli::PhysicsShapeBox2DBuilder *njli::PhysicsShapeBox2DBuilder::clone, njli::PhysicsShapeBox2DBuilder /*Add the children to the njli::PhysicsShapeBox2DBuilder class*/);
%factory(njli::PhysicsShapeBox2DBuilder *njli::PhysicsShapeBox2DBuilder::copy, njli::PhysicsShapeBox2DBuilder /*Add the children to the njli::PhysicsShapeBox2DBuilder class*/);



%newobject njli::PhysicsShapeSphere::create;
%delobject njli::PhysicsShapeSphere::destroy;
%factory(njli::PhysicsShapeSphere *njli::PhysicsShapeSphere::create, njli::PhysicsShapeSphere /*Add the children to the njli::PhysicsShapeSphere class */);
%factory(njli::PhysicsShapeSphere *njli::PhysicsShapeSphere::clone, njli::PhysicsShapeSphere /*Add the children to the njli::PhysicsShapeSphere class */);
%factory(njli::PhysicsShapeSphere *njli::PhysicsShapeSphere::copy, njli::PhysicsShapeSphere /*Add the children to the njli::PhysicsShapeSphere class */);

%newobject njli::PhysicsShapeSphereBuilder::create;
%delobject njli::PhysicsShapeSphereBuilder::destroy;
%factory(njli::PhysicsShapeSphereBuilder *njli::PhysicsShapeSphereBuilder::create, njli::PhysicsShapeSphereBuilder /*Add the children to the njli::PhysicsShapeSphereBuilder class */);
%factory(njli::PhysicsShapeSphereBuilder *njli::PhysicsShapeSphereBuilder::clone, njli::PhysicsShapeSphereBuilder /*Add the children to the njli::PhysicsShapeSphereBuilder class */);
%factory(njli::PhysicsShapeSphereBuilder *njli::PhysicsShapeSphereBuilder::copy, njli::PhysicsShapeSphereBuilder /*Add the children to the njli::PhysicsShapeSphereBuilder class */);

%newobject njli::PhysicsShapeCylinder::create;
%delobject njli::PhysicsShapeCylinder::destroy;
%factory(njli::PhysicsShapeCylinder *njli::PhysicsShapeCylinder::create, njli::PhysicsShapeCylinder /*Add the children to the njli::PhysicsShapeCylinder class */);
%factory(njli::PhysicsShapeCylinder *njli::PhysicsShapeCylinder::clone, njli::PhysicsShapeCylinder /*Add the children to the njli::PhysicsShapeCylinder class */);
%factory(njli::PhysicsShapeCylinder *njli::PhysicsShapeCylinder::copy, njli::PhysicsShapeCylinder /*Add the children to the njli::PhysicsShapeCylinder class */);

%newobject njli::PhysicsShapeCylinderBuilder::create;
%delobject njli::PhysicsShapeCylinderBuilder::destroy;
%factory(njli::PhysicsShapeCylinderBuilder *njli::PhysicsShapeCylinderBuilder::create, njli::PhysicsShapeCylinderBuilder /*Add the children to the njli::PhysicsShapeCylinderBuilder class */);
%factory(njli::PhysicsShapeCylinderBuilder *njli::PhysicsShapeCylinderBuilder::clone, njli::PhysicsShapeCylinderBuilder /*Add the children to the njli::PhysicsShapeCylinderBuilder class */);
%factory(njli::PhysicsShapeCylinderBuilder *njli::PhysicsShapeCylinderBuilder::copy, njli::PhysicsShapeCylinderBuilder /*Add the children to the njli::PhysicsShapeCylinderBuilder class */);

%newobject njli::PhysicsShapeCapsule::create;
%delobject njli::PhysicsShapeCapsule::destroy;
%factory(njli::PhysicsShapeCapsule *njli::PhysicsShapeCapsule::create, njli::PhysicsShapeCapsule /*Add the children to the njli::PhysicsShapeCapsule class */);
%factory(njli::PhysicsShapeCapsule *njli::PhysicsShapeCapsule::clone, njli::PhysicsShapeCapsule /*Add the children to the njli::PhysicsShapeCapsule class */);
%factory(njli::PhysicsShapeCapsule *njli::PhysicsShapeCapsule::copy, njli::PhysicsShapeCapsule /*Add the children to the njli::PhysicsShapeCapsule class */);

%newobject njli::PhysicsShapeCapsuleBuilder::create;
%delobject njli::PhysicsShapeCapsuleBuilder::destroy;
%factory(njli::PhysicsShapeCapsuleBuilder *njli::PhysicsShapeCapsuleBuilder::create, njli::PhysicsShapeCapsuleBuilder /*Add the children to the njli::PhysicsShapeCapsuleBuilder class */);
%factory(njli::PhysicsShapeCapsuleBuilder *njli::PhysicsShapeCapsuleBuilder::clone, njli::PhysicsShapeCapsuleBuilder /*Add the children to the njli::PhysicsShapeCapsuleBuilder class */);
%factory(njli::PhysicsShapeCapsuleBuilder *njli::PhysicsShapeCapsuleBuilder::copy, njli::PhysicsShapeCapsuleBuilder /*Add the children to the njli::PhysicsShapeCapsuleBuilder class */);

%newobject njli::PhysicsShapeCone::create;
%delobject njli::PhysicsShapeCone::destroy;
%factory(njli::PhysicsShapeCone *njli::PhysicsShapeCone::create, njli::PhysicsShapeCone /*Add the children to the njli::PhysicsShapeCone class */);
%factory(njli::PhysicsShapeCone *njli::PhysicsShapeCone::clone, njli::PhysicsShapeCone /*Add the children to the njli::PhysicsShapeCone class */);
%factory(njli::PhysicsShapeCone *njli::PhysicsShapeCone::copy, njli::PhysicsShapeCone /*Add the children to the njli::PhysicsShapeCone class */);

%newobject njli::PhysicsShapeConeBuilder::create;
%delobject njli::PhysicsShapeConeBuilder::destroy;
%factory(njli::PhysicsShapeConeBuilder *njli::PhysicsShapeConeBuilder::create, njli::PhysicsShapeConeBuilder /*Add the children to the njli::PhysicsShapeConeBuilder class */);
%factory(njli::PhysicsShapeConeBuilder *njli::PhysicsShapeConeBuilder::clone, njli::PhysicsShapeConeBuilder /*Add the children to the njli::PhysicsShapeConeBuilder class */);
%factory(njli::PhysicsShapeConeBuilder *njli::PhysicsShapeConeBuilder::copy, njli::PhysicsShapeConeBuilder /*Add the children to the njli::PhysicsShapeConeBuilder class */);

%newobject njli::PhysicsShapeMultiSphere::create;
%delobject njli::PhysicsShapeMultiSphere::destroy;
%factory(njli::PhysicsShapeMultiSphere *njli::PhysicsShapeMultiSphere::create, njli::PhysicsShapeMultiSphere /*Add the children to the njli::PhysicsShapeMultiSphere class */);
%factory(njli::PhysicsShapeMultiSphere *njli::PhysicsShapeMultiSphere::clone, njli::PhysicsShapeMultiSphere /*Add the children to the njli::PhysicsShapeMultiSphere class */);
%factory(njli::PhysicsShapeMultiSphere *njli::PhysicsShapeMultiSphere::copy, njli::PhysicsShapeMultiSphere /*Add the children to the njli::PhysicsShapeMultiSphere class */);

%newobject njli::PhysicsShapeMultiSphereBuilder::create;
%delobject njli::PhysicsShapeMultiSphereBuilder::destroy;
%factory(njli::PhysicsShapeMultiSphereBuilder *njli::PhysicsShapeMultiSphereBuilder::create, njli::PhysicsShapeMultiSphereBuilder /*Add the children to the njli::PhysicsShapeMultiSphereBuilder class */);
%factory(njli::PhysicsShapeMultiSphereBuilder *njli::PhysicsShapeMultiSphereBuilder::clone, njli::PhysicsShapeMultiSphereBuilder /*Add the children to the njli::PhysicsShapeMultiSphereBuilder class */);
%factory(njli::PhysicsShapeMultiSphereBuilder *njli::PhysicsShapeMultiSphereBuilder::copy, njli::PhysicsShapeMultiSphereBuilder /*Add the children to the njli::PhysicsShapeMultiSphereBuilder class */);

%newobject njli::PhysicsShapeConvexHull::create;
%delobject njli::PhysicsShapeConvexHull::destroy;
%factory(njli::PhysicsShapeConvexHull *njli::PhysicsShapeConvexHull::create, njli::PhysicsShapeConvexHull /*Add the children to the njli::PhysicsShapeConvexHull class */);
%factory(njli::PhysicsShapeConvexHull *njli::PhysicsShapeConvexHull::clone, njli::PhysicsShapeConvexHull /*Add the children to the njli::PhysicsShapeConvexHull class */);
%factory(njli::PhysicsShapeConvexHull *njli::PhysicsShapeConvexHull::copy, njli::PhysicsShapeConvexHull /*Add the children to the njli::PhysicsShapeConvexHull class */);

%newobject njli::PhysicsShapeConvexHullBuilder::create;
%delobject njli::PhysicsShapeConvexHullBuilder::destroy;
%factory(njli::PhysicsShapeConvexHullBuilder *njli::PhysicsShapeConvexHullBuilder::create, njli::PhysicsShapeConvexHullBuilder /*Add the children to the njli::PhysicsShapeConvexHullBuilder class */);
%factory(njli::PhysicsShapeConvexHullBuilder *njli::PhysicsShapeConvexHullBuilder::clone, njli::PhysicsShapeConvexHullBuilder /*Add the children to the njli::PhysicsShapeConvexHullBuilder class */);
%factory(njli::PhysicsShapeConvexHullBuilder *njli::PhysicsShapeConvexHullBuilder::copy, njli::PhysicsShapeConvexHullBuilder /*Add the children to the njli::PhysicsShapeConvexHullBuilder class */);

%newobject njli::PhysicsShapeConvexTriangleMesh::create;
%delobject njli::PhysicsShapeConvexTriangleMesh::destroy;
%factory(njli::PhysicsShapeConvexTriangleMesh *njli::PhysicsShapeConvexTriangleMesh::create, njli::PhysicsShapeConvexTriangleMesh /*Add the children to the njli::PhysicsShapeConvexTriangleMesh class */);
%factory(njli::PhysicsShapeConvexTriangleMesh *njli::PhysicsShapeConvexTriangleMesh::clone, njli::PhysicsShapeConvexTriangleMesh /*Add the children to the njli::PhysicsShapeConvexTriangleMesh class */);
%factory(njli::PhysicsShapeConvexTriangleMesh *njli::PhysicsShapeConvexTriangleMesh::copy, njli::PhysicsShapeConvexTriangleMesh /*Add the children to the njli::PhysicsShapeConvexTriangleMesh class */);

%newobject njli::PhysicsShapeConvexTriangleMeshBuilder::create;
%delobject njli::PhysicsShapeConvexTriangleMeshBuilder::destroy;
%factory(njli::PhysicsShapeConvexTriangleMeshBuilder *njli::PhysicsShapeConvexTriangleMeshBuilder::create, njli::PhysicsShapeConvexTriangleMeshBuilder /*Add the children to the njli::PhysicsShapeConvexTriangleMeshBuilder class */);
%factory(njli::PhysicsShapeConvexTriangleMeshBuilder *njli::PhysicsShapeConvexTriangleMeshBuilder::clone, njli::PhysicsShapeConvexTriangleMeshBuilder /*Add the children to the njli::PhysicsShapeConvexTriangleMeshBuilder class */);
%factory(njli::PhysicsShapeConvexTriangleMeshBuilder *njli::PhysicsShapeConvexTriangleMeshBuilder::copy, njli::PhysicsShapeConvexTriangleMeshBuilder /*Add the children to the njli::PhysicsShapeConvexTriangleMeshBuilder class */);

%newobject njli::PhysicsShapeBvhTriangleMesh::create;
%delobject njli::PhysicsShapeBvhTriangleMesh::destroy;
%factory(njli::PhysicsShapeBvhTriangleMesh *njli::PhysicsShapeBvhTriangleMesh::create, njli::PhysicsShapeBvhTriangleMesh /*Add the children to the njli::PhysicsShapeBvhTriangleMesh class */);
%factory(njli::PhysicsShapeBvhTriangleMesh *njli::PhysicsShapeBvhTriangleMesh::clone, njli::PhysicsShapeBvhTriangleMesh /*Add the children to the njli::PhysicsShapeBvhTriangleMesh class */);
%factory(njli::PhysicsShapeBvhTriangleMesh *njli::PhysicsShapeBvhTriangleMesh::copy, njli::PhysicsShapeBvhTriangleMesh /*Add the children to the njli::PhysicsShapeBvhTriangleMesh class */);

%newobject njli::PhysicsShapeBvhTriangleMeshBuilder::create;
%delobject njli::PhysicsShapeBvhTriangleMeshBuilder::destroy;
%factory(njli::PhysicsShapeBvhTriangleMeshBuilder *njli::PhysicsShapeBvhTriangleMeshBuilder::create, njli::PhysicsShapeBvhTriangleMeshBuilder /*Add the children to the njli::PhysicsShapeBvhTriangleMeshBuilder class */);
%factory(njli::PhysicsShapeBvhTriangleMeshBuilder *njli::PhysicsShapeBvhTriangleMeshBuilder::clone, njli::PhysicsShapeBvhTriangleMeshBuilder /*Add the children to the njli::PhysicsShapeBvhTriangleMeshBuilder class */);
%factory(njli::PhysicsShapeBvhTriangleMeshBuilder *njli::PhysicsShapeBvhTriangleMeshBuilder::copy, njli::PhysicsShapeBvhTriangleMeshBuilder /*Add the children to the njli::PhysicsShapeBvhTriangleMeshBuilder class */);

%newobject njli::PhysicsShapeHeightfieldTerrain::create;
%delobject njli::PhysicsShapeHeightfieldTerrain::destroy;
%factory(njli::PhysicsShapeHeightfieldTerrain *njli::PhysicsShapeHeightfieldTerrain::create, njli::PhysicsShapeHeightfieldTerrain /*Add the children to the njli::PhysicsShapeHeightfieldTerrain class */);
%factory(njli::PhysicsShapeHeightfieldTerrain *njli::PhysicsShapeHeightfieldTerrain::clone, njli::PhysicsShapeHeightfieldTerrain /*Add the children to the njli::PhysicsShapeHeightfieldTerrain class */);
%factory(njli::PhysicsShapeHeightfieldTerrain *njli::PhysicsShapeHeightfieldTerrain::copy, njli::PhysicsShapeHeightfieldTerrain /*Add the children to the njli::PhysicsShapeHeightfieldTerrain class */);

%newobject njli::PhysicsShapeHeightfieldTerrainBuilder::create;
%delobject njli::PhysicsShapeHeightfieldTerrainBuilder::destroy;
%factory(njli::PhysicsShapeHeightfieldTerrainBuilder *njli::PhysicsShapeHeightfieldTerrainBuilder::create, njli::PhysicsShapeHeightfieldTerrainBuilder /*Add the children to the njli::PhysicsShapeHeightfieldTerrainBuilder class */);
%factory(njli::PhysicsShapeHeightfieldTerrainBuilder *njli::PhysicsShapeHeightfieldTerrainBuilder::clone, njli::PhysicsShapeHeightfieldTerrainBuilder /*Add the children to the njli::PhysicsShapeHeightfieldTerrainBuilder class */);
%factory(njli::PhysicsShapeHeightfieldTerrainBuilder *njli::PhysicsShapeHeightfieldTerrainBuilder::copy, njli::PhysicsShapeHeightfieldTerrainBuilder /*Add the children to the njli::PhysicsShapeHeightfieldTerrainBuilder class */);

%newobject njli::PhysicsShapeStaticPlane::create;
%delobject njli::PhysicsShapeStaticPlane::destroy;
%factory(njli::PhysicsShapeStaticPlane *njli::PhysicsShapeStaticPlane::create, njli::PhysicsShapeStaticPlane /*Add the children to the njli::PhysicsShapeStaticPlane class */);
%factory(njli::PhysicsShapeStaticPlane *njli::PhysicsShapeStaticPlane::clone, njli::PhysicsShapeStaticPlane /*Add the children to the njli::PhysicsShapeStaticPlane class */);
%factory(njli::PhysicsShapeStaticPlane *njli::PhysicsShapeStaticPlane::copy, njli::PhysicsShapeStaticPlane /*Add the children to the njli::PhysicsShapeStaticPlane class */);

%newobject njli::PhysicsShapeStaticPlaneBuilder::create;
%delobject njli::PhysicsShapeStaticPlaneBuilder::destroy;
%factory(njli::PhysicsShapeStaticPlaneBuilder *njli::PhysicsShapeStaticPlaneBuilder::create, njli::PhysicsShapeStaticPlaneBuilder /*Add the children to the njli::PhysicsShapeStaticPlaneBuilder class */);
%factory(njli::PhysicsShapeStaticPlaneBuilder *njli::PhysicsShapeStaticPlaneBuilder::clone, njli::PhysicsShapeStaticPlaneBuilder /*Add the children to the njli::PhysicsShapeStaticPlaneBuilder class */);
%factory(njli::PhysicsShapeStaticPlaneBuilder *njli::PhysicsShapeStaticPlaneBuilder::copy, njli::PhysicsShapeStaticPlaneBuilder /*Add the children to the njli::PhysicsShapeStaticPlaneBuilder class */);






%newobject njli::PhysicsWorld::create;
%delobject njli::PhysicsWorld::destroy;
%factory(njli::PhysicsWorld *njli::PhysicsWorld::create, njli::PhysicsWorld /*Add the children to the njli::PhysicsWorld class*/);
%factory(njli::PhysicsWorld *njli::PhysicsWorld::clone, njli::PhysicsWorld /*Add the children to the njli::PhysicsWorld class*/);
%factory(njli::PhysicsWorld *njli::PhysicsWorld::copy, njli::PhysicsWorld /*Add the children to the njli::PhysicsWorld class*/);

%newobject njli::PhysicsWorldBuilder::create;
%delobject njli::PhysicsWorldBuilder::destroy;
%factory(njli::PhysicsWorldBuilder *njli::PhysicsWorldBuilder::create, njli::PhysicsWorldBuilder /*Add the children to the njli::PhysicsWorldBuilder class*/);
%factory(njli::PhysicsWorldBuilder *njli::PhysicsWorldBuilder::clone, njli::PhysicsWorldBuilder /*Add the children to the njli::PhysicsWorldBuilder class*/);
%factory(njli::PhysicsWorldBuilder *njli::PhysicsWorldBuilder::copy, njli::PhysicsWorldBuilder /*Add the children to the njli::PhysicsWorldBuilder class*/);

%newobject njli::Plane::create;
%delobject njli::Plane::destroy;
%factory(njli::Plane *njli::Plane::create, njli::Plane /*Add the children to the njli::Plane class*/);
%factory(njli::Plane *njli::Plane::clone, njli::Plane /*Add the children to the njli::Plane class*/);
%factory(njli::Plane *njli::Plane::copy, njli::Plane /*Add the children to the njli::Plane class*/);

%newobject njli::PlaneBuilder::create;
%delobject njli::PlaneBuilder::destroy;
%factory(njli::PlaneBuilder *njli::PlaneBuilder::create, njli::PlaneBuilder /*Add the children to the njli::PlaneBuilder class*/);
%factory(njli::PlaneBuilder *njli::PlaneBuilder::clone, njli::PlaneBuilder /*Add the children to the njli::PlaneBuilder class*/);
%factory(njli::PlaneBuilder *njli::PlaneBuilder::copy, njli::PlaneBuilder /*Add the children to the njli::PlaneBuilder class*/);

%newobject njli::Scene::create;
%delobject njli::Scene::destroy;
%factory(njli::Scene *njli::Scene::create, njli::Scene /*Add the children to the njli::Scene class*/);
%factory(njli::Scene *njli::Scene::clone, njli::Scene /*Add the children to the njli::Scene class*/);
%factory(njli::Scene *njli::Scene::copy, njli::Scene /*Add the children to the njli::Scene class*/);
%convert(njli::Node *njli::Scene::getRootNode, njli::Node);
%convert(njli::Camera *njli::Scene::getCamera, njli::Camera);
%convert(njli::Light *njli::Scene::getLight, njli::Light);
%convert(njli::SceneStateMachine *njli::Scene::getStateMachine, njli::SceneStateMachine);
%convert(njli::PhysicsWorld *njli::Scene::getPhysicsWorld, njli::PhysicsWorld);

%newobject njli::SceneBuilder::create;
%delobject njli::SceneBuilder::destroy;
%factory(njli::SceneBuilder *njli::SceneBuilder::create, njli::SceneBuilder /*Add the children to the njli::SceneBuilder class*/);
%factory(njli::SceneBuilder *njli::SceneBuilder::clone, njli::SceneBuilder /*Add the children to the njli::SceneBuilder class*/);
%factory(njli::SceneBuilder *njli::SceneBuilder::copy, njli::SceneBuilder /*Add the children to the njli::SceneBuilder class*/);

%newobject njli::SceneState::create;
%delobject njli::SceneState::destroy;
%factory(njli::SceneState *njli::SceneState::create, njli::SceneState /*Add the children to the njli::SceneState class*/);
%factory(njli::SceneState *njli::SceneState::clone, njli::SceneState /*Add the children to the njli::SceneState class*/);
%factory(njli::SceneState *njli::SceneState::copy, njli::SceneState /*Add the children to the njli::SceneState class*/);

%newobject njli::SceneStateBuilder::create;
%delobject njli::SceneStateBuilder::destroy;
%factory(njli::SceneStateBuilder *njli::SceneStateBuilder::create, njli::SceneStateBuilder /*Add the children to the njli::SceneStateBuilder class*/);
%factory(njli::SceneStateBuilder *njli::SceneStateBuilder::clone, njli::SceneStateBuilder /*Add the children to the njli::SceneStateBuilder class*/);
%factory(njli::SceneStateBuilder *njli::SceneStateBuilder::copy, njli::SceneStateBuilder /*Add the children to the njli::SceneStateBuilder class*/);

%newobject njli::SceneStateMachine::create;
%delobject njli::SceneStateMachine::destroy;
%factory(njli::SceneStateMachine *njli::SceneStateMachine::create, njli::SceneStateMachine /*Add the children to the njli::SceneStateMachine class*/);
%factory(njli::SceneStateMachine *njli::SceneStateMachine::clone, njli::SceneStateMachine /*Add the children to the njli::SceneStateMachine class*/);
%factory(njli::SceneStateMachine *njli::SceneStateMachine::copy, njli::SceneStateMachine /*Add the children to the njli::SceneStateMachine class*/);

%newobject njli::SceneStateMachineBuilder::create;
%delobject njli::SceneStateMachineBuilder::destroy;
%factory(njli::SceneStateMachineBuilder *njli::SceneStateMachineBuilder::create, njli::SceneStateMachineBuilder /*Add the children to the njli::SceneStateMachineBuilder class*/);
%factory(njli::SceneStateMachineBuilder *njli::SceneStateMachineBuilder::clone, njli::SceneStateMachineBuilder /*Add the children to the njli::SceneStateMachineBuilder class*/);
%factory(njli::SceneStateMachineBuilder *njli::SceneStateMachineBuilder::copy, njli::SceneStateMachineBuilder /*Add the children to the njli::SceneStateMachineBuilder class*/);

%newobject njli::ShaderProgram::create;
%delobject njli::ShaderProgram::destroy;
%factory(njli::ShaderProgram *njli::ShaderProgram::create, njli::ShaderProgram /*Add the children to the njli::ShaderProgram class*/);
%factory(njli::ShaderProgram *njli::ShaderProgram::clone, njli::ShaderProgram /*Add the children to the njli::ShaderProgram class*/);
%factory(njli::ShaderProgram *njli::ShaderProgram::copy, njli::ShaderProgram /*Add the children to the njli::ShaderProgram class*/);

%newobject njli::ShaderProgramBuilder::create;
%delobject njli::ShaderProgramBuilder::destroy;
%factory(njli::ShaderProgramBuilder *njli::ShaderProgramBuilder::create, njli::ShaderProgramBuilder /*Add the children to the njli::ShaderProgramBuilder class*/);
%factory(njli::ShaderProgramBuilder *njli::ShaderProgramBuilder::clone, njli::ShaderProgramBuilder /*Add the children to the njli::ShaderProgramBuilder class*/);
%factory(njli::ShaderProgramBuilder *njli::ShaderProgramBuilder::copy, njli::ShaderProgramBuilder /*Add the children to the njli::ShaderProgramBuilder class*/);

%newobject njli::Skinner::create;
%delobject njli::Skinner::destroy;
%factory(njli::Skinner *njli::Skinner::create, njli::Skinner /*Add the children to the njli::Skinner class*/);
%factory(njli::Skinner *njli::Skinner::clone, njli::Skinner /*Add the children to the njli::Skinner class*/);
%factory(njli::Skinner *njli::Skinner::copy, njli::Skinner /*Add the children to the njli::Skinner class*/);

%newobject njli::SkinnerBuilder::create;
%delobject njli::SkinnerBuilder::destroy;
%factory(njli::SkinnerBuilder *njli::SkinnerBuilder::create, njli::SkinnerBuilder /*Add the children to the njli::SkinnerBuilder class*/);
%factory(njli::SkinnerBuilder *njli::SkinnerBuilder::clone, njli::SkinnerBuilder /*Add the children to the njli::SkinnerBuilder class*/);
%factory(njli::SkinnerBuilder *njli::SkinnerBuilder::copy, njli::SkinnerBuilder /*Add the children to the njli::SkinnerBuilder class*/);

%newobject njli::SliderHUD::create;
%delobject njli::SliderHUD::destroy;
%factory(njli::SliderHUD *njli::SliderHUD::create, njli::SliderHUD /*Add the children to the SliderHUD class*/);
%factory(njli::SliderHUD *njli::SliderHUD::clone, njli::SliderHUD /*Add the children to the SliderHUD class*/);
%factory(njli::SliderHUD *njli::SliderHUD::copy, njli::SliderHUD /*Add the children to the SliderHUD class*/);

%newobject njli::SliderHUDBuilder::create;
%delobject njli::SliderHUDBuilder::destroy;
%factory(njli::SliderHUDBuilder *njli::SliderHUDBuilder::create, njli::SliderHUDBuilder /*Add the children to the SliderHUDBuilder class*/);
%factory(njli::SliderHUDBuilder *njli::SliderHUDBuilder::clone, njli::SliderHUDBuilder /*Add the children to the SliderHUDBuilder class*/);
%factory(njli::SliderHUDBuilder *njli::SliderHUDBuilder::copy, njli::SliderHUDBuilder /*Add the children to the SliderHUDBuilder class*/);

%newobject njli::SoundBuilder::create;
%delobject njli::SoundBuilder::destroy;
%factory(njli::SoundBuilder *njli::SoundBuilder::create, njli::SoundBuilder /*Add the children to the njli::SoundBuilder class*/);
%factory(njli::SoundBuilder *njli::SoundBuilder::clone, njli::SoundBuilder /*Add the children to the njli::SoundBuilder class*/);
%factory(njli::SoundBuilder *njli::SoundBuilder::copy, njli::SoundBuilder /*Add the children to the njli::SoundBuilder class*/);

%newobject njli::Sprite2D::create;
%delobject njli::Sprite2D::destroy;
%factory(njli::Sprite2D *njli::Sprite2D::create, njli::Sprite2D /*Add the children to the njli::Sprite2D class*/);
%factory(njli::Sprite2D *njli::Sprite2D::clone, njli::Sprite2D /*Add the children to the njli::Sprite2D class*/);
%factory(njli::Sprite2D *njli::Sprite2D::copy, njli::Sprite2D /*Add the children to the njli::Sprite2D class*/);

%newobject njli::Sprite2DBuilder::create;
%delobject njli::Sprite2DBuilder::destroy;
%factory(njli::Sprite2DBuilder *njli::Sprite2DBuilder::create, njli::Sprite2DBuilder /*Add the children to the njli::Sprite2DBuilder class*/);
%factory(njli::Sprite2DBuilder *njli::Sprite2DBuilder::clone, njli::Sprite2DBuilder /*Add the children to the njli::Sprite2DBuilder class*/);
%factory(njli::Sprite2DBuilder *njli::Sprite2DBuilder::copy, njli::Sprite2DBuilder /*Add the children to the njli::Sprite2DBuilder class*/);

%newobject njli::SpriteFrameAtlas::create;
%delobject njli::SpriteFrameAtlas::destroy;
%factory(njli::SpriteFrameAtlas *njli::SpriteFrameAtlas::create, njli::SpriteFrameAtlas /*Add the children to the njli::SpriteFrameAtlas class*/);
%factory(njli::SpriteFrameAtlas *njli::SpriteFrameAtlas::clone, njli::SpriteFrameAtlas /*Add the children to the njli::SpriteFrameAtlas class*/);
%factory(njli::SpriteFrameAtlas *njli::SpriteFrameAtlas::copy, njli::SpriteFrameAtlas /*Add the children to the njli::SpriteFrameAtlas class*/);

%newobject njli::SpriteFrameAtlasBuilder::create;
%delobject njli::SpriteFrameAtlasBuilder::destroy;
%factory(njli::SpriteFrameAtlasBuilder *njli::SpriteFrameAtlasBuilder::create, njli::SpriteFrameAtlasBuilder /*Add the children to the njli::SpriteFrameAtlasBuilder class*/);
%factory(njli::SpriteFrameAtlasBuilder *njli::SpriteFrameAtlasBuilder::clone, njli::SpriteFrameAtlasBuilder /*Add the children to the njli::SpriteFrameAtlasBuilder class*/);
%factory(njli::SpriteFrameAtlasBuilder *njli::SpriteFrameAtlasBuilder::copy, njli::SpriteFrameAtlasBuilder /*Add the children to the njli::SpriteFrameAtlasBuilder class*/);

%newobject njli::StopWatch::create;
%delobject njli::StopWatch::destroy;
%factory(njli::StopWatch *njli::StopWatch::create, njli::StopWatch /*Add the children to the njli::StopWatch class*/);
%factory(njli::StopWatch *njli::StopWatch::clone, njli::StopWatch /*Add the children to the njli::StopWatch class*/);
%factory(njli::StopWatch *njli::StopWatch::copy, njli::StopWatch /*Add the children to the njli::StopWatch class*/);

%newobject njli::StopWatchBuilder::create;
%delobject njli::StopWatchBuilder::destroy;
%factory(njli::StopWatchBuilder *njli::StopWatchBuilder::create, njli::StopWatchBuilder /*Add the children to the njli::StopWatchBuilder class*/);
%factory(njli::StopWatchBuilder *njli::StopWatchBuilder::clone, njli::StopWatchBuilder /*Add the children to the njli::StopWatchBuilder class*/);
%factory(njli::StopWatchBuilder *njli::StopWatchBuilder::copy, njli::StopWatchBuilder /*Add the children to the njli::StopWatchBuilder class*/);

%newobject njli::TextboxHUD::create;
%delobject njli::TextboxHUD::destroy;
%factory(njli::TextboxHUD *njli::TextboxHUD::create, njli::TextboxHUD /*Add the children to the TextboxHUD class*/);
%factory(njli::TextboxHUD *njli::TextboxHUD::clone, njli::TextboxHUD /*Add the children to the TextboxHUD class*/);
%factory(njli::TextboxHUD *njli::TextboxHUD::copy, njli::TextboxHUD /*Add the children to the TextboxHUD class*/);

%newobject njli::TextHUDBuilder::create;
%delobject njli::TextHUDBuilder::destroy;
%factory(njli::TextHUDBuilder *njli::TextHUDBuilder::create, njli::TextHUDBuilder /*Add the children to the TextHUDBuilder class*/);
%factory(njli::TextHUDBuilder *njli::TextHUDBuilder::clone, njli::TextHUDBuilder /*Add the children to the TextHUDBuilder class*/);
%factory(njli::TextHUDBuilder *njli::TextHUDBuilder::copy, njli::TextHUDBuilder /*Add the children to the TextHUDBuilder class*/);

%newobject njli::Timer::create;
%delobject njli::Timer::destroy;
%factory(njli::Timer *njli::Timer::create, njli::Timer /*Add the children to the njli::Timer class*/);
%factory(njli::Timer *njli::Timer::clone, njli::Timer /*Add the children to the njli::Timer class*/);
%factory(njli::Timer *njli::Timer::copy, njli::Timer /*Add the children to the njli::Timer class*/);

%newobject njli::TimerBuilder::create;
%delobject njli::TimerBuilder::destroy;
%factory(njli::TimerBuilder *njli::TimerBuilder::create, njli::TimerBuilder /*Add the children to the njli::TimerBuilder class*/);
%factory(njli::TimerBuilder *njli::TimerBuilder::clone, njli::TimerBuilder /*Add the children to the njli::TimerBuilder class*/);
%factory(njli::TimerBuilder *njli::TimerBuilder::copy, njli::TimerBuilder /*Add the children to the njli::TimerBuilder class*/);

%newobject njli::WorldState::create;
%delobject njli::WorldState::destroy;
%factory(njli::WorldState *njli::WorldState::create, njli::WorldState /*Add the children to the njli::WorldState class*/);
%factory(njli::WorldState *njli::WorldState::clone, njli::WorldState /*Add the children to the njli::WorldState class*/);
%factory(njli::WorldState *njli::WorldState::copy, njli::WorldState /*Add the children to the njli::WorldState class*/);

%newobject njli::WorldStateBuilder::create;
%delobject njli::WorldStateBuilder::destroy;
%factory(njli::WorldStateBuilder *njli::WorldStateBuilder::create, njli::WorldStateBuilder /*Add the children to the njli::WorldStateBuilder class*/);
%factory(njli::WorldStateBuilder *njli::WorldStateBuilder::clone, njli::WorldStateBuilder /*Add the children to the njli::WorldStateBuilder class*/);
%factory(njli::WorldStateBuilder *njli::WorldStateBuilder::copy, njli::WorldStateBuilder /*Add the children to the njli::WorldStateBuilder class*/);

%newobject njli::WorldStateMachine::create;
%delobject njli::WorldStateMachine::destroy;
%factory(njli::WorldStateMachine *njli::WorldStateMachine::create, njli::WorldStateMachine /*Add the children to the njli::WorldStateMachine class*/);
%factory(njli::WorldStateMachine *njli::WorldStateMachine::clone, njli::WorldStateMachine /*Add the children to the njli::WorldStateMachine class*/);
%factory(njli::WorldStateMachine *njli::WorldStateMachine::copy, njli::WorldStateMachine /*Add the children to the njli::WorldStateMachine class*/);

%newobject njli::WorldStateMachineBuilder::create;
%delobject njli::WorldStateMachineBuilder::destroy;
%factory(njli::WorldStateMachineBuilder *njli::WorldStateMachineBuilder::create, njli::WorldStateMachineBuilder /*Add the children to the njli::WorldStateMachineBuilder class*/);
%factory(njli::WorldStateMachineBuilder *njli::WorldStateMachineBuilder::clone, njli::WorldStateMachineBuilder /*Add the children to the njli::WorldStateMachineBuilder class*/);
%factory(njli::WorldStateMachineBuilder *njli::WorldStateMachineBuilder::copy, njli::WorldStateMachineBuilder /*Add the children to the njli::WorldStateMachineBuilder class*/);

%newobject njli::Xml::create;
%delobject njli::Xml::destroy;
%factory(njli::Xml *njli::Xml::create, njli::Xml /*Add the children to the njli::Xml class*/);
%factory(njli::Xml *njli::Xml::clone, njli::Xml /*Add the children to the njli::Xml class*/);
%factory(njli::Xml *njli::Xml::copy, njli::Xml /*Add the children to the njli::Xml class*/);

%newobject njli::XmlBuilder::create;
%delobject njli::XmlBuilder::destroy;
%factory(njli::XmlBuilder *njli::XmlBuilder::create, njli::XmlBuilder /*Add the children to the njli::XmlBuilder class*/);
%factory(njli::XmlBuilder *njli::XmlBuilder::clone, njli::XmlBuilder /*Add the children to the njli::XmlBuilder class*/);
%factory(njli::XmlBuilder *njli::XmlBuilder::copy, njli::XmlBuilder /*Add the children to the njli::XmlBuilder class*/);

%newobject njli::WorldFactory::create;
%delobject njli::WorldFactory::destroy;
%factory(njli::AbstractFactoryObject *njli::WorldFactory::create,
         njli::Action,
         njli::ActionBuilder,
         njli::Camera,
         njli::CameraBuilder,
         njli::Clock,
         njli::ClockBuilder,
         njli::CollisionResponse,
         njli::CollisionResponseBuilder,
         njli::Cube,
         njli::CubeBuilder,
         njli::Font,
         njli::FontBuilder,
         njli::Image,
         njli::ImageBuilder,
         njli::JsonJLI,
         njli::JsonJLIBuilder,
         njli::Light,
         njli::LightBuilder,
         njli::LevelOfDetail,
         njli::LevelOfDetailBuilder,
         njli::Lua,
         njli::LuaBuilder,
         njli::Material,
         njli::MaterialBuilder,
         njli::MaterialProperty,
         njli::MaterialPropertyBuilder,
         njli::Node,
         njli::NodeBuilder,
         njli::NodeState,
         njli::NodeStateBuilder,
         njli::NodeStateMachine,
         njli::NodeStateMachineBuilder,
         njli::ParticleEmitter,
         njli::ParticleEmitterBuilder,
         njli::PhysicsBodyGhost,
         njli::PhysicsBodyGhostBuilder,
         njli::PhysicsBodyRigid,
         njli::PhysicsBodyRigidBuilder,
         njli::PhysicsBodySoft,
         njli::PhysicsBodySoftBuilder,
         njli::PhysicsConstraint,
         njli::PhysicsConstraintBuilder,
         njli::PhysicsConstraintHinge,
         njli::PhysicsConstraintHingeBuilder,
         njli::PhysicsConstraintPointToPoint,
         njli::PhysicsConstraintPointToPointBuilder,
         
         njli::PhysicsConstraintSlider,
         njli::PhysicsConstraintSliderBuilder,
         njli::PhysicsConstraintConeTwist,
         njli::PhysicsConstraintConeTwistBuilder,
         njli::PhysicsConstraintFixed,
         njli::PhysicsConstraintFixedBuilder,
         njli::PhysicsConstraintGeneric6Dof,
         njli::PhysicsConstraintGeneric6DofBuilder,
         njli::PhysicsConstraintGeneric6DofSpring,
         njli::PhysicsConstraintGeneric6DofSpringBuilder,
         
         njli::PhysicsCloseContact,
         njli::PhysicsCloseContactBuilder,
         njli::PhysicsContact,
         njli::PhysicsContactBuilder,
         njli::PhysicsField,
         njli::PhysicsFieldBuilder,
         njli::PhysicsRayContact,
         njli::PhysicsRayContactBuilder,
         njli::PhysicsShapeBox,
         njli::PhysicsShapeBoxBuilder,
         njli::PhysicsShapeBox2D,
         njli::PhysicsShapeBox2DBuilder,
         
        njli::PhysicsShapeSphere,
        njli::PhysicsShapeSphereBuilder,
        njli::PhysicsShapeCylinder,
        njli::PhysicsShapeCylinderBuilder,
        njli::PhysicsShapeCapsule,
        njli::PhysicsShapeCapsuleBuilder,
        njli::PhysicsShapeCone,
        njli::PhysicsShapeConeBuilder,
        njli::PhysicsShapeMultiSphere,
        njli::PhysicsShapeMultiSphereBuilder,
        njli::PhysicsShapeConvexHull,
        njli::PhysicsShapeConvexHullBuilder,
        njli::PhysicsShapeConvexTriangleMesh,
        njli::PhysicsShapeConvexTriangleMeshBuilder,
        njli::PhysicsShapeBvhTriangleMesh,
        njli::PhysicsShapeBvhTriangleMeshBuilder,
        njli::PhysicsShapeHeightfieldTerrain,
        njli::PhysicsShapeHeightfieldTerrainBuilder,
        njli::PhysicsShapeStaticPlane,
        njli::PhysicsShapeStaticPlaneBuilder,

         
         njli::PhysicsWorld,
         njli::PhysicsWorldBuilder,
         njli::Plane,
         njli::PlaneBuilder,
         njli::Scene,
         njli::SceneBuilder,
         njli::SceneState,
         njli::SceneStateBuilder,
         njli::SceneStateMachine,
         njli::SceneStateMachineBuilder,
         njli::ShaderProgram,
         njli::ShaderProgramBuilder,
         njli::Skinner,
         njli::SkinnerBuilder,
         njli::Sound,
         njli::SoundBuilder,
         njli::Sprite2D,
         njli::Sprite2DBuilder,
         njli::SpriteFrameAtlas,
         njli::SpriteFrameAtlasBuilder,
         njli::StopWatch,
         njli::StopWatchBuilder,
         njli::Timer,
         njli::TimerBuilder,
         njli::WorldState,
         njli::WorldStateBuilder,
         njli::WorldStateMachine,
         njli::WorldStateMachineBuilder,
         njli::Xml,
         njli::XmlBuilder);

%factory(njli::WorldFactory *njli::WorldFactory::clone,
         njli::Action,
         njli::ActionBuilder,
         njli::Camera,
         njli::CameraBuilder,
         njli::Clock,
         njli::ClockBuilder,
         njli::CollisionResponse,
         njli::CollisionResponseBuilder,
         njli::Cube,
         njli::CubeBuilder,
         njli::Font,
         njli::FontBuilder,
         njli::Image,
         njli::ImageBuilder,
         njli::JsonJLI,
         njli::JsonJLIBuilder,
         njli::Light,
         njli::LightBuilder,
         njli::LevelOfDetail,
         njli::LevelOfDetailBuilder,
         njli::Lua,
         njli::LuaBuilder,
         njli::Material,
         njli::MaterialBuilder,
         njli::MaterialProperty,
         njli::MaterialPropertyBuilder,
         njli::Node,
         njli::NodeBuilder,
         njli::NodeState,
         njli::NodeStateBuilder,
         njli::NodeStateMachine,
         njli::NodeStateMachineBuilder,
         njli::ParticleEmitter,
         njli::ParticleEmitterBuilder,
         njli::PhysicsBodyGhost,
         njli::PhysicsBodyGhostBuilder,
         njli::PhysicsBodyRigid,
         njli::PhysicsBodyRigidBuilder,
         njli::PhysicsBodySoft,
         njli::PhysicsBodySoftBuilder,
         njli::PhysicsCloseContact,
         njli::PhysicsCloseContactBuilder,
         njli::PhysicsContact,
         njli::PhysicsContactBuilder,
         njli::PhysicsField,
         njli::PhysicsFieldBuilder,
         njli::PhysicsRayContact,
         njli::PhysicsRayContactBuilder,
         njli::PhysicsShapeBox,
         njli::PhysicsShapeBoxBuilder,
         njli::PhysicsShapeBox2D,
         njli::PhysicsShapeBox2DBuilder,
         
        njli::PhysicsShapeSphere,
        njli::PhysicsShapeSphereBuilder,
        njli::PhysicsShapeCylinder,
        njli::PhysicsShapeCylinderBuilder,
        njli::PhysicsShapeCapsule,
        njli::PhysicsShapeCapsuleBuilder,
        njli::PhysicsShapeCone,
        njli::PhysicsShapeConeBuilder,
        njli::PhysicsShapeMultiSphere,
        njli::PhysicsShapeMultiSphereBuilder,
        njli::PhysicsShapeConvexHull,
        njli::PhysicsShapeConvexHullBuilder,
        njli::PhysicsShapeConvexTriangleMesh,
        njli::PhysicsShapeConvexTriangleMeshBuilder,
        njli::PhysicsShapeBvhTriangleMesh,
        njli::PhysicsShapeBvhTriangleMeshBuilder,
        njli::PhysicsShapeHeightfieldTerrain,
        njli::PhysicsShapeHeightfieldTerrainBuilder,
        njli::PhysicsShapeStaticPlane,
        njli::PhysicsShapeStaticPlaneBuilder,

         
         njli::PhysicsWorld,
         njli::PhysicsWorldBuilder,
         njli::Plane,
         njli::PlaneBuilder,
         njli::Scene,
         njli::SceneBuilder,
         njli::SceneState,
         njli::SceneStateBuilder,
         njli::SceneStateMachine,
         njli::SceneStateMachineBuilder,
         njli::ShaderProgram,
         njli::ShaderProgramBuilder,
         njli::Skinner,
         njli::SkinnerBuilder,
         njli::Sound,
         njli::SoundBuilder,
         njli::Sprite2D,
         njli::Sprite2DBuilder,
         njli::SpriteFrameAtlas,
         njli::SpriteFrameAtlasBuilder,
         njli::StopWatch,
         njli::StopWatchBuilder,
         njli::Timer,
         njli::TimerBuilder,
         njli::WorldState,
         njli::WorldStateBuilder,
         njli::WorldStateMachine,
         njli::WorldStateMachineBuilder,
         njli::Xml,
         njli::XmlBuilder);

#include "JLIEngine.h"

%rename(__getitem) *::getitem; // the v=X[i] (get operator)
%rename(__setitem) *::setitem; // the X[i]=v (set operator)













%jli_array_functions(njli::Action, ActionArray);
%jli_array_functions(njli::ActionBuilder, ActionBuilderArray);
%jli_array_functions(njli::ButtonHUD, ButtonHUDArray);
%jli_array_functions(njli::ButtonHUDBuilder, ButtonHUDBuilderArray);
%jli_array_functions(njli::Camera, CameraArray);
%jli_array_functions(njli::CameraBuilder, CameraBuilderArray);
%jli_array_functions(njli::CheckboxHUD, CheckboxHUDArray);
%jli_array_functions(njli::CheckboxHUDBuilder, CheckboxHUDBuilderArray);
%jli_array_functions(njli::Clock, ClockArray);
%jli_array_functions(njli::ClockBuilder, ClockBuilderArray);
%jli_array_functions(njli::CollisionResponse, CollisionResponseArray);
%jli_array_functions(njli::CollisionResponseBuilder, CollisionResponseBuilderArray);
%jli_array_functions(njli::Cube, CubeArray);
%jli_array_functions(njli::CubeBuilder, CubeBuilderArray);
%jli_array_functions(njli::DropdownHUD, DropdownHUDArray);
%jli_array_functions(njli::DropdownHUDBuilder, DropdownHUDBuilderArray);
%jli_array_functions(njli::Font, FontArray);
%jli_array_functions(njli::FontBuilder, FontBuilderArray);
%jli_array_functions(njli::Image, ImageArray);
%jli_array_functions(njli::ImageBuilder, ImageBuilderArray);
%jli_array_functions(njli::JsonJLI, JsonJLIArray);
%jli_array_functions(njli::JsonJLIBuilder, JsonJLIBuilderArray);
%jli_array_functions(njli::LabelHUD, LabelHUDArray);
%jli_array_functions(njli::LabelHUDBuilder, LabelHUDBuilderArray);
%jli_array_functions(njli::Light, LightArray);
%jli_array_functions(njli::LightBuilder, LightBuilderArray);
%jli_array_functions(njli::LevelOfDetail, LevelOfDetailArray);
%jli_array_functions(njli::LevelOfDetailBuilder, LevelOfDetailBuilderArray);
%jli_array_functions(njli::Lua, LuaArray);
%jli_array_functions(njli::LuaBuilder, LuaBuilderArray);
%jli_array_functions(njli::Material, MaterialArray);
%jli_array_functions(njli::MaterialBuilder, MaterialBuilderArray);
%jli_array_functions(njli::MaterialProperty, MaterialPropertyArray);
%jli_array_functions(njli::MaterialPropertyBuilder, MaterialPropertyBuilderArray);
%jli_array_functions(njli::Node, NodeArray);
%jli_array_functions(njli::NodeBuilder, NodeBuilderArray);
%jli_array_functions(njli::NodeState, NodeStateArray);
%jli_array_functions(njli::NodeStateBuilder, NodeStateBuilderArray);
%jli_array_functions(njli::NodeStateMachine, NodeStateMachineArray);
%jli_array_functions(njli::NodeStateMachineBuilder, NodeStateMachineBuilderArray);
%jli_array_functions(njli::ParticleEmitter, ParticleEmitterArray);
%jli_array_functions(njli::ParticleEmitterBuilder, ParticleEmitterBuilderArray);
%jli_array_functions(njli::PhysicsBodyGhost, PhysicsBodyGhostArray);
%jli_array_functions(njli::PhysicsBodyGhostBuilder, PhysicsBodyGhostBuilderArray);
%jli_array_functions(njli::PhysicsBodyRigid, PhysicsBodyRigidArray);
%jli_array_functions(njli::PhysicsBodyRigidBuilder, PhysicsBodyRigidBuilderArray);
%jli_array_functions(njli::PhysicsBodySoft, PhysicsBodySoftArray);
%jli_array_functions(njli::PhysicsBodySoftBuilder, PhysicsBodySoftBuilderArray);
%jli_array_functions(njli::PhysicsConstraint, PhysicsConstraintArray);
%jli_array_functions(njli::PhysicsConstraintBuilder, PhysicsConstraintBuilderArray);

%jli_array_functions(njli::PhysicsConstraintHinge, PhysicsConstraintHingeArray);
%jli_array_functions(njli::PhysicsConstraintHingeBuilder, PhysicsConstraintHingeBuilderArray);


%jli_array_functions(njli::PhysicsConstraintPointToPoint, PhysicsConstraintPointToPointArray);
%jli_array_functions(njli::PhysicsConstraintPointToPointBuilder, PhysicsConstraintPointToPointBuilderArray);


%jli_array_functions(njli::PhysicsConstraintSlider, PhysicsConstraintSliderArray);
%jli_array_functions(njli::PhysicsConstraintSliderBuilder, PhysicsConstraintSliderBuilderArray);
%jli_array_functions(njli::PhysicsConstraintConeTwist, PhysicsConstraintConeTwistArray);
%jli_array_functions(njli::PhysicsConstraintConeTwistBuilder, PhysicsConstraintConeTwistBuilderArray);
%jli_array_functions(njli::PhysicsConstraintFixed, PhysicsConstraintFixedArray);
%jli_array_functions(njli::PhysicsConstraintFixedBuilder, PhysicsConstraintFixedBuilderArray);
%jli_array_functions(njli::PhysicsConstraintGeneric6Dof, PhysicsConstraintGeneric6DofArray);
%jli_array_functions(njli::PhysicsConstraintGeneric6DofBuilder, PhysicsConstraintGeneric6DofBuilderArray);
%jli_array_functions(njli::PhysicsConstraintGeneric6DofSpring, PhysicsConstraintGeneric6DofSpringArray);
%jli_array_functions(njli::PhysicsConstraintGeneric6DofSpringBuilder, PhysicsConstraintGeneric6DofSpringBuilderArray);



%jli_array_functions(njli::PhysicsCloseContact, PhysicsCloseContactArray);
%jli_array_functions(njli::PhysicsCloseContactBuilder, PhysicsCloseContactBuilderArray);
%jli_array_functions(njli::PhysicsContact, PhysicsContactArray);
%jli_array_functions(njli::PhysicsContactBuilder, PhysicsContactBuilderArray);
%jli_array_functions(njli::PhysicsField, PhysicsFieldArray);
%jli_array_functions(njli::PhysicsFieldBuilder, PhysicsFieldBuilderArray);
%jli_array_functions(njli::PhysicsRayContact, PhysicsRayContactArray);
%jli_array_functions(njli::PhysicsRayContactBuilder, PhysicsRayContactBuilderArray);
%jli_array_functions(njli::PhysicsShapeBox, PhysicsShapeBoxArray);
%jli_array_functions(njli::PhysicsShapeBoxBuilder, PhysicsShapeBoxBuilderArray);
%jli_array_functions(njli::PhysicsShapeBox2D, PhysicsShapeBox2DArray);
%jli_array_functions(njli::PhysicsShapeBox2DBuilder, PhysicsShapeBox2DBuilderArray);

%jli_array_functions(njli::PhysicsShapeSphere, PhysicsShapeSphereArray);
%jli_array_functions(njli::PhysicsShapeSphereBuilder, PhysicsShapeSphereBuilderArray);
%jli_array_functions(njli::PhysicsShapeCylinder, PhysicsShapeCylinderArray);
%jli_array_functions(njli::PhysicsShapeCylinderBuilder, PhysicsShapeCylinderBuilderArray);
%jli_array_functions(njli::PhysicsShapeCapsule, PhysicsShapeCapsuleArray);
%jli_array_functions(njli::PhysicsShapeCapsuleBuilder, PhysicsShapeCapsuleBuilderArray);
%jli_array_functions(njli::PhysicsShapeCone, PhysicsShapeConeArray);
%jli_array_functions(njli::PhysicsShapeConeBuilder, PhysicsShapeConeBuilderArray);
%jli_array_functions(njli::PhysicsShapeMultiSphere, PhysicsShapeMultiSphereArray);
%jli_array_functions(njli::PhysicsShapeMultiSphereBuilder, PhysicsShapeMultiSphereBuilderArray);
%jli_array_functions(njli::PhysicsShapeConvexHull, PhysicsShapeConvexHullArray);
%jli_array_functions(njli::PhysicsShapeConvexHullBuilder, PhysicsShapeConvexHullBuilderArray);
%jli_array_functions(njli::PhysicsShapeConvexTriangleMesh, PhysicsShapeConvexTriangleMeshArray);
%jli_array_functions(njli::PhysicsShapeConvexTriangleMeshBuilder, PhysicsShapeConvexTriangleMeshBuilderArray);
%jli_array_functions(njli::PhysicsShapeBvhTriangleMesh, PhysicsShapeBvhTriangleMeshArray);
%jli_array_functions(njli::PhysicsShapeBvhTriangleMeshBuilder, PhysicsShapeBvhTriangleMeshBuilderArray);
%jli_array_functions(njli::PhysicsShapeHeightfieldTerrain, PhysicsShapeHeightfieldTerrainArray);
%jli_array_functions(njli::PhysicsShapeHeightfieldTerrainBuilder, PhysicsShapeHeightfieldTerrainBuilderArray);
%jli_array_functions(njli::PhysicsShapeStaticPlane, PhysicsShapeStaticPlaneArray);
%jli_array_functions(njli::PhysicsShapeStaticPlaneBuilder, PhysicsShapeStaticPlaneBuilderArray);



%jli_array_functions(njli::PhysicsWorld, PhysicsWorldArray);
%jli_array_functions(njli::PhysicsWorldBuilder, PhysicsWorldBuilderArray);
%jli_array_functions(njli::Plane, PlaneArray);
%jli_array_functions(njli::PlaneBuilder, PlaneBuilderArray);
%jli_array_functions(njli::Scene, SceneArray);
%jli_array_functions(njli::SceneBuilder, SceneBuilderArray);
%jli_array_functions(njli::SceneState, SceneStateArray);
%jli_array_functions(njli::SceneStateBuilder, SceneStateBuilderArray);
%jli_array_functions(njli::SceneStateMachine, SceneStateMachineArray);
%jli_array_functions(njli::SceneStateMachineBuilder, SceneStateMachineBuilderArray);
%jli_array_functions(njli::ShaderProgram, ShaderProgramArray);
%jli_array_functions(njli::ShaderProgramBuilder, ShaderProgramBuilderArray);
%jli_array_functions(njli::Skinner, SkinnerArray);
%jli_array_functions(njli::SkinnerBuilder, SkinnerBuilderArray);
%jli_array_functions(njli::SliderHUD, SliderHUDArray);
%jli_array_functions(njli::SliderHUDBuilder, SliderHUDBuilderArray);
%jli_array_functions(njli::Sound, SoundArray);
%jli_array_functions(njli::SoundBuilder, SoundBuilderArray);
%jli_array_functions(njli::Sprite2D, Sprite2DArray);
%jli_array_functions(njli::Sprite2DBuilder, Sprite2DBuilderArray);
%jli_array_functions(njli::SpriteFrameAtlas, SpriteFrameAtlasArray);
%jli_array_functions(njli::SpriteFrameAtlasBuilder, SpriteFrameAtlasBuilderArray);
%jli_array_functions(njli::StopWatch, StopWatchArray);
%jli_array_functions(njli::StopWatchBuilder, StopWatchBuilderArray);
%jli_array_functions(njli::TextboxHUD, TextboxHUDArray);
%jli_array_functions(njli::TextboxHUDBuilder, TextboxHUDBuilderArray);
%jli_array_functions(njli::Timer, TimerArray);
%jli_array_functions(njli::TimerBuilder, TimerBuilderArray);
%jli_array_functions(njli::WorldState, WorldStateArray);
%jli_array_functions(njli::WorldStateBuilder, WorldStateBuilderArray);
%jli_array_functions(njli::WorldStateMachine, WorldStateMachineArray);
%jli_array_functions(njli::WorldStateMachineBuilder, WorldStateMachineBuilderArray);
%jli_array_functions(njli::Xml, XmlArray);
%jli_array_functions(njli::XmlBuilder, XmlBuilderArray);



%extend njli::PhysicsBody
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
};

%extend njli::World
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

%extend njli::WorldFactory
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

%extend njli::WorldLuaVirtualMachine
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

%extend njli::WorldResourceLoader
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

%extend njli::WorldSocket
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

%extend njli::WorldHUD
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

%extend njli::WorldClock
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

%extend njli::Geometry
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
    
    njli::LevelOfDetail **getLevelOfDetails()const
    {
        std::vector<njli::LevelOfDetail*> items;
        self->getLevelOfDetails(items);
        size_t nelements = items.size();
        
//        njli::LevelOfDetail **ret = (njli::LevelOfDetail**)(njli::World::getInstance()->getWorldFactory()->createArray(njli::LevelOfDetail::type(), nelements));
        njli::LevelOfDetail **ret = (njli::LevelOfDetail**)njli::LevelOfDetail::createArray(nelements);
        for (s32 i = 0; i < nelements; i++)
            ret[i] = items[i];
        
        return ret;
    }
}

%extend njli::PhysicsShape
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

%extend njli::Action
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

%extend njli::ActionBuilder
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

%extend njli::Camera
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

%extend njli::CameraBuilder
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

%extend njli::Clock
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

%extend njli::ClockBuilder
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

%extend njli::CollisionResponse
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

%extend njli::CollisionResponseBuilder
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

%extend njli::Cube
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

%extend njli::CubeBuilder
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

%extend njli::Font
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

%extend njli::FontBuilder
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

%extend njli::Image
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

%extend njli::ImageBuilder
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

%extend njli::JsonJLI
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

%extend njli::JsonJLIBuilder
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

%extend njli::LightBuilder
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

%extend njli::LevelOfDetail
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

%extend njli::LevelOfDetailBuilder
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

%extend njli::Lua
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

%extend njli::LuaBuilder
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

%extend njli::Material
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

%extend njli::MaterialBuilder
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

%extend njli::MaterialProperty
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

%extend njli::MaterialPropertyBuilder
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


%extend njli::Node
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
    
    njli::Node **getChildrenNodes()const
    {
        std::vector<njli::Node*> children;
        self->getChildrenNodes(children);
        size_t nelements = children.size();
        
//        njli::Node **ret = (njli::Node**)(njli::World::getInstance()->getWorldFactory()->createArray(njli::Node::type(), nelements));
        njli::Node **ret = (njli::Node**)njli::Node::createArray(nelements);
        
        for (s32 i = 0; i < nelements; i++)
            ret[i] = children[i];
        
        return ret;
    }
    
    njli::ParticleEmitter **getParticleEmitters()const
    {
        std::vector<njli::ParticleEmitter*> items;
        self->getParticleEmitters(items);
        size_t nelements = items.size();
        
//        njli::ParticleEmitter **ret = (njli::ParticleEmitter**)(njli::World::getInstance()->getWorldFactory()->createArray(njli::ParticleEmitter::type(), nelements));
     
        njli::ParticleEmitter **ret = (njli::ParticleEmitter**)njli::ParticleEmitter::createArray(nelements);
        
        for (s32 i = 0; i < nelements; i++)
            ret[i] = items[i];
        
        return ret;
    }
    
    njli::Sound **getSounds()const
    {
        std::vector<njli::Sound*> items;
        self->getSounds(items);
        size_t nelements = items.size();
        
//        njli::Sound **ret = (njli::Sound**)(njli::World::getInstance()->getWorldFactory()->createArray(njli::Sound::type(), nelements));
        njli::Sound **ret = (njli::Sound**)njli::Sound::createArray(nelements);
        
        for (s32 i = 0; i < nelements; i++)
            ret[i] = items[i];
        
        return ret;
    }
}

%extend njli::NodeBuilder
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

%extend njli::NodeState
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

%extend njli::NodeStateBuilder
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

%extend njli::NodeStateMachine
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

%extend njli::NodeStateMachineBuilder
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

%extend njli::ParticleEmitter
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

%extend njli::ParticleEmitterBuilder
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

%extend njli::PhysicsBody
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

%extend njli::PhysicsBodyGhost
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

%extend njli::PhysicsBodyGhostBuilder
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

%extend njli::PhysicsBodyRigid
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

%extend njli::PhysicsBodyRigidBuilder
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

%extend njli::PhysicsBodySoft
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

%extend njli::PhysicsBodySoftBuilder
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








%extend njli::PhysicsBodySoft
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

%extend njli::PhysicsBodySoftBuilder
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




































%extend njli::PhysicsConstraint
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

%extend njli::PhysicsConstraintBuilder
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









%extend njli::PhysicsConstraintHinge
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

%extend njli::PhysicsConstraintHingeBuilder
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























%extend njli::PhysicsConstraintPointToPoint
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

%extend njli::PhysicsConstraintPointToPointBuilder
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



%extend njli::PhysicsConstraintSlider
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

%extend njli::PhysicsConstraintSliderBuilder
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


%extend njli::PhysicsConstraintConeTwist
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

%extend njli::PhysicsConstraintConeTwistBuilder
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


%extend njli::PhysicsConstraintFixed
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

%extend njli::PhysicsConstraintFixedBuilder
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


%extend njli::PhysicsConstraintGeneric6Dof
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

%extend njli::PhysicsConstraintGeneric6DofBuilder
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


%extend njli::PhysicsConstraintGeneric6DofSpring
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

%extend njli::PhysicsConstraintGeneric6DofSpringBuilder
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












%extend njli::PhysicsContact
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

%extend njli::PhysicsContactBuilder
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

%extend njli::PhysicsCloseContact
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

%extend njli::PhysicsCloseContactBuilder
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

%extend njli::PhysicsField
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

%extend njli::PhysicsFieldBuilder
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

%extend njli::PhysicsRayContact
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

%extend njli::PhysicsRayContactBuilder
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

%extend njli::PhysicsShapeBox
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

%extend njli::PhysicsShapeBoxBuilder
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



%extend njli::PhysicsShapeBox2D
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

%extend njli::PhysicsShapeBox2DBuilder
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


























































%extend njli::PhysicsShapeSphere
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

%extend njli::PhysicsShapeSphereBuilder
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

%extend njli::PhysicsShapeCylinder
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

%extend njli::PhysicsShapeCylinderBuilder
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

%extend njli::PhysicsShapeCapsule
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

%extend njli::PhysicsShapeCapsuleBuilder
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

%extend njli::PhysicsShapeCone
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

%extend njli::PhysicsShapeConeBuilder
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

%extend njli::PhysicsShapeMultiSphere
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

%extend njli::PhysicsShapeMultiSphereBuilder
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

%extend njli::PhysicsShapeConvexHull
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

%extend njli::PhysicsShapeConvexHullBuilder
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

%extend njli::PhysicsShapeConvexTriangleMesh
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

%extend njli::PhysicsShapeConvexTriangleMeshBuilder
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

%extend njli::PhysicsShapeBvhTriangleMesh
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

%extend njli::PhysicsShapeBvhTriangleMeshBuilder
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

%extend njli::PhysicsShapeHeightfieldTerrain
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

%extend njli::PhysicsShapeHeightfieldTerrainBuilder
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

%extend njli::PhysicsShapeStaticPlane
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

%extend njli::PhysicsShapeStaticPlaneBuilder
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

































































%extend njli::PhysicsWorld
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

%extend njli::PhysicsWorldBuilder
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

%extend njli::Plane
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

%extend njli::PlaneBuilder
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

%extend njli::Scene
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
    
//    njli::ParticleEmitter **getParticleEmitters()const
//    {
//        std::vector<njli::ParticleEmitter*> items;
//        self->getParticleEmitters(items);
//        size_t nelements = items.size();
//        
//        njli::ParticleEmitter **ret = (njli::ParticleEmitter**)(njli::World::getInstance()->getWorldFactory()->createArray(njli::ParticleEmitter::type(), nelements));
//        
//        for (s32 i = 0; i < nelements; i++)
//            ret[i] = items[i];
//        
//        return ret;
//    }
    
    njli::Clock **getClocks()const
    {
        std::vector<njli::Clock*> items;
        self->getClocks(items);
        size_t nelements = items.size();
        
//        njli::Clock **ret = (njli::Clock**)(njli::World::getInstance()->getWorldFactory()->createArray(njli::Clock::type(), nelements));
        njli::Clock **ret = (njli::Clock**)njli::Clock::createArray(nelements);
        
        for (s32 i = 0; i < nelements; i++)
            ret[i] = items[i];
        
        return ret;
    }
}

%extend njli::SceneBuilder
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

%extend njli::SceneState
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

%extend njli::SceneStateMachine
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

%extend njli::SceneStateMachineBuilder
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

%extend njli::ShaderProgram
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

%extend njli::ShaderProgramBuilder
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

%extend njli::Skinner
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

%extend njli::SkinnerBuilder
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

%extend njli::SoundBuilder
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

%extend njli::Sprite2D
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

%extend njli::Sprite2DBuilder
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

%extend njli::SpriteFrameAtlas
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

%extend njli::SpriteFrameAtlasBuilder
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

%extend njli::StopWatch
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

%extend njli::StopWatchBuilder
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

%extend njli::Timer
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

%extend njli::TimerBuilder
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

%extend njli::WorldState
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

%extend njli::WorldStateBuilder
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

%extend njli::WorldStateMachine
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

%extend njli::WorldStateMachineBuilder
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

%extend njli::Xml
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

%extend njli::XmlBuilder
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

%extend njli::ButtonHUD
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

%extend njli::ButtonHUDBuilder
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

%extend njli::CheckboxHUD
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

%extend njli::CheckboxHUDBuilder
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

%extend njli::DropdownHUD
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

%extend njli::DropdownHUDBuilder
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

%extend njli::LabelHUD
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

%extend njli::LabelHUDBuilder
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

%extend njli::SliderHUD
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

%extend njli::SliderHUDBuilder
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

%extend njli::TextboxHUD
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

%extend njli::TextboxHUDBuilder
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

%include "../bullet/Lua.i"
%include "../platform/Lua.i"



