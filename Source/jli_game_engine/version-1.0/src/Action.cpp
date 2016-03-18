//
//  Action.cpp
//  JLIGameEngineTest
//
//  Created by James Folk on 11/22/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#include "Action.h"
#include "JLIFactoryTypes.h"
#include "World.h"
#include "ActionBuilder.h"

#include "Log.h"
#define TAG "Action.cpp"
#define FORMATSTRING "{\"njli::Action\":[]}"
#include "btPrint.h"

#include "btQuickprof.h"

namespace njli
{
    Action::Action():
    AbstractFactoryObject(this),
    m_SpeedFactor(1.0f),
    m_Duration(0.0f),
    m_TimingMode(JLI_ACTION_TIMING_MODE_EASEIN),
//    m_Name("MyAction"),
    m_timeLeft(0),
    m_RepeatCount(0)
    {
        
    }
    
    Action::Action(const AbstractBuilder &builder):
    AbstractFactoryObject(this),
    m_SpeedFactor(1.0f),
    m_Duration(0.0f),
    m_TimingMode(JLI_ACTION_TIMING_MODE_EASEIN),
//    m_Name("MyAction"),
    m_timeLeft(0),
    m_RepeatCount(0)
    {
        
    }
    
    Action::Action(const Action &copy):
    AbstractFactoryObject(this),
    m_SpeedFactor(1.0f),
    m_Duration(0.0f),
    m_TimingMode(JLI_ACTION_TIMING_MODE_EASEIN),
//    m_Name("MyAction"),
    m_timeLeft(0),
    m_RepeatCount(0)
    {
        
    }
    
    Action::~Action()
    {
        while (!m_ActionGroups.empty())
        {
            Sequence *sequence = m_ActionGroups.back();
            m_ActionGroups.pop_back();
            
            delete sequence->sequenceQueue;sequence->sequenceQueue=NULL;
            delete sequence;sequence=NULL;
        }
    }
    
    Action &Action::operator=(const Action &rhs)
    {
        if(this != &rhs)
        {
            
        }
        return *this;
    }
    
    s32	Action::calculateSerializeBufferSize() const
    {
        //TODO: calculateSerializeBufferSize
        return 0;
    }
    
    void Action::serialize(void* dataBuffer, btSerializer* serializer) const
    {
        //TODO: serialize
    }
    
    const char *Action::getClassName()const
    {
        return "Action";
    }
    
    s32 Action::getType()const
    {
        return Action::type();
    }
    
    Action::operator std::string() const
    {
        return njli::JsonJLI::parse(string_format("%s", FORMATSTRING).c_str());
    }
    
    Action **Action::createArray(const u32 size)
    {
        return (Action**)World::getInstance()->getWorldFactory()->createArray(Action::type(), size);
    }
    
    void Action::destroyArray(Action **array, const u32 size)
    {
        World::getInstance()->getWorldFactory()->destroyArray((AbstractFactoryObject**)array, size);
    }
    
    Action *Action::create()
    {
        return dynamic_cast<Action*>(World::getInstance()->getWorldFactory()->create(Action::type()));
    }
    
    Action *Action::create(const ActionBuilder &builder)
    {
        AbstractBuilder *b = (AbstractBuilder *)&builder;
        
        return dynamic_cast<Action*>(World::getInstance()->getWorldFactory()->create(*b));
    }
    
    Action *Action::clone(const Action &object)
    {
        return dynamic_cast<Action*>(World::getInstance()->getWorldFactory()->clone(object, false));
    }
    
    Action *Action::copy(const Action &object)
    {
        return dynamic_cast<Action*>(World::getInstance()->getWorldFactory()->clone(object, true));
    }
    
    void Action::destroy(Action *object)
    {
        if(object)
        {
            World::getInstance()->getWorldFactory()->destroy(object);
        }
    }
    
    void Action::load(Action &object, lua_State *L, int index)
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
                Action::load(object, L, -2);
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
    
    u32 Action::type()
    {
        return JLI_OBJECT_TYPE_Action;
    }
    
    Action *Action::createGroup(Action **actions, u32 count)
    {
        Action *action = create();
        
        for (u32 i = 0; i < count; ++i)
        {
            Sequence *sequence = new Sequence();
            sequence->sequenceQueue = new std::queue<Action*>();
            sequence->sequenceQueue->push(actions[i]);
            sequence->numberOfActions = 1;
            
            action->m_ActionGroups.push_back(sequence);
        }
        
        return action;
    }
    Action *Action::createSequence(Action **actions, u32 count)
    {
        Action *action = create();
        
        Sequence *sequence = new Sequence();
        sequence->sequenceQueue = new std::queue<Action*>();
        sequence->numberOfActions = 0;
        
        for (u32 i = 0; i < count; ++i)
        {
            Action *currentAction = actions[i];
            sequence->sequenceQueue->push(currentAction);
            ++sequence->numberOfActions;
        }
        
        action->m_ActionGroups.push_back(sequence);
        
        return action;
    }
    
    void Action::setRepeat(u32 count)
    {
        m_RepeatCount = count;
    }
    
    void Action::setRepeatForever()
    {
        m_RepeatCount = std::numeric_limits<s32>::min();
    }
    
    void Action::setSpeedFactor(f32 factor)
    {
        m_SpeedFactor = factor;
    }
    
    f32 Action::getSpeedFactor()const
    {
        return m_SpeedFactor;
    }
    void Action::setDuration(f32 duration)
    {
        m_Duration = duration;
        m_timeLeft = duration;
    }
    f32 Action::getDuration()const
    {
        return m_Duration;
    }
    void Action::setTimingMode(njliActionTimingMode mode)
    {
        m_TimingMode = mode;
    }
    njliActionTimingMode Action::getTimingMode()const
    {
        return m_TimingMode;
    }
    
    
    f32 Action::getTimeLeft()const
    {
        return m_timeLeft;
    }
    
    bool Action::isRepeatingForever()const
    {
        return m_RepeatCount == std::numeric_limits<s32>::min();
    }
    
    s32 Action::getRepeatCount()const
    {
        if(m_RepeatCount == std::numeric_limits<s32>::min())
            return 0;
        return m_RepeatCount;
    }
    
    Node *Action::getParent()
    {
        return dynamic_cast<Node*>(AbstractDecorator::getParent());
    }
    
    const Node *Action::getParent()const
    {
        return dynamic_cast<const Node*>(AbstractDecorator::getParent());
    }
    
    void Action::update(f32 timeStep)
    {
        BT_PROFILE("Action::update");
        char buffer[BUFFER_SIZE] = "NodeActionUpdate";
//        sprintf(buffer, "%sUpdate", this->getName());
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer, this, timeStep);
        
        handleActionChildren(timeStep);
        
        f32 step = (timeStep * getSpeedFactor());
        m_timeLeft -= step;
        
        if(m_timeLeft <= 0)
        {
            if(!isFinishedRepeating())
                decrementRepeatCounter();
        }
    }
    
    bool Action::isFinished()const
    {
        return (m_timeLeft <= 0);
    }
    
    bool Action::isFinishedRepeating()const
    {
        if(m_RepeatCount == std::numeric_limits<s32>::min())
        {
            return false;
        }
        
        return (m_RepeatCount <= 0);
    }
    
    bool Action::isChildrenFinished()const
    {
        for (u32 i = 0; i < m_ActionGroups.size(); ++i)
        {
            Sequence *sequence = m_ActionGroups.at(i);
            if(sequence->numberOfActions > 0)
                return false;
        }
        return true;
    }
    
    void Action::handleActionChildren(f32 timeStep)
    {
        for (u32 i = 0; i < m_ActionGroups.size(); ++i)
        {
            Sequence *currentSequence = m_ActionGroups.at(i);
            
            if(currentSequence->numberOfActions > 0)
            {
                std::queue<Action*> *currentQueue = m_ActionGroups.at(i)->sequenceQueue;
                
                if(currentQueue->size() > 0)
                {
                    Action *currentAction = currentQueue->front();
                    
                    currentAction->update(timeStep);
                    
                    if (currentAction->isFinished() && currentAction->isFinishedRepeating() && currentAction->isChildrenFinished())
                    {
                        currentQueue->pop();
                        
                        currentAction->m_timeLeft = currentAction->getDuration();
                        
                        currentQueue->push(currentAction);
                        
                        --m_ActionGroups.at(i)->numberOfActions;
                    }
                }
                
            }
        }
    }
    
    void Action::decrementRepeatCounter()
    {
        if(m_RepeatCount != std::numeric_limits<s32>::min())
        {
            --m_RepeatCount;
        }
        
        m_timeLeft = m_Duration;
        for (u32 i = 0; i < m_ActionGroups.size(); ++i)
        {
            m_ActionGroups.at(i)->numberOfActions = m_ActionGroups.at(i)->sequenceQueue->size();
            
        }
    }
}