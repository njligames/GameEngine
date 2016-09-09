//
//  NJLIGameEngineObjC.m
//  NJLIGameEngine
//
//  Created by James Folk on 9/5/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import "NJLIGameEngineObjC.h"

#include "lua.hpp"
#include <string>

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

const char *BUNDLE_PATH()
{
    NSMutableString *path = [[NSMutableString alloc] initWithString:[[NSBundle mainBundle] resourcePath]];
    [path appendString: [[NSString alloc] initWithCString:"/"
                                                 encoding:NSASCIIStringEncoding]];
    
    return [path UTF8String];
}

@implementation NJLIGameEngineObjC
{
    lua_State* L;
}

- (void)runScript:(NSString*)script
{
     NSLog(@"Running Script... %@", script);
    
    if(luaL_loadstring(L, [script UTF8String]) != LUA_OK)
        printf("%s", lua_tostring( L, -1 ));
    if(lua_pcall( L, 0, LUA_MULTRET, 0 ) != LUA_OK)
        printf("%s", lua_tostring( L, -1 ));
}

- (void)create:(GLKView*)view
{
    L = luaL_newstate();
    luaL_checkversion(L);
    
//    DEBUG_LOG_V(TAG, "Lua version: %s\n", LUA_VERSION);
    NSLog(@"%s", LUA_VERSION);
    
    luaL_openlibs(L);
    
    if(L)
    {
        NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
        NSString *appPath = [NSString stringWithFormat:@"appPath = '%@/?.so'",bundlePath];
        [self runScript:appPath];

        NSString *s = @"\n\
        package.cpath = appPath\n\
        require(\'bullet\')\n\
        require(\'njli\')\n\
        njli.World.createInstance()\n\
        print(bullet._VERSION)\n\
        local v = bullet.btVector3(10, 20, 30)\n\
        print(v:x(), v:y(), v:z())\n\
        print('hi')\n\
        local node = njli.Node.create()\n\
        node:setName(\'jim\')\n\
        print(node:getName())\n\
        \n\
        \n\
        \n";
        
       
        [self runScript:s];
    }
}

- (void)destroy
{
    
}

- (void)update:(NSTimeInterval)interval
{
    
}

- (void)render
{
    
}

- (void)resize:(GLKView*)view orientation:(UIInterfaceOrientation)orientation
{
    
}

- (void)touchDown:(NSSet *)touches
{
    
}

- (void)touchUp:(NSSet *)touches
{
    
}

- (void)touchMove:(NSSet *)touches
{
    
}

- (void)touchCancelled:(NSSet *)touches
{
    
}

- (void)willResignActive
{
    
}

- (void)didBecomeActive
{
    
}

- (void)didEnterBackground
{
    
}

- (void)willEnterForeground
{
    
}

- (void)willTerminate
{
    
}

- (void)interrupt
{
    
}

- (void)resumeInterrupt
{
    
}

@end
