//
//  Util.h
//  JLIGameEngineTest
//
//  Created by James Folk on 11/9/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#ifndef JLIGameEngineTest_Util_h
#define JLIGameEngineTest_Util_h

//#include "Game.h"
#include "Log.h"
//#include <csignal>
//#include <cstdlib>
#include <stdlib.h>
#include <stdio.h>
//#include <string>

#ifndef NULL
#define NULL ((void*)0)
#endif

#define PI 3.14159265358979323846264338327f

//#if defined(DEBUG) || defined(_DEBUG)
//#define JLI_DEBUG
//#endif

typedef char s8;
typedef unsigned char u8;
typedef short s16;
typedef unsigned short u16;
typedef int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef float f32;
typedef double f64;

#define BUFFER_SIZE 512

inline char IsOn(const s32 value, const s32 bit)
{
    int v = value & bit;
    char ret = (v == 0) ? 0 : 1;
    return ret;
}

inline u32 On(const s32 value, const s32 bit)//, bool on = true)
{
    return value | bit;
}

inline u32 Off(const s32 value, const s32 bit)
{
    if (IsOn(value, bit)) {
        return value ^ bit;
    }
    return value;
}

inline f32 clampf(const f32 value, const f32 min, const f32 max)
{
    return (value < min) ? min : ((value > max) ? max : value);
}

inline s32 clamp(const s32 value, const s32 min, const s32 max)
{
    return (value < min) ? min : ((value > max) ? max : value);
}

inline f32 clampColor(const f32 color)
{
    return clampf(color, 0.0f, 1.0f);
}

inline s32 isPowerOfTwo(s32 v)
{
    return v && !(v & (v - 1));
}

inline s32 fixPowerOfTwo(s32 v)
{
    v--;
    v |= v >> 1;
    v |= v >> 2;
    v |= v >> 4;
    v |= v >> 8;
    v |= v >> 16;
    v++;
    
    return v;
}


#endif
