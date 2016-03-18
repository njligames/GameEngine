/* -----------------------------------------------------------------------------
 * carrays.i
 *
 * SWIG library file containing macros that can be used to manipulate simple
 * pointers as arrays.
 * ----------------------------------------------------------------------------- */

/* -----------------------------------------------------------------------------
 * %array_functions(TYPE,NAME)
 *
 * Generates functions for creating and accessing elements of a C array
 * (as pointers).  Creates the following functions:
 *
 *        TYPE *new_NAME(int nelements)
 *        void delete_NAME(TYPE *);
 *        TYPE NAME_getitem(TYPE *, int index);
 *        void NAME_setitem(TYPE *, int index, TYPE value);
 *
 * ----------------------------------------------------------------------------- */

//%rename(__getitem) *::getitem; // the v=X[i] (get operator)
//%rename(__setitem) *::setitem; // the X[i]=v (set operator)



/* -----------------------------------------------------------------------------
 * carrays.i
 *
 * SWIG library file containing macros that can be used to manipulate simple
 * pointers as arrays.
 * ----------------------------------------------------------------------------- */

/* -----------------------------------------------------------------------------
 * %array_functions(TYPE,NAME)
 *
 * Generates functions for creating and accessing elements of a C array
 * (as pointers).  Creates the following functions:
 *
 *        TYPE *new_NAME(int nelements)
 *        void delete_NAME(TYPE *);
 *        TYPE NAME_getitem(TYPE *, int index);
 *        void NAME_setitem(TYPE *, int index, TYPE value);
 *
 * ----------------------------------------------------------------------------- */

//%define %jli_array_functions(TYPE,NAME)
//%{
//    static TYPE **new_##NAME(int nelements) { %}
////#ifdef __cplusplus
//    %{  return (TYPE**)(jli::World::getInstance()->getWorldFactory()->createArray(TYPE::type(), nelements)); %}
////#else
////    %{  return (TYPE *) calloc(nelements,sizeof(TYPE)); %}
////#endif
//    %{}
//    
//    static void delete_##NAME(TYPE **ary) { %}
////#ifdef __cplusplus
//    %{  jli::World::getInstance()->getWorldFactory()->destroyArray((jli::AbstractFactoryObject**)ary); %}
////#else
////    %{  free(ary); %}
////#endif
//    %{}
//    
//    static TYPE NAME##_getitem(TYPE *ary, int index) {
//        return ary[index-1];
//    }
//    static void NAME##_setitem(TYPE *ary, int index, TYPE value) {
//        ary[index-1] = value;
//    }
//    %}
//
//TYPE *new_##NAME(int nelements);
//void delete_##NAME(TYPE *ary);
//TYPE NAME##_getitem(TYPE *ary, int index);
//void NAME##_setitem(TYPE *ary, int index, TYPE value);
//
//%enddef


/* -----------------------------------------------------------------------------
 * %array_class(TYPE,NAME)
 *
 * Generates a class wrapper around a C array.  The class has the following
 * interface:
 *
 *          struct NAME {
 *              NAME(int nelements);
 *             ~NAME();
 *              TYPE getitem(int index);
 *              void setitem(int index, TYPE value);
 *              TYPE * cast();
 *              static NAME *frompointer(TYPE *t);
 *         }
 *
 * ----------------------------------------------------------------------------- */

//%define %jli_array_class(TYPE,NAME)
//%{
//    typedef TYPE NAME;
//    %}
//typedef struct {
//    /* Put language specific enhancements here */
//    int numberOfElements;
//} NAME;
//
//%extend NAME {
//    
////#ifdef __cplusplus
//    NAME(int nelements) {
//        numberOfElements = nelements;
//        return (TYPE**)(jli::World::getInstance()->getWorldFactory()->createArray(TYPE::type(), nelements));
//    }
//    ~NAME() {
//        jli::World::getInstance()->getWorldFactory()->destroyArray((jli::AbstractFactoryObject**)ary, numberOfElements);
//    }
////#else
////    NAME(int nelements) {
////        return (TYPE *) calloc(nelements,sizeof(TYPE));
////    }
////    ~NAME() {
////        free(self);
////    }
////#endif
//    
//    TYPE getitem(int index) {
//        return self[index-1];
//    }
//    void setitem(int index, TYPE value) {
//        self[index-1] = value;
//    }
//    TYPE * cast() {
//        return self;
//    }
//    static NAME *frompointer(TYPE *t) {
//        return (NAME *) t;
//    }
//    
//};
//
//%types(NAME = TYPE);
//
//%enddef































%define %jli_array_functions(TYPE,NAME)
//%newobject new_##NAME;
//%delobject delete_##NAME;

//%factory(jli::Action *jli::Action::create, jli::Action /*Add the children to the Action class*/);
%{
    static TYPE **new_##NAME(int nelements) { %}

    %{  //return (TYPE**)(jli::World::getInstance()->getWorldFactory()->createArray(TYPE::type(), nelements));
        return TYPE::createArray(nelements);
        %}
    
    %{}
    
    static void delete_##NAME(TYPE **ary) { %}

    %{  //jli::World::getInstance()->getWorldFactory()->destroyArray((jli::AbstractFactoryObject**)ary);
        TYPE::destroyArray(ary);
        %}
    
    %{}
    
    static TYPE *NAME##_getitem(TYPE **ary, int index) {
        DEBUG_ASSERT_WRITE(index > 0, "index must be greater than zero.");
        return ary[index-1];
    }
    static void NAME##_setitem(TYPE **ary, int index, TYPE *value) {
        DEBUG_ASSERT_WRITE(index > 0, "index must be greater than zero.");
        ary[index-1] = value;
    }
    %}

TYPE **new_##NAME(int nelements);
void delete_##NAME(TYPE **ary);
TYPE *NAME##_getitem(TYPE **ary, int index);
void NAME##_setitem(TYPE **ary, int index, TYPE *value);

%enddef


/* -----------------------------------------------------------------------------
 * %array_class(TYPE,NAME)
 *
 * Generates a class wrapper around a C array.  The class has the following
 * interface:
 *
 *          struct NAME {
 *              NAME(int nelements);
 *             ~NAME();
 *              TYPE getitem(int index);
 *              void setitem(int index, TYPE value);
 *              TYPE * cast();
 *              static NAME *frompointer(TYPE *t);
 *         }
 *
 * ----------------------------------------------------------------------------- */

//%define %jli_array_class(TYPE,NAME)
//%{
//    typedef TYPE NAME;
//    %}
//typedef struct {
//    int numberOfElements;
//    /* Put language specific enhancements here */
//} NAME;
//
//
//
//%extend NAME {
//    
//    NAME(int nelements) {
//        this->numberOfElements = nelements;
//        return dynamic_cast<TYPE*>(jli::World::getInstance()->getWorldFactory()->createArray(TYPE::type(), nelements));
//    }
//    ~NAME() {
//        jli::World::getInstance()->getWorldFactory()->destroyArray(self, this->numberOfElements);
//    }
//    
//    TYPE getitem(int index) {
//        return self[index];
//    }
//    void setitem(int index, TYPE value) {
//        self[index] = value;
//    }
//    TYPE * cast() {
//        return self;
//    }
//    static NAME *frompointer(TYPE *t) {
//        return (NAME *) t;
//    }
//    
//    
//};
//
//%types(NAME = TYPE);
//
//%enddef

