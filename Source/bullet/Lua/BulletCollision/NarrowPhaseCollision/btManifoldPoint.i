// ./BulletCollision/NarrowPhaseCollision/btManifoldPoint.i

//Factory

//Extend
%extend btManifoldPoint
{
    const char *__str__()
    {
        static char buffer[1024];
        sprintf(buffer,"%s",toJsonString(*self).c_str());
        return buffer;
    }
    
    const char *__concat__(const char *s) {
        static char tmp[1024];
        sprintf(tmp,"\
                Distance: %f\n\
                LifeTime: %d\n\
                PositionOnA btVector3(%f, %f, %f)\n\
                PositionOnB btVector3(%f, %f, %f)\n\
                Applied Impulse %f\n",
                self->getDistance(),
                self->getLifeTime(),
                self->getPositionWorldOnA().x(), self->getPositionWorldOnA().y(), self->getPositionWorldOnA().z(),
                self->getPositionWorldOnB().x(), self->getPositionWorldOnB().y(), self->getPositionWorldOnB().z(),
                self->getAppliedImpulse());
        
        static std::string temp;
        std::string t1(tmp);
        std::string t2(s);
        
        temp = (t1 + t2);
        return temp.c_str();
    }
}
