# How to add a new class
1. Add the new class in alphabetical order and insert the xcode code snippet into the header file
2. Add the new class's builder and insert the xcode code snippet into the header file.
3. Replace all of the snippet completions.
4. Add the new enumerations to the jliObjectEnumType in alphabetical order in the file: JLIFactoryTypes.h.
5. Add the construction functionality to WorldFactory.cpp for the following functions...
	1. `AbstractFactory **WorldFactory::ctor(const u32 &type, u32 type);`
	2. `AbstractFactoryObject *WorldFactory::ctor(const u32 &type)`
	3. `AbstractFactoryObject *WorldFactory::ctor(const AbstractBuilder &builder)`
	4. `AbstractFactoryObject *WorldFactory::ctor(const AbstractFactoryObject &object)`
6. Add the construction functionality to GameEngine/Source/jli_game_engine/Lua/_LuaEntry.i to the following function...
	1. `int build_type(lua_State *L)`
7. Add the builder enumerator to WorldFactory.cpp for the following function...
	1. `bool WorldFactory::isBuilder(u32 type)
8. Add the includes to the JLIEngine.h file.
9. Add the includes to the WorldFactory.cpp file.
10. Add the Lua factory methods to Lua.i.
11. Add the derived classes to the factory methods of the base class in Lua.i
12. Add the classes to `%factory(jli::AbstractFactoryObject *jli::WorldFactory::create,` in Lua.i
13. Add the `%njli_array_functions` for the classes Lua.i.
14. Add the `%extend` for the classes in Lua.i.
15. Add `SWIG_USERDATA_TYPEMAP` in LuaTypemaps.i
16. Add the new class's to the make file: android/app/src/main/jni/game/Android.mk
