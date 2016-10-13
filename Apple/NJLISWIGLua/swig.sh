#!/bin/sh

#  Script.sh
#  NJLISWIGLua
#
#  Created by James Folk on 2/17/16.
#  Copyright © 2016 NJLIGames Ltd. All rights reserved.

#SRC=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/../../Source/
#INTERFACE=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/../../Lua/
#
##Input
#NJLI_CORE_SOURCE="${SRC}/platform/core"
#BULLET_SOURCE="${SRC}/bullet/bullet-2.82-r2704/src"
#NJLI_SOURCE="${SRC}/jli_game_engine/version-1.0/src"
#NJLI_INTERFACE_FILE="${INTERFACE}/njli_game_engine/Lua.i"
#
##Output
#NJLI_XML_FILE="${SRC}/jli_game_engine/version-1.0/doc/swig/njli.xml"
#NJLI_CPP_OUTPUT="${SRC}/lua/lua/src/njli.cpp"
#NJLI_SYMBOL_FILE="${SRC}/jli_game_engine/version-1.0/doc/swig/njli.log"
#LUA_RUNTIME_OUTPUT="${SRC}/lua/njli_swig_runtime.h"
#
#/usr/local/bin/swig -c++ -lua -includeall -I${NJLI_CORE_SOURCE} -I${BULLET_SOURCE} -I${NJLI_SOURCE} -nodefaultctor -nodefaultdtor -debug-symbols -features directors,autodoc=1 -ignoremissing -w325 -w312 -w201  -w451 -w402 -w401 -w509 -w503 -fcompact -fvirtual -DBT_INFINITY -xmlout ${NJLI_XML_FILE} -o ${NJLI_CPP_OUTPUT} ${NJLI_INTERFACE_FILE} > ${NJLI_SYMBOL_FILE}
#
#
#
#/usr/local/bin/swig -lua -external-runtime ${LUA_RUNTIME_OUTPUT}





SRC=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/../../Source

#LUA_DIR="lua-5.2.4"
#LUA_DIR="lua"
LUA_DIR="lua-5.3.3"

USR_INCLUDE="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include"
CLANG_SOURCE="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/7.0.2/include"
CPP_SOURCE="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"
#CPP_SOURCE="/usr/local/include/c++/5.3.0"

#LUA_SOURCE_OUT="${SRC}/lua/${LUA_DIR}/src"
LUA_SOURCE_OUT="${SRC}/lua"

BULLET_SOURCE="${SRC}/bullet"
BULLET_SOURCE0="${SRC}/bullet/bullet-2.82-r2704/src"
BULLET_SOURCE1="${BULLET_SOURCE0}/BulletCollision/BroadphaseCollision"
BULLET_SOURCE2="${BULLET_SOURCE0}/BulletCollision/CollisionDispatch"
BULLET_SOURCE3="${BULLET_SOURCE0}/BulletCollision/CollisionShapes"
BULLET_SOURCE4="${BULLET_SOURCE0}/BulletCollision/Gimpact"
BULLET_SOURCE5="${BULLET_SOURCE0}/BulletCollision/NarrowPhaseCollision"
BULLET_SOURCE6="${BULLET_SOURCE0}/BulletDynamics/Character"
BULLET_SOURCE7="${BULLET_SOURCE0}/BulletDynamics/ConstraintSolver"
BULLET_SOURCE8="${BULLET_SOURCE0}/BulletDynamics/Dynamics"
BULLET_SOURCE9="${BULLET_SOURCE0}/BulletDynamics/Featherstone"
BULLET_SOURCE10="${BULLET_SOURCE0}/BulletDynamics/MLCPSolvers"
BULLET_SOURCE11="${BULLET_SOURCE0}/BulletDynamics/Vehicle"
BULLET_SOURCE12="${BULLET_SOURCE0}/BulletSoftBody"
BULLET_SOURCE13="${BULLET_SOURCE0}/LinearMath"
BULLET_SOURCE14="${BULLET_SOURCE0}/MiniCL"
BULLET_SOURCE15="${BULLET_SOURCE0}/MiniCL/MiniCLTask"
BULLET_SOURCE16="${BULLET_SOURCE0}/vectormath"
BULLET_SOURCE17="${BULLET_SOURCE0}/vectormath/neon"
BULLET_SOURCE18="${BULLET_SOURCE0}/vectormath/scalar"
BULLET_SOURCE19="${BULLET_SOURCE0}/vectormath/sse"

JSON_SOURCE="${SRC}/json/jsoncpp/include"

NANOVG_SOURCE="${SRC}/nanovg/nanovg/src"

BULLET_XML_FILE="${SRC}/jli_game_engine/version-1.0/doc/swig/bullet.xml"
BULLET_CPP_OUTPUT="${LUA_SOURCE_OUT}/lbullet.cpp"
BULLET_INTERFACE_FILE="${SRC}/bullet/Lua/_LuaEntry.i"
BULLET_SYMBOL_FILE="${SRC}/jli_game_engine/version-1.0/doc/swig/lua-symbol-bullet.txt"

NJLI_CORE_SOURCE="${SRC}/platform/core"
NJLI_SOURCE="${SRC}/jli_game_engine/version-1.0/src"
NJLI_INTERFACE_FILE="${SRC}/jli_game_engine/Lua/_LuaEntry.i"
NJLI_XML_FILE="${SRC}/jli_game_engine/version-1.0/doc/swig/njli.xml"
NJLI_CPP_OUTPUT="${LUA_SOURCE_OUT}/lnjli.cpp"
NJLI_SYMBOL_FILE="${SRC}/jli_game_engine/version-1.0/doc/swig/lua-symbol-njli.txt"

LUA_RUNTIME_OUTPUT="${LUA_SOURCE_OUT}/njli_swig_runtime.h"


#-I${CPP_SOURCE} -cpperraswarn -I${STD_SOURCE} -I${CLANG_SOURCE} -I${JSON_SOURCE} -I${NANOVG_SOURCE}

#-w325 -w312 -w201 -w402 -w401 -w451 -w350 -w351 -w394 -w395

#-w312 -w201 -w401 -w402


#-w312 - Nested Unions
#-w201 - include file

#-debug-symbols

/usr/local/bin/swig -w312 -w201 -O -small -c++ -lua -includeall -ignoremissing -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -features directors,autodoc=1 -DBT_INFINITY -xmlout ${BULLET_XML_FILE} -o ${BULLET_CPP_OUTPUT} ${BULLET_INTERFACE_FILE}
#> ${BULLET_SYMBOL_FILE}

#-w201 -w312 -w402

/usr/local/bin/swig -w312 -w201 -O -small -c++ -lua -includeall -ignoremissing -I${BULLET_SOURCE} -I${BULLET_SOURCE0} -I${BULLET_SOURCE1} -I${BULLET_SOURCE2} -I${BULLET_SOURCE3} -I${BULLET_SOURCE4} -I${BULLET_SOURCE5} -I${BULLET_SOURCE6} -I${BULLET_SOURCE7} -I${BULLET_SOURCE8} -I${BULLET_SOURCE9} -I${BULLET_SOURCE10} -I${BULLET_SOURCE11} -I${BULLET_SOURCE12} -I${BULLET_SOURCE13} -I${BULLET_SOURCE14} -I${BULLET_SOURCE15} -I${BULLET_SOURCE16} -I${BULLET_SOURCE17} -I${BULLET_SOURCE18} -I${BULLET_SOURCE19} -I${NJLI_CORE_SOURCE} -I${NJLI_SOURCE} -features directors,autodoc=1 -xmlout ${NJLI_XML_FILE} -o ${NJLI_CPP_OUTPUT} ${NJLI_INTERFACE_FILE}
#> ${NJLI_SYMBOL_FILE}

/usr/local/bin/swig -lua -external-runtime ${LUA_RUNTIME_OUTPUT}

