//
//  WorldLuaVirtualMachine.cpp
//  JLIGameEngineTest
//
//  Created by James Folk on 11/22/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//
//#include <Python/Python.h>
//#define PY_SSIZE_T_CLEAN

//#else

#include "lua.hpp"

#include "WorldLuaVirtualMachine.h"
//#include "SwigLuaWrapper.h"
//#include "njli.h"


#include "Log.h"
#define TAG "WorldLuaVirtualMachine"
#define FORMATSTRING "{\"njli::WorldLuaVirtualMachine\":[]}"
#include "btPrint.h"

#include "File.h"
#include "Util.h"


#include "lua.h"
#include "lauxlib.h"

#include "File.h"
//#include "bit.c"




//#include "JLIEngine.h"

#include "AbstractActionable.h"
#include "AbstractBuilder.h"
#include "AbstractClock.h"
#include "AbstractDecorator.h"
#include "AbstractFactoryObject.h"
#include "AbstractFrameBufferObject.h"
#include "AbstractObject.h"
#include "AbstractRender.h"
#include "AbstractState.h"
#include "AbstractStateMachine.h"
#include "AbstractTransform.h"
#include "Action.h"
#include "ActionBuilder.h"
#include "ButtonHUD.h"
#include "ButtonHUDBuilder.h"
#include "Camera.h"
#include "CameraBuilder.h"
#include "CheckboxHUD.h"
#include "CheckboxHUDBuilder.h"
#include "Clock.h"
#include "ClockBuilder.h"
#include "CollisionResponse.h"
#include "CollisionResponseBuilder.h"
#include "Cube.h"
#include "CubeBuilder.h"
#include "DropdownHUD.h"
#include "DropdownHUDBuilder.h"
#include "Font.h"
#include "FontBuilder.h"
#include "GameClock.h"
#include "Geometry.h"
#include "Image.h"
#include "ImageBuilder.h"
//#include "JLIBuilders.h"
//#include "JLIEngine.h"
#include "JLIFactoryTypes.h"
//#include "JLITransform.h"
#include "JsonJLI.h"
#include "JsonJLIBuilder.h"
#include "LabelHUD.h"
#include "LabelHUDBuilder.h"
#include "LevelOfDetail.h"
#include "LevelOfDetailBuilder.h"
#include "Light.h"
#include "LightBuilder.h"
//#include "Lua.h"
//#include "LuaBuilder.h"
#include "Material.h"
#include "MaterialBuilder.h"
#include "MaterialProperty.h"
#include "MaterialPropertyBuilder.h"
#include "Node.h"
#include "NodeBuilder.h"
#include "NodeState.h"
#include "NodeStateBuilder.h"
#include "NodeStateMachine.h"
#include "NodeStateMachineBuilder.h"
#include "ParticleEmitter.h"
#include "ParticleEmitterBuilder.h"
#include "PhysicsBody.h"
#include "PhysicsBodyGhost.h"
#include "PhysicsBodyGhostBuilder.h"
#include "PhysicsBodyRigid.h"
#include "PhysicsBodyRigidBuilder.h"
#include "PhysicsBodySoft.h"
#include "PhysicsBodySoftBuilder.h"
#include "PhysicsCloseContact.h"
#include "PhysicsCloseContactBuilder.h"
#include "PhysicsConstraint.h"
#include "PhysicsConstraintBuilder.h"
#include "PhysicsConstraintConeTwist.h"
#include "PhysicsConstraintConeTwistBuilder.h"
#include "PhysicsConstraintFixed.h"
#include "PhysicsConstraintFixedBuilder.h"
#include "PhysicsConstraintGeneric6Dof.h"
#include "PhysicsConstraintGeneric6DofBuilder.h"
#include "PhysicsConstraintGeneric6DofSpring.h"
#include "PhysicsConstraintGeneric6DofSpringBuilder.h"
#include "PhysicsConstraintHinge.h"
#include "PhysicsConstraintHingeBuilder.h"
#include "PhysicsConstraintPointToPoint.h"
#include "PhysicsConstraintPointToPointBuilder.h"
#include "PhysicsConstraintSlider.h"
#include "PhysicsConstraintSliderBuilder.h"
#include "PhysicsContact.h"
#include "PhysicsContactBuilder.h"
#include "PhysicsField.h"
#include "PhysicsFieldBuilder.h"
#include "PhysicsRayContact.h"
#include "PhysicsRayContactBuilder.h"
#include "PhysicsShape.h"
#include "PhysicsShapeBox.h"
#include "PhysicsShapeBox2D.h"
#include "PhysicsShapeBox2DBuilder.h"
#include "PhysicsShapeBoxBuilder.h"
#include "PhysicsShapeBvhTriangleMesh.h"
#include "PhysicsShapeBvhTriangleMeshBuilder.h"
#include "PhysicsShapeCapsule.h"
#include "PhysicsShapeCapsuleBuilder.h"
#include "PhysicsShapeCone.h"
#include "PhysicsShapeConeBuilder.h"
#include "PhysicsShapeConvexHull.h"
#include "PhysicsShapeConvexHullBuilder.h"
#include "PhysicsShapeConvexTriangleMesh.h"
#include "PhysicsShapeConvexTriangleMeshBuilder.h"
#include "PhysicsShapeCylinder.h"
#include "PhysicsShapeCylinderBuilder.h"
#include "PhysicsShapeHeightfieldTerrain.h"
#include "PhysicsShapeHeightfieldTerrainBuilder.h"
#include "PhysicsShapeMultiSphere.h"
#include "PhysicsShapeMultiSphereBuilder.h"
#include "PhysicsShapeSphere.h"
#include "PhysicsShapeSphereBuilder.h"
#include "PhysicsShapeStaticPlane.h"
#include "PhysicsShapeStaticPlaneBuilder.h"
#include "PhysicsWorld.h"
#include "PhysicsWorldBuilder.h"
#include "Plane.h"
#include "PlaneBuilder.h"
#include "Scene.h"
#include "SceneBuilder.h"
#include "SceneState.h"
#include "SceneStateBuilder.h"
#include "SceneStateMachine.h"
#include "SceneStateMachineBuilder.h"
#include "ShaderProgram.h"
#include "ShaderProgramBuilder.h"
#include "Skinner.h"
#include "SkinnerBuilder.h"
#include "SliderHUD.h"
#include "SliderHUDBuilder.h"
#include "SoundBuilder.h"
#include "Sprite2D.h"
#include "Sprite2DBuilder.h"
#include "SpriteFrameAtlas.h"
#include "SpriteFrameAtlasBuilder.h"
#include "StopWatch.h"
#include "StopWatchBuilder.h"
#include "TextboxHUD.h"
#include "TextboxHUDBuilder.h"
#include "Thread.h"
#include "ThreadBuilder.h"
#include "Timer.h"
#include "TimerBuilder.h"
#include "World.h"
#include "WorldClock.h"
#include "WorldDebugDrawer.h"
#include "WorldFactory.h"
#include "WorldHUD.h"
#include "WorldLuaVirtualMachine.h"
#include "WorldResourceLoader.h"
#include "WorldSQLite.h"
#include "WorldSocket.h"
#include "WorldState.h"
#include "WorldStateBuilder.h"
#include "WorldStateMachine.h"
#include "WorldStateMachineBuilder.h"
#include "Xml.h"
#include "XmlBuilder.h"
//#########################################################################################################
#include "DeviceInputTime.h"
#include "DeviceTouch.h"
#include "File.h"
//#include "Game.h"
//#include "JLIAssetUtil.h"
//#include "JLIFileUtil.h"
#include "Localization.h"
#include "Log.h"
#include "Macros.h"
#include "Sound.h"
#include "Util.h"
//#include "WorldFacebook.h"
#include "WorldInput.h"
//#include "WorldPythonVirtualMachine.h"
#include "WorldSound.h"


#include "njli_swig_runtime.h"
//#include "njli_swig_types.h"
////#include "swig_type_info.h"
//extern swig_type_info *swig_types[597];

static int appendLuaPath(lua_State* L, const char* path)
{
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "path"); // get field "path" from table at top of stack (-1)
    std::string cur_path = lua_tostring(L, -1); // grab path string from top of stack
    cur_path.append(";"); // do your path magic here
    cur_path.append(path);
    lua_pop(L, 1); // get rid of the string on the stack we just pushed on line 5
    lua_pushstring(L, cur_path.c_str()); // push the new one
    lua_setfield(L, -2, "path"); // set the field "path" in table at -2 with value at top of stack
    lua_pop(L, 1); // get rid of package table from top of stack
    return 0; // all done!
}








/**
 *  Function which can be used to to save the state of the lua stack to
 *  be used later in the execution
 *
 *  @param L          lua state
 *  @param paramIndex the current stack index
 *
 *  @return returns the callback index to be used in callCallbackFunction
 */
static int storeCallbackFunction(lua_State *L, int paramIndex)
{
    if(lua_isfunction(L, paramIndex))
    {
        
        
        //save function for later use
        return luaL_ref(L,LUA_REGISTRYINDEX);
    }
    return 0;
}

static void callCallbackFunction(lua_State *L, int callback_function)
{
    //retrive function and call it
    lua_rawgeti(L,LUA_REGISTRYINDEX,callback_function);
    //push the parameters and call it
    //        lua_pushnumber(L, 5); // push first argument to the function
    //        lua_pcall(L, 1, 0, 0); // call a function with one argument and no return values
    lua_pushnumber(L, 3);
    lua_pushnumber(L, 4);
    lua_call(L,2,0);
}



static void stackDump (lua_State *L) {
    int i;
    int top = lua_gettop(L);
    
    DEBUG_LOG_PRINT_V(TAG, "%s", "\n\n\n ----------------  Stack Dump ----------------\n" );
    DEBUG_LOG_PRINT_V(TAG, "%s", "\n");  /* end the listing */
    for (i = 1; i <= top; i++)
    {  /* repeat for each level */
        int t = lua_type(L, i);
        switch (t) {
                
            case LUA_TSTRING:  /* strings */
                DEBUG_LOG_PRINT_V(TAG, "'%s'\n", lua_tostring(L, i));
                break;
                
            case LUA_TBOOLEAN:  /* booleans */
                DEBUG_LOG_PRINT_V(TAG, "%s", lua_toboolean(L, i) ? "true\n" : "false\n");
                break;
                
            case LUA_TNUMBER:  /* numbers */
                DEBUG_LOG_PRINT_V(TAG, "%g\n", lua_tonumber(L, i));
                break;
                
            default:  /* other values */
                DEBUG_LOG_PRINT_V(TAG, "%s\n", lua_typename(L, t));
                break;
                
        }
//        DEBUG_LOG_PRINT_V(TAG, "  ");  /* put a separator */
    }
    DEBUG_LOG_PRINT_V(TAG, "%s", "\n");  /* end the listing */
    DEBUG_LOG_PRINT_V(TAG, "%s", " --------------- Stack Dump Finished ---------------\n" );
}

//http://giderosmobile.com/forum/discussion/584/passing-a-table-to-c-func-and-back-to-lua-code/p1

typedef void (*luaTableIterFunc)(lua_State*, int, const char *);

static void printLuaTableKeyAndValues(lua_State *L, int index, const char *key)
{
    if(lua_isnumber(L, index))
    {
        double number = lua_tonumber(L, index);
        printf("%s => %f\n", key, number);
    }
    else if(lua_isstring(L, index))
    {
        const char *value = lua_tostring(L, index);
        printf("%s => %s\n", key, value);
    }
    else if(lua_isuserdata(L, index))
    {
        swig_lua_userdata *usr;
        swig_type_info *type;
        DEBUG_ASSERT(lua_isuserdata(L,index));
        usr=(swig_lua_userdata*)lua_touserdata(L,index);  /* get data */
        type = usr->type;
        njli::AbstractFactoryObject *object = static_cast<njli::AbstractFactoryObject*>(usr->ptr);
        printf("%s => %d:%s\n", key, object->getType(), object->getClassName());
        
    }
}

static void iterate_and_print(lua_State *L, int index)
{
    // Push another reference to the table on top of the stack (so we know
    // where it is, and this function can work for negative, positive and
    // pseudo indices
    lua_pushvalue(L, index);
    // stack now contains: -1 => table
    lua_pushnil(L);
    // stack now contains: -1 => nil; -2 => table
    while (lua_next(L, -2))
    {
        // stack now contains: -1 => value; -2 => key; -3 => table
        // copy the key so that lua_tostring does not modify the original
        lua_pushvalue(L, -2);
        // stack now contains: -1 => key; -2 => value; -3 => key; -4 => table
        const char *key = lua_tostring(L, -1);
        const char *value = lua_tostring(L, -2);
        if(lua_istable(L, -2))
        {
            iterate_and_print(L, -2);
        }
        else
        {
            if(lua_isnumber(L, index))
            {
                double number = lua_tonumber(L, index);
                printf("%s => %f\n", key, number);
            }
            else if(lua_isstring(L, index))
            {
                const char *value = lua_tostring(L, index);
                printf("%s => %s\n", key, value);
            }
            else if(lua_isuserdata(L, index))
            {
                swig_lua_userdata *usr;
                swig_type_info *type;
                DEBUG_ASSERT(lua_isuserdata(L,index));
                usr=(swig_lua_userdata*)lua_touserdata(L,index);  /* get data */
                type = usr->type;
                njli::AbstractFactoryObject *object = static_cast<njli::AbstractFactoryObject*>(usr->ptr);
                printf("%s => %d:%s\n", key, object->getType(), object->getClassName());
                
            }
        }
        // pop value + copy of key, leaving original key
        lua_pop(L, 2);
        // stack now contains: -1 => key; -2 => table
    }
    // stack now contains: -1 => table (when lua_next returns 0 it pops the key
    // but does not push anything.)
    // Pop table
    lua_pop(L, 1);
    // Stack is now the same as it was on entry to this function
}

static void populate_builder(lua_State *L, int index, njli::AbstractFactoryObject &object)
{
    // Push another reference to the table on top of the stack (so we know
    // where it is, and this function can work for negative, positive and
    // pseudo indices
    lua_pushvalue(L, index);
    // stack now contains: -1 => table
    lua_pushnil(L);
    // stack now contains: -1 => nil; -2 => table
    while (lua_next(L, -2))
    {
        // stack now contains: -1 => value; -2 => key; -3 => table
        // copy the key so that lua_tostring does not modify the original
        lua_pushvalue(L, -2);
        // stack now contains: -1 => key; -2 => value; -3 => key; -4 => table
        const char *key = lua_tostring(L, -1);
        const char *value = lua_tostring(L, -2);
        if(lua_istable(L, -2))
        {
            iterate_and_print(L, -2);
        }
        else
        {
            if(lua_isnumber(L, index))
            {
                double number = lua_tonumber(L, index);
                printf("%s => %f\n", key, number);
            }
            else if(lua_isstring(L, index))
            {
                const char *v = lua_tostring(L, index);
                printf("%s => %s\n", key, v);
            }
            else if(lua_isboolean(L, index))
            {
                bool v = lua_toboolean(L, index);
                printf("%s => %d\n", key, v);
            }
            else if(lua_isuserdata(L, index))
            {
                swig_lua_userdata *usr;
                swig_type_info *type;
                DEBUG_ASSERT(lua_isuserdata(L,index));
                usr=(swig_lua_userdata*)lua_touserdata(L,index);  /* get data */
                type = usr->type;
                njli::AbstractFactoryObject *object = static_cast<njli::AbstractFactoryObject*>(usr->ptr);
                printf("%s => %d:%s\n", key, object->getType(), object->getClassName());
                
            }
        }
        // pop value + copy of key, leaving original key
        lua_pop(L, 2);
        // stack now contains: -1 => key; -2 => table
    }
    // stack now contains: -1 => table (when lua_next returns 0 it pops the key
    // but does not push anything.)
    // Pop table
    lua_pop(L, 1);
    // Stack is now the same as it was on entry to this function
}

//static s32 countParameters = 0;
//static njli::Rect rect;
//static void populateSpriteAtlas(lua_State *L, int index, njli::SpriteFrameAtlas &object)
//{
//    // Push another reference to the table on top of the stack (so we know
//    // where it is, and this function can work for negative, positive and
//    // pseudo indices
//    lua_pushvalue(L, index);
//    // stack now contains: -1 => table
//    lua_pushnil(L);
//    // stack now contains: -1 => nil; -2 => table
//    
//    
//    
//    while (lua_next(L, -2))
//    {
//        // stack now contains: -1 => value; -2 => key; -3 => table
//        // copy the key so that lua_tostring does not modify the original
//        lua_pushvalue(L, -2);
//        // stack now contains: -1 => key; -2 => value; -3 => key; -4 => table
//        const char *key = lua_tostring(L, -1);
//        const char *value = lua_tostring(L, -2);
//        if(lua_istable(L, -2))
//        {
//            DEBUG_ASSERT(countParameters == 0 || countParameters == 7);
//            
//            if(countParameters == 7)
//                object.addFrame(rect);
//            countParameters = 0;
//            
//            populateSpriteAtlas(L, -2, object);
//        }
//        else
//        {
//            std::string key(lua_tostring(L, -1));
//            std::transform(key.begin(), key.end(), key.begin(), ::tolower);
//            
//            if(strcmp(key.c_str(), "sheetcontentwidth") == 0)
//            {
//                double number = lua_tonumber(L, index);
//                object.setSheetContentWidth(number);
//            }
//            else if(strcmp(key.c_str(), "sheetcontentheight") == 0)
//            {
//                double number = lua_tonumber(L, index);
//                object.setSheetContentHeight(number);
//            }
//            else if(strcmp(key.c_str(), "filename") == 0)
//            {
//                const char *value = lua_tostring(L, index);
//                object.setSourceFilename(value);
//            }
//            else
//            {
//                ++countParameters;
//                
//                if(strcmp(key.c_str(), "x") == 0)
//                {
//                    double number = lua_tonumber(L, index);
//                    rect.setX(number);
//                }
//                else if(strcmp(key.c_str(), "y") == 0)
//                {
//                    double number = lua_tonumber(L, index);
//                    rect.setY(number);
//                }
//                else if(strcmp(key.c_str(), "width") == 0)
//                {
//                    double number = lua_tonumber(L, index);
//                    rect.setWidth(number);
//                }
//                else if(strcmp(key.c_str(), "height") == 0)
//                {
//                    double number = lua_tonumber(L, index);
//                    rect.setHeight(number);
//                }
//                else if(strcmp(key.c_str(), "pivotx") == 0)
//                {
//                    double number = lua_tonumber(L, index);
//                    rect.setPivotX(number);
//                }
//                else if(strcmp(key.c_str(), "pivoty") == 0)
//                {
//                    double number = lua_tonumber(L, index);
//                    rect.setPivotY(number);
//                }
//                else if(strcmp(key.c_str(), "trimmedname") == 0)
//                {
//                    const char *value = lua_tostring(L, index);
//                    rect.setTrimmedName(value);
//                }
//                else
//                {
//                    Log("invalid key: %s\n", key.c_str());
//                    DEBUG_ASSERT(false);
//                }
//            }
//        }
//        // pop value + copy of key, leaving original key
//        lua_pop(L, 2);
//        // stack now contains: -1 => key; -2 => table
//    }
//    // stack now contains: -1 => table (when lua_next returns 0 it pops the key
//    // but does not push anything.)
//    // Pop table
//    lua_pop(L, 1);
//    // Stack is now the same as it was on entry to this function
//}












static int printLuaTable(lua_State *L)
{
//    stackDump(L);
    iterate_and_print(L, -1);
    return 1;
}

static int create(lua_State *L)
{
//    iterate_and_build(L);
    return 1;
}

//static swig_lua_method JLIM_Module_methods[]= {
//    { "printLuaTable",	printLuaTable },
//    { "create",	create },
//    { NULL, NULL }
//};
//
//static swig_lua_attribute JLIM_Module_attributes[] = {
//    {0,0,0}
//};
//
//static swig_lua_const_info JLIM_Module_constants[]= {
//    {0,0,0,0,0,0}
//};
//static swig_lua_class* JLIM_Module_classes[]= {
//    0
//};
//static swig_lua_namespace* JLIM_Module_namespaces[] = {
//    0
//};
//
//static swig_lua_namespace JLIM_Module = {
//    "JLIM",
//    JLIM_Module_methods,
//    JLIM_Module_attributes,
//    JLIM_Module_constants,
//    JLIM_Module_classes,
//    JLIM_Module_namespaces
//};

LUALIB_API int luaopen_JLIM(lua_State *L)
{
//http://passingcuriosity.com/2009/extending-lua-in-c/
    
    // Create the table
    lua_createtable(L,0,0);
    
    // Create the meta-table
    lua_createtable(L,0,1);
    
    // Add the __index
    lua_pushcfunction(L, create);
    lua_setfield(L, -2, "__index");
    
    // Set the meta-table
    lua_setmetatable(L, -2);
    
    // Set the global hash
//    lua_setfield(L, LUA_GLOBALSINDEX, "create");
    lua_pushglobaltable(L);
    
    
    lua_register(L, "create",	create);
    return 0;
//    int globalRegister = 1;
//    
//    swig_lua_namespace *ns = &JLIM_Module;
//    int reg = globalRegister;
//    
//    /* 1 argument - table on the top of the stack */
//    const int SWIGUNUSED begin = lua_gettop(L);
//    DEBUG_ASSERT(lua_istable(L,-1)); /* just in case. This is supposed to be module table or parent namespace table */
//    lua_checkstack(L,5);
//    lua_newtable(L); /* namespace itself */
//    lua_newtable(L); /* metatable for namespace */
//    
//    /* add a table called ".get" */
//    lua_pushstring(L,".get");
//    lua_newtable(L);
//    lua_rawset(L,-3);
//    /* add a table called ".set" */
//    lua_pushstring(L,".set");
//    lua_newtable(L);
//    lua_rawset(L,-3);
//    /* add a table called ".fn" */
//    lua_pushstring(L,".fn");
//    lua_newtable(L);
//    lua_rawset(L,-3);
//    
//    /* add accessor fns for using the .get,.set&.fn */
//    SWIG_Lua_add_function(L,"__index",SWIG_Lua_namespace_get);
//    SWIG_Lua_add_function(L,"__newindex",SWIG_Lua_namespace_set);
//    
//    lua_setmetatable(L,-2); /* set metatable */
//    
//    /* Register all functions, variables etc */
//    SWIG_Lua_add_namespace_details(L,ns);
//    /* Register classes */
//    SWIG_Lua_add_namespace_classes(L,ns);
//    
//    swig_lua_namespace **sub_namespace = ns->ns_namespaces;
//    if( sub_namespace != 0) {
//        while(*sub_namespace != 0) {
//            SWIG_Lua_namespace_register(L, *sub_namespace, 1);
//            lua_pop(L,1); /* removing sub-namespace table */
//            sub_namespace++;
//        }
//    }
//    
//    if (reg) {
//        lua_pushstring(L,ns->name);
//        lua_pushvalue(L,-2);
//        lua_rawset(L,-4); /* add namespace to module table */
//    }
//    const int SWIGUNUSED end = lua_gettop(L);
//    
//    DEBUG_ASSERT(lua_gettop(L) == begin+1);
    
    
    
    
    
    
//    lua_setmetatable(L,-2); /* set metatable */
//    
//    /* Register all functions, variables etc */
//    SWIG_Lua_add_namespace_details(L,ns);
//    /* Register classes */
//    SWIG_Lua_add_namespace_classes(L,ns);
//    
//    swig_lua_namespace **sub_namespace = ns->ns_namespaces;
//    if( sub_namespace != 0) {
//        while(*sub_namespace != 0) {
//            SWIG_Lua_namespace_register(L, *sub_namespace, 1);
//            lua_pop(L,1); /* removing sub-namespace table */
//            sub_namespace++;
//        }
//    }
//    
//    if (reg) {
//        lua_pushstring(L,ns->name);
//        lua_pushvalue(L,-2);
//        lua_rawset(L,-4); /* add namespace to module table */
//    }
//    const int SWIGUNUSED end = lua_gettop(L);
//    DEBUG_ASSERT(lua_gettop(L) == begin+1);
    
    
    
    
//    lua_newtable(L);
//    luaL_setfuncs (L,JLIEngineManualFuncs,0);
//    lua_pushvalue(L,-1);        // pluck these lines out if they offend you
//    lua_setglobal(L,"JLIM"); // for they clobber the Holy _G
    return 1;
}
















//static std::string buildSublimeCompletions()
//{
//    char trigger_value[512];
//    char completion_value[512];
//    
//    std::string trigger0 = "\t\t{\"trigger\": \"";
//    std::string trigger1 = "\", \"contents\": \"";
//    std::string trigger2 = "\" },\n";
//    
//    std::string sublime_completions = "";
//    
//    
//    for (int j = 0; swig_SwigModule.ns_constants[j].name; ++j)
//    {
//        sprintf(trigger_value, "%s",swig_SwigModule.ns_constants[j].name);
//        sprintf(completion_value, "JLI.%s",swig_SwigModule.ns_constants[j].name);
//        
//        sublime_completions += trigger0;
//        sublime_completions += trigger_value;
//        sublime_completions += trigger1;
//        sublime_completions += completion_value;
//        sublime_completions += trigger2;
//        
//    }
//    
//    for (int j = 0; swig_SwigModule.ns_attributes[j].name; ++j)
//    {
//        sprintf(trigger_value, "%s",swig_SwigModule.ns_constants[j].name);
//        sprintf(completion_value, "JLI.%s",swig_SwigModule.ns_constants[j].name);
//        
//        sublime_completions += trigger0;
//        sublime_completions += trigger_value;
//        sublime_completions += trigger1;
//        sublime_completions += completion_value;
//        sublime_completions += trigger2;
//        
//    }
//    
//    return sublime_completions;
//}


//static std::string printMethods(const char* name)
//{
//    std::string output = "-- Automatically generated tests for JLI game engine.\n\n";
//    char trigger_value[512];
//    char completion_value[512];
//    
//    std::string trigger0 = "\t\t{\"trigger\": \"";
//    std::string trigger1 = "\", \"contents\": \"";
//    std::string trigger2 = "\" },\n";
//    
////    std::string sublime_completions = "\n{\n\t\"scope\": \"source.lua - source - meta.tag, punctuation.definition.tag.begin\",\n";
////    
////    sublime_completions += "\n\n\t\"completions\":\n\t[\n";
//    
//    std::string sublime_completions = "";
//    
//    //this touches the SWIG internals, please be careful:
//    for (int i = 0; swig_types[i]; i++)
//    {
//        if (swig_types[i]->clientdata)
//        {
//            swig_lua_class* ptr=(swig_lua_class*)(swig_types[i]->clientdata);
//
//            if (strcmp(name,ptr->name)==0)
//            {
////                sprintf("test%sFunctions", ptr->name);
//                
//                for (int j = 0; ptr->cls_static->ns_constants[j].name; ++j)
//                {
//                    
//                    sprintf(trigger_value, "%s",ptr->cls_static->ns_constants[j].name);
//                    sprintf(completion_value, "JLI.%s",ptr->cls_static->ns_constants[j].name);
//                    
//                    sublime_completions += trigger0;
//                    sublime_completions += trigger_value;
//                    sublime_completions += trigger1;
//                    sublime_completions += completion_value;
//                    sublime_completions += trigger2;
//                    
//                }
//                
//                for(int j = 0; ptr->cls_static->ns_methods[j].name; ++j)
//                {
//                    sprintf(trigger_value, "static %s.%s",ptr->name,ptr->cls_static->ns_methods[j].name);
//                    sprintf(completion_value, "JLI.%s.%s",ptr->name,ptr->cls_static->ns_methods[j].name);
//                    
//                    sublime_completions += trigger0;
//                    sublime_completions += trigger_value;
//                    sublime_completions += trigger1;
//                    sublime_completions += completion_value;
//                    sublime_completions += trigger2;
//                }
//                
//                for(int j = 0; ptr->metatable[j].name; ++j)
//                {
//                    if(strcmp("Node", ptr->name) == 0)
//                    {
//                        printf("%s:%s\n",ptr->name,ptr->metatable[j].name);
//                    }
//                }
//                for(int j = 0; ptr->methods[j].name; ++j)
//                {
//                    if(strcmp("Node", ptr->name) == 0)
//                    {
//                        printf("%s:%s\n",ptr->name,ptr->methods[j].name);
//                        
//                        printf("%s:%s\n",ptr->name,ptr->methods[j].name);
//                    }
//                }
//
//                for(int j = 0; ptr->methods[j].name; ++j)
//                {
//                    if(strcmp("Node", ptr->name) == 0)
//                    {
//                        swig_lua_method method = ptr->methods[j];
//                        sprintf(trigger_value, "%s.%s",ptr->name,ptr->methods[j].name);
//                        sprintf(completion_value, "%s",ptr->methods[j].name);
//                    }
//                    
//                    sprintf(trigger_value, "%s.%s",ptr->name,ptr->methods[j].name);
//                    sprintf(completion_value, "%s",ptr->methods[j].name);
//                    
//                    sublime_completions += trigger0;
//                    sublime_completions += trigger_value;
//                    sublime_completions += trigger1;
//                    sublime_completions += completion_value;
//                    sublime_completions += trigger2;
//                }
//                
////                for(int j=0;ptr->methods[j].name;j++)
////                {
////                    sprintf(buffer, "%s::%s()\n",ptr->name,ptr->methods[j].name);
//////                    functions += buffer;
////						DEBUG_LOG_PRINT_V(TAG, "%s::%s()\n",ptr->name,ptr->methods[j].name);
////                }
//            }
//        }
//    }
////    sublime_completions += "\t]\n}";
////    DEBUG_LOG_PRINT_V(TAG, "%s",sublime_completions.c_str());
//    return sublime_completions;
////    Log("%s", functions.c_str());
//}
//
//static void printWrappedClasses()
//{
//    std::string sublime_completions = "\n{\n\t\"scope\":\"source.lua\",\n";
//    //std::string sublime_completions = "\n{\n\t\"scope\": \"source.lua - source - meta.tag, punctuation.definition.tag.begin\",\n";
//    
//    sublime_completions += "\n\n\t\"completions\":\n\t[\n";
//    
//    //this touches the SWIG internals, please be careful:
//    for (int i = 0; swig_types[i]; i++)
//    {
//        if (swig_types[i]->clientdata)
//        {
//            swig_lua_class* ptr=(swig_lua_class*)(swig_types[i]->clientdata);
//            sublime_completions += printMethods(ptr->name);
//        }
//    }
//    
////    sublime_completions += buildSublimeCompletions();
//    
//    sublime_completions += "\t]\n}";
//    
//    DEBUG_LOG_PRINT_V(TAG, "%s",sublime_completions.c_str());
//}

namespace njli
{
    WorldLuaVirtualMachine::WorldLuaVirtualMachine():
    m_lua_State(NULL)
    {
//        init();
    }
    
    WorldLuaVirtualMachine::~WorldLuaVirtualMachine()
    {
        unInit();
    }
    
    WorldLuaVirtualMachine::operator std::string() const
    {
        return njli::JsonJLI::parse(string_format("%s", FORMATSTRING));
    }
    
    const char *WorldLuaVirtualMachine::getClassName()const
    {
        return "WorldLuaVirtualMachine";
    }
    
    s32 WorldLuaVirtualMachine::getType()const
    {
        return JLI_OBJECT_TYPE_WorldLuaVirtualMachine;
    }
    
//    void WorldLuaVirtualMachine::reset()
//    {
//        unInit();
//        init();
//    }
    
    void WorldLuaVirtualMachine::printStack()
    {
        if(m_lua_State)
            stackDump(m_lua_State);
    }
    
    bool WorldLuaVirtualMachine::loadFile(const char *filePath)
    {
        if(m_lua_State)
        {
            std::string script;
            if(njli::World::getInstance()->getWorldResourceLoader()->load(filePath, &script))
            {
                return loadString(script.c_str());
            }
            else
            {
                DEBUG_LOG_WRITE_W(TAG, "Unable to load script file");
            }
        }
        
        return false;
    }
    
    bool WorldLuaVirtualMachine::loadString(const char *code)
    {
        if(m_lua_State)
        {
            int error_code = luaL_loadstring(m_lua_State, code);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::doFile(const char *filePath)
    {
        if(m_lua_State)
        {
            int error_code = luaL_dofile(m_lua_State, filePath);
            
            if(LUA_OK == error_code)
                return true;
            getError("", error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::doString(const char *code)
    {
        if(m_lua_State)
        {
            int error_code = luaL_dostring(m_lua_State, code);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    void WorldLuaVirtualMachine::reset()
    {
        if(m_lua_State)
        {
            int count = 0;
            int previous_count = count;
            
            lua_settop(m_lua_State, 0);
            count = lua_gc(m_lua_State, LUA_GCCOLLECT, 0);
            
            do
            {
                previous_count = count;
                count = lua_gc(m_lua_State, LUA_GCCOUNT, 0);
                
            }while(count != previous_count);
            
            World::getInstance()->getWorldFactory()->destroyAll();
            
            unInit();
            init();
        }
    }
    
    
    double WorldLuaVirtualMachine::getMaxNumber()const
    {
        return std::numeric_limits<lua_Number>::max();
    }
    
    double WorldLuaVirtualMachine::getMinNumber()const
    {
        return std::numeric_limits<lua_Number>::min();
    }
    
    void WorldLuaVirtualMachine::init()
    {
        if (m_lua_State)
            unInit();
        
        luaL_checkversion(m_lua_State);
        
//        DEBUG_LOG_V(TAG, "Lua version: %s\n", LUA_VERSION);
        
#if defined(LUAI_THROW)
        DEBUG_LOG_V(TAG, "%s", "Lua LUAI_THROW: yes\n");
#else
        DEBUG_LOG_V(TAG, "%s", "Lua LUAI_THROW: no\n");
#endif
        
#if defined(LUA_USE_LONGJMP)
        DEBUG_LOG_V(TAG, "%s", "Lua LUA_USE_LONGJMP: yes\n");
#else
        DEBUG_LOG_V(TAG, "%s", "Lua LUA_USE_LONGJMP: no\n");
#endif
        
#if defined(__cplusplus)
        DEBUG_LOG_V(TAG, "%s", "Lua __cplusplus: yes\n");
#else
        DEBUG_LOG_V(TAG, "%s", "Lua __cplusplus: no\n");
#endif
        
#if defined(LUA_USE_ULONGJMP)
        DEBUG_LOG_V(TAG, "%s", "Lua LUA_USE_ULONGJMP: yes\n");
#else
        DEBUG_LOG_V(TAG, "%s", "Lua LUA_USE_ULONGJMP: no\n");
#endif
        
        
        
        
        
//        DEBUG_LOG_V(TAG, "SWIG version: %X\n", SWIGVERSION);
/*
 #if !defined(LUAI_THROW)
 
 #if defined(__cplusplus) && !defined(LUA_USE_LONGJMP)
 */
        m_lua_State = luaL_newstate();
        
        luaL_checkversion(m_lua_State);
        
        DEBUG_LOG_V(TAG, "Lua version: %s\n", LUA_VERSION);
        
        luaL_openlibs(m_lua_State);

//        luaopen_njli(m_lua_State);
        
//        luaopen_JLIM(m_lua_State);
        
//        luaopen_bit(m_lua_State);

//        DEBUG_LOG_V(TAG, "%s\n", SWIG_name );
        
        const char *paths[] =
        {
            "scripts",
            "scripts/?",
//            "scripts/nodes",
//            "scripts/scenes",
//            "scripts/worlds",
//            "scripts/steering"
        };
        
        for (s32 i = 0; i < 2; ++i)
        {
            std::string bundlePath = BUNDLE_PATH();
            bundlePath.append(paths[i]);
            bundlePath.append("/?.lua");
            appendLuaPath(m_lua_State, bundlePath.c_str());
        }
        
//#if defined(DEBUG) || defined (_DEBUG)
        for (s32 i = 0; i < 2; ++i)
        {
            std::string bundlePath = DOCUMENT_BASEPATH();//BUNDLE_PATH();
            bundlePath.append("/");
            bundlePath.append(paths[i]);
            bundlePath.append("/?.lua");
            appendLuaPath(m_lua_State, bundlePath.c_str());
        }
//#endif
//        swig_type_info *m_SceneTypeInfo;
//        swig_type_info *m_TelegramTypeInfo;
//        swig_type_info *m_NodeTypeInfo;
//        swig_type_info *m_DeviceTouchTypeInfo;
//        swig_type_info *m_PhysicsRayContactTypeInfo;
//        swig_type_info *m_ActionTypeInfo;
//        m_SceneTypeInfo = SWIG_TypeQuery( m_lua_State, "njli::Scene" );
//        swig_type_info *m_TelegramTypeInfo = SWIG_TypeQuery( m_lua_State, "njli::Telegram" );
//        swig_type_info *m_NodeTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Node" );
//        swig_type_info * m_DeviceTouchTypeInfo = SWIG_TypeQuery( m_lua_State, "njli::DeviceTouch" );
//        swig_type_info * m_PhysicsRayContactTypeInfo = SWIG_TypeQuery( m_lua_State, "njli::PhysicsRayContact" );
//        swig_type_info * m_ActionTypeInfo = SWIG_TypeQuery( m_lua_State, "njli::Action" );

        
#if defined(DEBUG) || defined (_DEBUG)
//        printWrappedClasses();
#endif
    }
    
    
    
    
    
    void WorldLuaVirtualMachine::unInit()
    {
        if( m_lua_State )
        {
            lua_gc(m_lua_State, LUA_GCCOLLECT, 0);
            lua_close( m_lua_State );
            
            m_lua_State = NULL;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    static bool isInteractive = false;
#if !defined(LUA_PROMPT)
#define LUA_PROMPT		"> "
#define LUA_PROMPT2		">> "
#endif
    
#if !defined(LUA_PROGNAME)
#define LUA_PROGNAME		"lua"
#endif
    
#if !defined(LUA_MAXINPUT)
#define LUA_MAXINPUT		512
#endif
    
#if !defined(LUA_INIT_VAR)
#define LUA_INIT_VAR		"LUA_INIT"
#endif
    
#define LUA_INITVARVERSION  \
LUA_INIT_VAR "_" LUA_VERSION_MAJOR "_" LUA_VERSION_MINOR
    
    
    /*
     ** lua_stdin_is_tty detects whether the standard input is a 'tty' (that
     ** is, whether we're running lua interactively).
     */
#if !defined(lua_stdin_is_tty)	/* { */
    
#if defined(LUA_USE_POSIX)	/* { */
    
#include <unistd.h>
#define lua_stdin_is_tty()	isatty(0)
    
#elif defined(LUA_USE_WINDOWS)	/* }{ */
    
#include <io.h>
#define lua_stdin_is_tty()	_isatty(_fileno(stdin))
    
#else				/* }{ */
    
    /* ISO C definition */
#define lua_stdin_is_tty()	1  /* assume stdin is a tty */
    
#endif				/* } */
    
#endif				/* } */
    
    
    /*
     ** lua_readline defines how to show a prompt and then read a line from
     ** the standard input.
     ** lua_saveline defines how to "save" a read line in a "history".
     ** lua_freeline defines how to free a line read by lua_readline.
     */
#if !defined(lua_readline)	/* { */
    
#if defined(LUA_USE_READLINE)	/* { */
    
#include <readline/readline.h>
#include <readline/history.h>
#define lua_readline(L,b,p)	((void)L, ((b)=readline(p)) != NULL)
#define lua_saveline(L,line)	((void)L, add_history(line))
#define lua_freeline(L,b)	((void)L, free(b))
    
#else				/* }{ */
    
#define lua_readline(L,b,p) \
((void)L, fputs(p, stdout), fflush(stdout),  /* show prompt */ \
fgets(b, LUA_MAXINPUT, stdin) != NULL)  /* get line */
#define lua_saveline(L,line)	{ (void)L; (void)line; }
#define lua_freeline(L,b)	{ (void)L; (void)b; }
    
#endif				/* } */
    
#endif				/* } */
    
    
    
    
    static lua_State *globalL = NULL;
    
    static const char *progname = LUA_PROGNAME;
    
    
    /*
     ** Hook set by signal function to stop the interpreter.
     */
    static void lstop (lua_State *L, lua_Debug *ar) {
        (void)ar;  /* unused arg. */
        lua_sethook(L, NULL, 0, 0);  /* reset hook */
        luaL_error(L, "interrupted!");
    }
    
    
    /*
     ** Function to be called at a C signal. Because a C signal cannot
     ** just change a Lua state (as there is no proper synchronization),
     ** this function only sets a hook that, when called, will stop the
     ** interpreter.
     */
    static void laction (int i) {
        signal(i, SIG_DFL); /* if another SIGINT happens, terminate process */
        lua_sethook(globalL, lstop, LUA_MASKCALL | LUA_MASKRET | LUA_MASKCOUNT, 1);
    }
    
    
//    static void print_usage (const char *badoption) {
//        lua_writestringerror("%s: ", progname);
//        if (badoption[1] == 'e' || badoption[1] == 'l')
//            lua_writestringerror("'%s' needs argument\n", badoption);
//        else
//            lua_writestringerror("unrecognized option '%s'\n", badoption);
//        lua_writestringerror(
//                             "usage: %s [options] [script [args]]\n"
//                             "Available options are:\n"
//                             "  -e stat  execute string 'stat'\n"
//                             "  -i       enter interactive mode after executing 'script'\n"
//                             "  -j       enter NJLI Sandbox interactive mode after executing 'script'\n"
//                             "  -l name  require library 'name'\n"
//                             "  -v       show version information\n"
//                             "  -E       ignore environment variables\n"
//                             "  --       stop handling options\n"
//                             "  -        stop handling options and execute stdin\n"
//                             ,
//                             progname);
//    }
    
    
    /*
     ** Prints an error message, adding the program name in front of it
     ** (if present)
     */
    static void l_message (const char *pname, const char *msg) {
        if (pname) printf("%s: ", pname);//lua_writestringerror("%s: ", pname);
        printf("%s: ", msg);//lua_writestringerror("%s\n", msg);
    }
    
    
    /*
     ** Check whether 'status' is not OK and, if so, prints the error
     ** message on the top of the stack. It assumes that the error object
     ** is a string, as it was either generated by Lua or by 'msghandler'.
     */
    static int report (lua_State *L, int status) {
        if (status != LUA_OK) {
            const char *msg = lua_tostring(L, -1);
            l_message(progname, msg);
            lua_pop(L, 1);  /* remove message */
        }
        return status;
    }
    
    
    /*
     ** Message handler used to run all chunks
     */
    static int msghandler (lua_State *L) {
        const char *msg = lua_tostring(L, 1);
        if (msg == NULL) {  /* is error object not a string? */
            if (luaL_callmeta(L, 1, "__tostring") &&  /* does it have a metamethod */
                lua_type(L, -1) == LUA_TSTRING)  /* that produces a string? */
                return 1;  /* that is the message */
            else
                msg = lua_pushfstring(L, "(error object is a %s value)",
                                      luaL_typename(L, 1));
        }
        luaL_traceback(L, L, msg, 1);  /* append a standard traceback */
        return 1;  /* return the traceback */
    }
    
    
    /*
     ** Interface to 'lua_pcall', which sets appropriate message function
     ** and C-signal handler. Used to run all chunks.
     */
    static int docall (lua_State *L, int narg, int nres) {
        int status;
        int base = lua_gettop(L) - narg;  /* function index */
        lua_pushcfunction(L, msghandler);  /* push message handler */
        lua_insert(L, base);  /* put it under function and args */
        globalL = L;  /* to be available to 'laction' */
        signal(SIGINT, laction);  /* set C-signal handler */
        status = lua_pcall(L, narg, nres, base);
        signal(SIGINT, SIG_DFL); /* reset C-signal handler */
        lua_remove(L, base);  /* remove message handler from the stack */
        return status;
    }
    
    
//    static void print_version (void) {
//        lua_writestring(LUA_COPYRIGHT, strlen(LUA_COPYRIGHT));
//        lua_writeline();
//    }
    
    
    /*
     ** Create the 'arg' table, which stores all arguments from the
     ** command line ('argv'). It should be aligned so that, at index 0,
     ** it has 'argv[script]', which is the script name. The arguments
     ** to the script (everything after 'script') go to positive indices;
     ** other arguments (before the script name) go to negative indices.
     ** If there is no script name, assume interpreter's name as base.
     */
//    static void createargtable (lua_State *L, char **argv, int argc, int script) {
//        int i, narg;
//        if (script == argc) script = 0;  /* no script name? */
//        narg = argc - (script + 1);  /* number of positive indices */
//        lua_createtable(L, narg, script + 1);
//        for (i = 0; i < argc; i++) {
//            lua_pushstring(L, argv[i]);
//            lua_rawseti(L, -2, i - script);
//        }
//        lua_setglobal(L, "arg");
//    }
    
    
    static int dochunk (lua_State *L, int status) {
        if (status == LUA_OK) status = docall(L, 0, 0);
        return report(L, status);
    }
    
    
//    static int dofile (lua_State *L, const char *name) {
//        return dochunk(L, luaL_loadfile(L, name));
//    }
    
    
//    static int dostring (lua_State *L, const char *s, const char *name) {
//        return dochunk(L, luaL_loadbuffer(L, s, strlen(s), name));
//    }
    
    
    /*
     ** Calls 'require(name)' and stores the result in a global variable
     ** with the given name.
     */
//    static int dolibrary (lua_State *L, const char *name) {
//        int status;
//        lua_getglobal(L, "require");
//        lua_pushstring(L, name);
//        status = docall(L, 1, 1);  /* call 'require(name)' */
//        if (status == LUA_OK)
//            lua_setglobal(L, name);  /* global[name] = require return */
//        return report(L, status);
//    }
    
    
    /*
     ** Returns the string to be used as a prompt by the interpreter.
     */
    static const char *get_prompt (lua_State *L, int firstline) {
        const char *p;
        lua_getglobal(L, firstline ? "_PROMPT" : "_PROMPT2");
        p = lua_tostring(L, -1);
        if (p == NULL) p = (firstline ? LUA_PROMPT : LUA_PROMPT2);
        return p;
    }
    
    /* mark in error messages for incomplete statements */
#define EOFMARK		"<eof>"
#define marklen		(sizeof(EOFMARK)/sizeof(char) - 1)
    
    
    /*
     ** Check whether 'status' signals a syntax error and the error
     ** message at the top of the stack ends with the above mark for
     ** incomplete statements.
     */
    static int incomplete (lua_State *L, int status) {
        if (status == LUA_ERRSYNTAX) {
            size_t lmsg;
            const char *msg = lua_tolstring(L, -1, &lmsg);
            if (lmsg >= marklen && strcmp(msg + lmsg - marklen, EOFMARK) == 0) {
                lua_pop(L, 1);
                return 1;
            }
        }
        return 0;  /* else... */
    }
    
    
    /*
     ** Prompt the user, read a line, and push it into the Lua stack.
     */
    static int pushline (lua_State *L, int firstline) {
        char buffer[LUA_MAXINPUT];
        char *b = buffer;
        size_t l;
        const char *prmt = get_prompt(L, firstline);
        int readstatus = lua_readline(L, b, prmt);
        if (readstatus == 0)
            return 0;  /* no input (prompt will be popped by caller) */
        lua_pop(L, 1);  /* remove prompt */
        l = strlen(b);
        if (l > 0 && b[l-1] == '\n')  /* line ends with newline? */
            b[--l] = '\0';  /* remove it */
        if (firstline && b[0] == '=')  /* for compatibility with 5.2, ... */
            lua_pushfstring(L, "return %s", b + 1);  /* change '=' to 'return' */
        else
            lua_pushlstring(L, b, l);
        lua_freeline(L, b);
        return 1;
    }
    
    
    /*
     ** Try to compile line on the stack as 'return <line>;'; on return, stack
     ** has either compiled chunk or original line (if compilation failed).
     */
//    static int addreturn (lua_State *L) {
//        const char *line = lua_tostring(L, -1);  /* original line */
//        const char *retline = lua_pushfstring(L, "return %s;", line);
//        int status = luaL_loadbuffer(L, retline, strlen(retline), "=stdin");
//        if (status == LUA_OK) {
//            lua_remove(L, -2);  /* remove modified line */
//            if (line[0] != '\0')  /* non empty? */
//                lua_saveline(L, line);  /* keep history */
//        }
//        else
//            lua_pop(L, 2);  /* pop result from 'luaL_loadbuffer' and modified line */
//        return status;
//    }
    
    
    /*
     ** Read multiple lines until a complete Lua statement
     */
//    static int multiline (lua_State *L) {
//        for (;;) {  /* repeat until gets a complete statement */
//            size_t len;
//            const char *line = lua_tolstring(L, 1, &len);  /* get what it has */
//            int status = luaL_loadbuffer(L, line, len, "=stdin");  /* try it */
//            if (!incomplete(L, status) || !pushline(L, 0)) {
//                lua_saveline(L, line);  /* keep history */
//                return status;  /* cannot or should not try to add continuation line */
//            }
//            lua_pushliteral(L, "\n");  /* add newline... */
//            lua_insert(L, -2);  /* ...between the two lines */
//            lua_concat(L, 3);  /* join them */
//        }
//    }
    
    
    /*
     ** Read a line and try to load (compile) it first as an expression (by
     ** adding "return " in front of it) and second as a statement. Return
     ** the final status of load/call with the resulting function (if any)
     ** in the top of the stack.
     */
//    static int loadline (lua_State *L) {
//        int status;
//        lua_settop(L, 0);
//        if (!pushline(L, 1))
//            return -1;  /* no input */
//        if ((status = addreturn(L)) != LUA_OK)  /* 'return ...' did not work? */
//            status = multiline(L);  /* try as command, maybe with continuation lines */
//        lua_remove(L, 1);  /* remove line from the stack */
//        lua_assert(lua_gettop(L) == 1);
//        return status;
//    }
    
    
    /*
     ** Prints (calling the Lua 'print' function) any values on the stack
     */
//    static void l_print (lua_State *L) {
//        int n = lua_gettop(L);
//        if (n > 0) {  /* any result to be printed? */
//            luaL_checkstack(L, LUA_MINSTACK, "too many results to print");
//            lua_getglobal(L, "print");
//            lua_insert(L, 1);
//            if (lua_pcall(L, n, 0, 0) != LUA_OK)
//                l_message(progname, lua_pushfstring(L, "error calling 'print' (%s)",
//                                                    lua_tostring(L, -1)));
//        }
//    }
    
    /*
     ** Push on the stack the contents of table 'arg' from 1 to #arg
     */
//    static int pushargs (lua_State *L) {
//        int i, n;
//        if (lua_getglobal(L, "arg") != LUA_TTABLE)
//            luaL_error(L, "'arg' is not a table");
//        n = (int)luaL_len(L, -1);
//        luaL_checkstack(L, n + 3, "too many arguments to script");
//        for (i = 1; i <= n; i++)
//            lua_rawgeti(L, -i, i);
//        lua_remove(L, -i);  /* remove table from the stack */
//        return n;
//    }
    
    
//    static int handle_script (lua_State *L, char **argv) {
//        int status;
//        const char *fname = argv[0];
//        if (strcmp(fname, "-") == 0 && strcmp(argv[-1], "--") != 0)
//            fname = NULL;  /* stdin */
//        status = luaL_loadfile(L, fname);
//        if (status == LUA_OK) {
//            int n = pushargs(L);  /* push arguments to script */
//            status = docall(L, n, LUA_MULTRET);
//        }
//        return report(L, status);
//    }
    
    
    
    /* bits of various argument indicators in 'args' */
//#define has_error	1	/* bad option */
//#define has_i		2	/* -i */
//#define has_v		4	/* -v */
//#define has_e		8	/* -e */
//#define has_E		16	/* -E */
//#define has_j		32	/* -i */
    
    /*
     ** Traverses all arguments from 'argv', returning a mask with those
     ** needed before running any Lua code (or an error code if it finds
     ** any invalid argument). 'first' returns the first not-handled argument
     ** (either the script name or a bad argument in case of error).
     */
//    static int collectargs (char **argv, int *first) {
//        int args = 0;
//        int i;
//        for (i = 1; argv[i] != NULL; i++) {
//            *first = i;
//            if (argv[i][0] != '-')  /* not an option? */
//                return args;  /* stop handling options */
//            switch (argv[i][1]) {  /* else check option */
//                case '-':  /* '--' */
//                    if (argv[i][2] != '\0')  /* extra characters after '--'? */
//                        return has_error;  /* invalid option */
//                    *first = i + 1;
//                    return args;
//                case '\0':  /* '-' */
//                    return args;  /* script "name" is '-' */
//                case 'E':
//                    if (argv[i][2] != '\0')  /* extra characters after 1st? */
//                        return has_error;  /* invalid option */
//                    args |= has_E;
//                    break;
//                case 'j':
//                    args |= has_j;  /* (-j implies -v) *//* FALLTHROUGH */ 
//                case 'i':
//                    args |= has_i;  /* (-i implies -v) *//* FALLTHROUGH */ 
//                case 'v':
//                    if (argv[i][2] != '\0')  /* extra characters after 1st? */
//                        return has_error;  /* invalid option */
//                    args |= has_v;
//                    break;
//                case 'e':
//                    args |= has_e;  /* FALLTHROUGH */
//                case 'l':  /* both options need an argument */
//                    if (argv[i][2] == '\0') {  /* no concatenated argument? */
//                        i++;  /* try next 'argv' */
//                        if (argv[i] == NULL || argv[i][0] == '-')
//                            return has_error;  /* no next argument or it is another option */
//                    }
//                    break;
//                default:  /* invalid option */
//                    return has_error;
//            }
//        }
//        *first = i;  /* no script name */
//        return args;
//    }
    
    
    /*
     ** Processes options 'e' and 'l', which involve running Lua code.
     ** Returns 0 if some code raises an error.
     */
//    static int runargs (lua_State *L, char **argv, int n) {
//        int i;
//        for (i = 1; i < n; i++) {
//            int option = argv[i][1];
//            lua_assert(argv[i][0] == '-');  /* already checked */
//            if (option == 'e' || option == 'l') {
//                int status;
//                const char *extra = argv[i] + 2;  /* both options need an argument */
//                if (*extra == '\0') extra = argv[++i];
//                lua_assert(extra != NULL);
//                status = (option == 'e')
//                ? dostring(L, extra, "=(command line)")
//                : dolibrary(L, extra);
//                if (status != LUA_OK) return 0;
//            }
//        }
//        return 1;
//    }
    
    
//    static int handle_luainit (lua_State *L) {
//        const char *name = "=" LUA_INITVARVERSION;
//        const char *init = getenv(name + 1);
//        if (init == NULL) {
//            name = "=" LUA_INIT_VAR;
//            init = getenv(name + 1);  /* try alternative name */
//        }
//        if (init == NULL) return LUA_OK;
//        else if (init[0] == '@')
//            return dofile(L, init+1);
//        else
//            return dostring(L, init, name);
//    }
    
    
    /*
     ** Do the REPL: repeatedly read (load) a line, evaluate (call) it, and
     ** print any results.
     */
//    static void _doREPL (lua_State *L) {
//        int status;
//        const char *oldprogname = progname;
//        progname = NULL;  /* no 'progname' on errors in interactive mode */
//        if ((status = loadline(L)) != -1) {
//            if (status == LUA_OK)
//                status = docall(L, 0, LUA_MULTRET);
//            if (status == LUA_OK) l_print(L);
//            else report(L, status);
//        }
//        lua_settop(L, 0);  /* clear stack */
//        lua_writeline();
//        progname = oldprogname;
//    }
    
    /*
     ** Main body of stand-alone interpreter (to be called in protected mode).
     ** Reads the options and handles them all.
     */
//    static int pmain (lua_State *L) {
//        int argc = (int)lua_tointeger(L, 1);
//        char **argv = (char **)lua_touserdata(L, 2);
//        int script;
//        int args = collectargs(argv, &script);
//        luaL_checkversion(L);  /* check that interpreter has correct version */
//        if (argv[0] && argv[0][0]) progname = argv[0];
//        if (args == has_error) {  /* bad arg? */
//            print_usage(argv[script]);  /* 'script' has index of bad arg. */
//            return 0;
//        }
//        if (args & has_v)  /* option '-v'? */
//            print_version();
//        if (args & has_E) {  /* option '-E'? */
//            lua_pushboolean(L, 1);  /* signal for libraries to ignore env. vars. */
//            lua_setfield(L, LUA_REGISTRYINDEX, "LUA_NOENV");
//        }
//        luaL_openlibs(L);  /* open standard libraries */
//        
////        const char *paths[] =
////        {
////            "scripts",
////            "scripts/?",
////        };
////        
////        for (s32 i = 0; i < 2; ++i)
////        {
////            std::string bundlePath = BUNDLE_PATH();
////            bundlePath.append(paths[i]);
////            bundlePath.append("/?.lua");
////            appendLuaPath(L, bundlePath.c_str());
////        }
////        
////        for (s32 i = 0; i < 2; ++i)
////        {
////            std::string bundlePath = DOCUMENT_BASEPATH();
////            bundlePath.append("/");
////            bundlePath.append(paths[i]);
////            bundlePath.append("/?.lua");
////            appendLuaPath(L, bundlePath.c_str());
////        }
//        
//        
//        createargtable(L, argv, argc, script);  /* create table 'arg' */
//        if (!(args & has_E)) {  /* no option '-E'? */
//            if (handle_luainit(L) != LUA_OK)  /* run LUA_INIT */
//                return 0;  /* error running LUA_INIT */
//        }
//        if (!runargs(L, argv, script))  /* execute arguments -e and -l */
//            return 0;  /* something failed */
//        if (script < argc &&  /* execute main script (if there is one) */
//            handle_script(L, argv + script) != LUA_OK)
//            return 0;
//        if (args & has_i)  /* -i option? */
//            isInteractive = true;//doREPL(L);  /* do read-eval-print loop */
//        else if (script == argc && !(args & (has_e | has_v))) {  /* no arguments? */
//            if (lua_stdin_is_tty()) {  /* running in interactive mode? */
//                print_version();
//                isInteractive = true;//doREPL(L);  /* do read-eval-print loop */
//            }
//            else dofile(L, NULL);  /* executes stdin as a file */
//        }
//        lua_pushboolean(L, 1);  /* signal no errors */
//        return 1;
//    }
    /*
     ** Do the REPL: repeatedly read (load) a line, evaluate (call) it, and
     ** print any results.
     */
//    void WorldLuaVirtualMachine::doREPL () {
//        _doREPL(m_lua_State);
//    }
    
    
    
    
//    int WorldLuaVirtualMachine::initLua(int argc, char **argv)
//    {
//        int status, result;
//        m_lua_State = luaL_newstate();  /* create state */
//        if (m_lua_State == NULL) {
//            l_message(argv[0], "cannot create state: not enough memory");
//            return EXIT_FAILURE;
//        }
//        lua_pushcfunction(m_lua_State, &pmain);  /* to call 'pmain' in protected mode */
//        lua_pushinteger(m_lua_State, argc);  /* 1st argument */
//        lua_pushlightuserdata(m_lua_State, argv); /* 2nd argument */
//        status = lua_pcall(m_lua_State, 2, 1, 0);  /* do the call */
//        result = lua_toboolean(m_lua_State, -1);  /* get result */
//        report(m_lua_State, status);
//        lua_close(m_lua_State);
//        return (result && status == LUA_OK) ? EXIT_SUCCESS : EXIT_FAILURE;
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    static std::string GetVariableValue(lua_State *L, const int& index)
    {
        char buffer[256];
        std::string value;
        
        if (lua_isnumber(L,index))
        {
            sprintf(buffer, "%f", lua_tonumber(L,index));
            return buffer;
        }
        else
        {
            if (lua_isstring(L,index))
            {
                return (lua_tostring(L,index));
            }
            else
            {
                if (lua_istable(L,index))
                {
                    return "{}";
                    //This can cause an infinite loop if you have tables that reference each other
                    /*value="{";
                     int size = GetStackSize();
                     for (lua_pushnil(L); lua_next(L, -2); lua_pop(L, 1))
                     {
                     std::string var = GetVariableValue(-2);
                     Print(var);
                     value += ""+var;
                     value += "="+GetVariableValue(-1);
                     value += ", ";
                     }
                     SetStackSize(size);
                     value += "}";
                     return value;*/
                }
                else
                {
                    if lua_isnil(L,index)
                    {
                        return ("nil");
                    }
                }
            }
        }
        return "";
    }
    
    static int getCallStackSize(lua_State *L)
    {
        int level = 0;
        lua_Debug ar;
        
        while (true)
        {
            if (lua_getstack(L, level, &ar) == 0)
                return level;
            level += 1;
        }
    }
    void WorldLuaVirtualMachine::getError(const char *code, int error)
    {
//        Log("\nLuaVM ERROR %d\nLUA Function \'%s\'\nLuaVM ERROR MSG \'%s\'\n", error, code, lua_tostring( m_lua_State, -1 ));
        
        /*
         #define LUA_OK		0
         #define LUA_YIELD	1
         #define LUA_ERRRUN	2
         #define LUA_ERRSYNTAX	3
         #define LUA_ERRMEM	4
         #define LUA_ERRGCMM	5
         #define LUA_ERRERR	6
         */
        std::string value;
        switch (error)
        {
            case LUA_YIELD:
                value = "LUA_YIELD";
                break;
            case LUA_ERRRUN:
                value = "LUA_ERRRUN - a runtime error";
                break;
            case LUA_ERRSYNTAX:
                value = "LUA_ERRSYNTAX";
                break;
            case LUA_ERRMEM:
                value = "LUA_ERRMEM - memory allocation error. For such errors, Lua does not call the error handler function";
                break;
            case LUA_ERRGCMM:
                value = "LUA_ERRGCMM";
                break;
            case LUA_ERRERR:
                value = "LUA_ERRERR - error while running the error handler function";
                break;
            default:
                break;
        }

        if(m_lua_State)
        {
//            stackDump(m_lua_State);
            DEBUG_LOG_E(TAG, "\n\n\n%s in %s - \'%s\'\n", value.c_str(), code, lua_tostring( m_lua_State, -1 ));
            
            const char *stackDumpCode = "\
            print(debug.traceback('START Stack Trace'))\
            --print_r(debug.getinfo(1))\
            print('END Stack Trace')";
            int error_code = luaL_dostring(m_lua_State, stackDumpCode);
            if(LUA_OK != error_code)
                DEBUG_LOG_WRITE_E(TAG, "Unable to do a stack trace");
        }
        
        
//        stackDump(m_lua_State);
        
        
        
//
//        Log ("(%s) : %s\n", code, lua_tostring(m_lua_State,-1));
        
//        std::string errorString(lua_tostring(m_lua_State,-1));
//        lua_getglobal(m_lua_State, "debug");
//        lua_getfield(m_lua_State, -1, "traceback");
//        lua_replace(m_lua_State, -2);
//        lua_getglobal (m_lua_State, code);
//        int rv = lua_pcall(m_lua_State, 0, 0, -2);
//        if (rv) {
//            Log ("\nLua ERR (%d) : %s\n%s\n", error, errorString.c_str(), lua_tostring (m_lua_State, -2));
//            lua_pop(m_lua_State, 1); /* remove error from the stack */
//        }
//        lua_pop(m_lua_State, 1); /* remove debug.traceback from the stack */
        
        
        
        
//        char buffer[1024];
//        size_t size;
//        // push debug.traceback on stack
//        lua_getglobal(m_lua_State, "debug");
//        lua_getfield(m_lua_State, -1, "traceback");
//        lua_replace(m_lua_State, -2);
//        // generate a one line program with the global function name
//        size = snprintf(buffer, sizeof(buffer), "%s()\n", code);
//        
//        if (luaL_loadbuffer(m_lua_State, buffer, size, code)) {
//            printf("compilation error: %s\n", lua_tostring(m_lua_State, -1));
//            lua_pop(m_lua_State, 2); // err msg + traceback fn
//            return;
//        }
//        // call the one line program (which calls the function)
//        if (lua_pcall(m_lua_State, 0, 0, -2)) {
//            printf("runtime error: %s\n", lua_tostring(m_lua_State, -1));
//            lua_pop(m_lua_State, 2); // err msg + traceback fn
//            return;
//        }
//        // cleanup
//        lua_pop(m_lua_State, 1); // traceback fn
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        std::string err;
//        lua_Debug ar;
//        int level = 0;
//        std::string tab;
//        int size = getCallStackSize(m_lua_State);
//        int i;
//        const char* name;
//        std::string temp;
//        char buffer[256];
//        
//        //Display call stack.  I'm going to make the main function '0' and reverse the level numbers
//        //because that makes more sense to me, but remember 0 = the current level.
//        for (level=0; level<size; level++)
//        {
//            lua_getstack(m_lua_State, size -1- level, &ar);
//            
//            sprintf(buffer, "%d", level);
//            temp = std::string(tab+"[Level "+buffer+"]");
//            Log("%s", temp.c_str());
//            
//            temp = std::string(tab+"{");
//            Log("%s", temp.c_str());
//            lua_getinfo(m_lua_State, "nSluf", &ar);
//            
//            temp = std::string(tab+"	source: "+std::string(ar.source));
//            Log("%s", temp.c_str());
//            temp = std::string(tab+"	short_src: "+std::string(ar.short_src));
//            Log("%s", temp.c_str());
//            
//            sprintf(buffer, "%d", ar.linedefined);
//            temp = std::string(tab+"	linedefined: "+buffer);
//            Log("%s", temp.c_str());
//            
//            sprintf(buffer, "%d", ar.lastlinedefined);
//            temp = std::string(tab+"	lastlinedefined: "+buffer);
//            Log("%s", temp.c_str());
//            temp = std::string(tab+"	what: "+std::string(ar.what));
//            Log("%s", temp.c_str());
//            sprintf(buffer, "%d", ar.currentline);
//            temp = std::string(tab+"	currentline: "+buffer);
//            Log("%s", temp.c_str());
//            if (ar.name!=NULL)
//            {
//                temp = std::string(tab+"	name: "+std::string(ar.name));
//                Log("%s", temp.c_str());            }
//            if (ar.namewhat!=NULL)
//            {
//                temp = std::string(tab+"	namewhat: "+std::string(ar.namewhat));
//                Log("%s", temp.c_str());
//            }
//            sprintf(buffer, "%d", ar.nups);
//            temp = std::string(tab+"	nups: "+buffer);
//            Log("%s", temp.c_str());
//            
//            //Display locals
//            temp = std::string(tab+"	locals:");
//            Log("%s", temp.c_str());
//            i = 1;
//            while (true)
//            {
//                name = lua_getlocal(m_lua_State, &ar, i++);
//                if (name==NULL) break;
//                if (name!="(*temporary)")
//                {
//                    temp = std::string(tab+"		"+std::string(name)+" = "+GetVariableValue(m_lua_State, 0));
//                    Log("%s", temp.c_str());
//                }
//                lua_pop(m_lua_State,1);
//            }
//            
//            temp = std::string("");
//            Log("%s", temp.c_str());
//            tab += "	";
//        }
//        
//        //Add closing brackets
//        for (level=0; level<size; level++)
//        {
//            tab = "";
//            for (i=0; i<size-level-1; i++) tab+="	";
//            temp = std::string(tab+"}");
//            Log("%s", temp.c_str());
//        }
//        temp = std::string("");
//        Log("%s", temp.c_str());
//        
//        //Display globals
//        temp = std::string("Globals:");
//        Log("%s", temp.c_str());
//        lua_getglobal(m_lua_State,"_G");
//        for (lua_pushnil(m_lua_State); lua_next(m_lua_State, -2); lua_pop(m_lua_State, 1))
//        {
//            if (!lua_isfunction(m_lua_State,-1))
//            {
//                temp = std::string(GetVariableValue(m_lua_State, -2)+" = "+GetVariableValue(m_lua_State, -1));
//                Log("%s", temp.c_str());
//            }
//        }
//        lua_pop(m_lua_State,1);
//        return err;
        
        
        
        
        
        
        
    }
    
    bool WorldLuaVirtualMachine::compile()
    {
        if(m_lua_State)
        {
            int error_code = lua_pcall( m_lua_State, 0, LUA_MULTRET, 0 );
            
            if(LUA_OK == error_code)
                return true;
            getError("", error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            int error_code = lua_pcall(m_lua_State, 0, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, const char *_char)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            /* the first argument */
            lua_pushstring(m_lua_State, _char);
            
            /* call the function with 1 arguments, return 0 result */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, s32 _s32)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            /* the first argument */
            lua_pushnumber(m_lua_State, _s32);
            
            /* call the function with 1 arguments, return 0 result */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, f32 _btScalar)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            /* the first argument */
            lua_pushnumber(m_lua_State, _btScalar);
            
            /* call the function with 1 arguments, return 0 result */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        
        return false;
    }

    bool WorldLuaVirtualMachine::execute(const char *code, const Telegram &telegram, bool &returnValue)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *telegramTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Telegram" );
            SWIG_NewPointerObj(m_lua_State,(void *) &telegram, telegramTypeInfo,0);
            
            /* do the call (1 arguments, 1 result) */
            int error_code = lua_pcall(m_lua_State, 1, 1, 0);
            
            if(LUA_OK == error_code)
            {
                returnValue = lua_toboolean(m_lua_State, -1);
                lua_pop(m_lua_State, 1);
                return true;
            }
            getError(code, error_code);
        }

        return false;
    }
    
    
    bool WorldLuaVirtualMachine::execute(const char *code, Scene *pEntity)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *sceneTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Scene" );
            SWIG_NewPointerObj(m_lua_State,(void *) pEntity, sceneTypeInfo,0);
            
            /* do the call (1 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Scene *scene, const char* str)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *sceneTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Scene" );
            SWIG_NewPointerObj(m_lua_State,(void *) scene, sceneTypeInfo,0);
            
            lua_pushstring(m_lua_State, str);
            
            /* do the call (1 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 2, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Scene *pEntity, f32 _btScalar)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *sceneTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Scene" );
            SWIG_NewPointerObj(m_lua_State,(void *) pEntity,sceneTypeInfo,0);
            lua_pushnumber(m_lua_State, _btScalar);
            
            /* do the call (2 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 2, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Scene *pEntity, const Telegram &telegram, bool &returnValue)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *sceneTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Scene" );
            SWIG_NewPointerObj(m_lua_State,(void *) pEntity,sceneTypeInfo,0);
            swig_type_info *telegramTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Telegram" );
            SWIG_NewPointerObj(m_lua_State,(void *) &telegram,telegramTypeInfo,0);
            
            /* do the call (2 arguments, 1 result) */
            int error_code = lua_pcall(m_lua_State, 2, 1, 0);
            
            if(LUA_OK == error_code)
            {
                returnValue = lua_toboolean(m_lua_State, -1);
                lua_pop(m_lua_State, 1);
                return true;
            }
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Node *pEntity)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *nodeTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Node" );
            SWIG_NewPointerObj(m_lua_State,(void *) pEntity, nodeTypeInfo,0);
            
            /* do the call (1 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Node *pEntity, f32 _btScalar)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *nodeTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Node" );
            SWIG_NewPointerObj(m_lua_State,(void *) pEntity, nodeTypeInfo,0);
            lua_pushnumber(m_lua_State, _btScalar);
            
            /* do the call (2 arguments, 1 result) */
            int error_code = lua_pcall(m_lua_State, 2, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Node *pEntity, const Telegram &telegram, bool &returnValue)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *nodeTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Node" );
            SWIG_NewPointerObj(m_lua_State,(void *) pEntity, nodeTypeInfo,0);
            swig_type_info *telegramTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Telegram" );
            SWIG_NewPointerObj(m_lua_State,(void *) &telegram, telegramTypeInfo,0);
            
            /* do the call (2 arguments, 1 result) */
            int error_code = lua_pcall(m_lua_State, 2, 1, 0);
            
            if(LUA_OK == error_code)
            {
                returnValue = lua_toboolean(m_lua_State, -1);
                lua_pop(m_lua_State, 1);
                return true;
            }
            
            getError(code, error_code);
        }
        return false;
    }
    
//    void PushFloatArray(float *array, int size)
//    
//    {
//        
//        lua_newtable(state);
//        
//        
//        
//        for (int i = 0; i < size; i++)
//            
//        {
//            
//            lua_pushnumber(state, i); // push the index
//            
//            lua_pushnumber(state, array[i]); // push the value at 'i'
//            
//            
//            
//            // the table is now at -3 on the stack. This tells Lua
//            
//            // to put "stack[-1]" at "stack[-2]" and pop them off,
//            
//            // leaving the table at the top of the stack
//            
//            lua_settable(state, -3);
//            
//        }
//        
//    }
//
    
    bool WorldLuaVirtualMachine::execute(const char *code, DeviceTouch **touches)
    {
//        DEBUG_LOG_V(TAG, "WorldLuaVirtualMachine::execute(%s)\n", code);
        
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            s32 i;
            lua_newtable(m_lua_State);
            for (i = 0; i < DeviceTouch::MAX_TOUCHES; i++){
                swig_type_info * deviceTouchTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__DeviceTouch" );
                SWIG_NewPointerObj(m_lua_State,(void *) touches[i],deviceTouchTypeInfo,0);
                lua_rawseti(m_lua_State,-2,i+1);/* -1 is the number, -2 is the table*/
            }
            
            /* call the function with 1 arguments, return 0 result */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    
    
    
    
    
    
    
    bool WorldLuaVirtualMachine::execute(const char *code, Scene *pEntity, DeviceTouch **touches)
    {
        //        DEBUG_LOG_V(TAG, "WorldLuaVirtualMachine::execute(%s)\n", code);
        
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *sceneTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Scene" );
            SWIG_NewPointerObj(m_lua_State,(void *) pEntity,sceneTypeInfo,0);
            
            s32 i;
            lua_newtable(m_lua_State);
            for (i = 0; i < DeviceTouch::MAX_TOUCHES; i++)
            {
                swig_type_info * deviceTouchTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__DeviceTouch" );
                SWIG_NewPointerObj(m_lua_State,(void *) touches[i],deviceTouchTypeInfo,0);
                lua_rawseti(m_lua_State,-2,i+1);/* -1 is the number, -2 is the table*/
            }
            
            /* call the function with 2 arguments, return 0 result */
            int error_code = lua_pcall(m_lua_State, 2, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    
    
    
    
    
    
    bool WorldLuaVirtualMachine::execute(const char *code, Node *node1, Node *node2, const btManifoldPoint& pt)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *nodeTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Node" );
            swig_type_info *manifoldTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_btManifoldPoint" );
            
            
            SWIG_NewPointerObj(m_lua_State,(void *) node1,nodeTypeInfo,0);
            SWIG_NewPointerObj(m_lua_State,(void *) node2,nodeTypeInfo,0);
            SWIG_NewPointerObj(m_lua_State,(void *) &pt,manifoldTypeInfo,0);
            
            /* do the call (3 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 3, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Node *node1, Node *node2, const btDispatcherInfo &dispatchInfo)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info *nodeTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Node" );
            swig_type_info *dispatcherInfoTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_btDispatcherInfo" );
            
            
            SWIG_NewPointerObj(m_lua_State,(void *) node1,nodeTypeInfo,0);
            SWIG_NewPointerObj(m_lua_State,(void *) node2,nodeTypeInfo,0);
            SWIG_NewPointerObj(m_lua_State,(void *) &dispatchInfo,dispatcherInfoTypeInfo,0);
            
            /* do the call (3 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 3, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, const PhysicsRayContact &rayContact)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            swig_type_info * physicsRayContactTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__PhysicsRayContact" );
            SWIG_NewPointerObj(m_lua_State,(void *) &rayContact,physicsRayContactTypeInfo,0);
            
            /* do the call (1 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, const btAlignedObjectArray<njli::PhysicsRayContact*> &rayContacts)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            s32 i;
            lua_newtable(m_lua_State);
            for (i = 0; i < rayContacts.size(); i++){
                swig_type_info * physicsRayContactTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__PhysicsRayContact" );
                SWIG_NewPointerObj(m_lua_State,(void *) rayContacts[i], physicsRayContactTypeInfo, 0);
                lua_rawseti(m_lua_State,-2,i+1);/* -1 is the number, -2 is the table*/
            }
            
            /* call the function with 1 arguments, return 0 result */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char* code, s32 width, s32 height, s32 orientation)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            lua_pushnumber(m_lua_State, width);
            lua_pushnumber(m_lua_State, height);
            lua_pushnumber(m_lua_State, orientation);
            
            /* do the call (2 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 3, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Action *action)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info * actionTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Action" );
            SWIG_NewPointerObj(m_lua_State,(void *) action,actionTypeInfo,0);
            
            /* do the call (1 arguments, 0 result) */
            int error_code = lua_pcall(m_lua_State, 1, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            
            getError(code, error_code);
        }
        
        return false;
    }
    
    bool WorldLuaVirtualMachine::execute(const char *code, Action *pEntity, f32 _btScalar)
    {
        if(m_lua_State)
        {
            lua_getglobal(m_lua_State, code);
            
            swig_type_info * actionTypeInfo = SWIG_TypeQuery( m_lua_State, "_p_njli__Action" );
            SWIG_NewPointerObj(m_lua_State,(void *) pEntity,actionTypeInfo,0);
            
            lua_pushnumber(m_lua_State, _btScalar);
            
            /* do the call (2 arguments, 1 result) */
            int error_code = lua_pcall(m_lua_State, 2, 0, 0);
            
            if(LUA_OK == error_code)
                return true;
            getError(code, error_code);
        }
        return false;
        
    }
    
}
