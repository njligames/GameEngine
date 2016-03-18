#!/bin/sh

#  SWIG.sh
#  JLIGameEngineTest
#
#  Created by James Folk on 11/24/14.
#  Copyright (c) 2014 James Folk. All rights reserved.

#-w325 Warning 325: Nested struct not currently supported
#-w312 Warning 312: Nested union not currently supported
#-w201 Warning 201: Unable to find
#-w402 Warning 402: Base class is incomplete.
#-w402 Warning 402: Only forward declaration was found.
#-w401 Warning 401: Nothing known about base class . Ignored.
#-w401 Warning 401: Maybe you forgot to instantiate using %template.
#-w451 Warning 451: Setting a const char * variable may leak memory.

#swig -c++ -lua -includeall -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/platform/core" -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/src" -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/bullet/bullet-2.82-r2704/src" -I"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/OpenGLES.framework/Headers" -I"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/OpenAL.framework/Headers" -features directors,autodoc=1 -ignoremissing -w325 -w312 -w201  -w451 -debug-csymbols -debug-module 4 -DBT_SDK -DBT_SWIG -DBT_NO_NAMESPACE -o /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/src/Lua/SwigLuaWrapper.h /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/src/Lua/Lua.i > /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/src/Lua/SwigLuaWrapper.log

#swig -c++ -lua -includeall -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/bullet/bullet-2.82-r2704/src" -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/src" -features directors,autodoc=1 -ignoremissing -w325 -w312 -w201  -w451 -debug-csymbols -debug-module 4 -DBT_SDK -DBT_SWIG -DBT_NO_NAMESPACE -DBT_INFINITY -o /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/src/Lua/SwigLuaWrapper.h /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/src/Lua/Lua.i > /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/src/Lua/SwigLuaWrapper.log

#swig -c++ -lua -includeall -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/platform/core" -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/bullet/bullet-2.82-r2704/src" -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/src" -features directors,autodoc=1 -ignoremissing -w325 -w312 -w201  -w451 -debug-csymbols -debug-module 4 -DBT_SDK -DBT_SWIG -DBT_NO_NAMESPACE -DBT_INFINITY -o /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/src/SwigLuaWrapper.h /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/src/Lua/Lua.i > /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/src/Lua/SwigLuaWrapper.log

swig -c++ -lua -includeall -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/platform/core" -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/bullet/bullet-2.82-r2704/src" -I"/Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/src" -features directors,autodoc=1 -ignoremissing -w325 -w312 -w201  -w451 -debug-csymbols -debug-module 4 -DBT_SDK -DBT_SWIG -DBT_NO_NAMESPACE -DBT_INFINITY -o /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/lua/njli.h /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/src/Lua/Lua.i > /Users/jamesfolk/Dropbox/GameDevelopment/mygames/third_party/jli_game_engine/version-1.0/src/Lua/njli.log


