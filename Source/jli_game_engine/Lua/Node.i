//Factory
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

//Extend
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
        
        for (u32 i = 0; i < nelements; i++)
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
        
        for (u32 i = 0; i < nelements; i++)
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
        
        for (u32 i = 0; i < nelements; i++)
            ret[i] = items[i];
        
        return ret;
    }
}
