//
//  SceneState.cpp
//  JLIGameEngineTest
//
//  Created by James Folk on 12/6/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#include "SceneState.h"
#include "JLIFactoryTypes.h"
#include "World.h"
#include "SceneStateBuilder.h"
#define FORMATSTRING "{\"njli::SceneState\":[]}"
#include "btPrint.h"

#include "btQuickprof.h"

namespace njli
{
    SceneState::SceneState():
    AbstractState<Scene>()
    {
    }
    
    SceneState::SceneState(const AbstractBuilder &builder):
    AbstractState<Scene>(builder)
    {
    }
    
    SceneState::SceneState(const SceneState &copy):
    AbstractState<Scene>(copy)
    {
    }
    
    SceneState::~SceneState()
    {
        
    }
    
    SceneState &SceneState::operator=(const SceneState &rhs)
    {
        if(this != &rhs)
        {
            
        }
        return *this;
    }
    
    s32	SceneState::calculateSerializeBufferSize() const
    {
        //TODO: calculateSerializeBufferSize
        return 0;
    }
    
    void SceneState::serialize(void* dataBuffer, btSerializer* serializer) const
    {
        //TODO: serialize
    }
    
    const char *SceneState::getClassName()const
    {
        return "SceneState";
    }
    
    s32 SceneState::getType()const
    {
        return SceneState::type();
    }
    
    SceneState::operator std::string() const
    {
        return njli::JsonJLI::parse(string_format("%s", FORMATSTRING).c_str());
    }
    
    SceneState **SceneState::createArray(const u32 size)
    {
        return (SceneState**)World::getInstance()->getWorldFactory()->createArray(SceneState::type(), size);
    }
    
    void SceneState::destroyArray(SceneState **array, const u32 size)
    {
        World::getInstance()->getWorldFactory()->destroyArray((AbstractFactoryObject**)array, size);
    }
    
    SceneState *SceneState::create()
    {
        return dynamic_cast<SceneState*>(World::getInstance()->getWorldFactory()->create(SceneState::type()));
    }
    
    SceneState *SceneState::create(const SceneStateBuilder &builder)
    {
        AbstractBuilder *b = (AbstractBuilder *)&builder;
        
        return dynamic_cast<SceneState*>(World::getInstance()->getWorldFactory()->create(*b));
    }
    
    SceneState *SceneState::clone(const SceneState &object)
    {
        return dynamic_cast<SceneState*>(World::getInstance()->getWorldFactory()->clone(object, false));
    }
    
    SceneState *SceneState::copy(const SceneState &object)
    {
        return dynamic_cast<SceneState*>(World::getInstance()->getWorldFactory()->clone(object, true));
    }
    
    void SceneState::destroy(SceneState *object)
    {
        if(object)
        {
            World::getInstance()->getWorldFactory()->destroy(object);
        }
    }
    
    void SceneState::load(SceneState &object, lua_State *L, int index)
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
                SceneState::load(object, L, -2);
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
//                    swig_lua_userdata *usr;
//                    swig_type_info *type;
//                    assert(lua_isuserdata(L,index));
//                    usr=(swig_lua_userdata*)lua_touserdata(L,index);  /* get data */
//                    type = usr->type;
//                    njli::AbstractFactoryObject *object = static_cast<njli::AbstractFactoryObject*>(usr->ptr);
//                    printf("%s => %d:%s\n", key, object->getType(), object->getClassName());
                    
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
    
    u32 SceneState::type()
    {
        return JLI_OBJECT_TYPE_SceneState;
    }
    
    void SceneState::enter(Scene *object)
    {
        char buffer[BUFFER_SIZE] = "SceneEnterState";
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer, object);
    }
    
    void SceneState::update(Scene *object, f32 timeStep)
    {
        BT_PROFILE("SceneState::update");
        char buffer[BUFFER_SIZE] = "SceneUpdateState";
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer, object, timeStep);
    }
    
    void SceneState::exit(Scene *object)
    {
        char buffer[BUFFER_SIZE] = "SceneExitState";
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer, object);
    }
    
    bool SceneState::onMessage(Scene *object, const Telegram &msg)const
    {
        bool ret;
        char buffer[BUFFER_SIZE] = "SceneOnMessage";
        
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer, object, msg, ret);
        
        return ret;
    }
    
}