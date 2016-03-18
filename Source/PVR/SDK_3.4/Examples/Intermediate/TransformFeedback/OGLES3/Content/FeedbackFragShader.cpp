// This file was created by Filewrap 1.2
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: FeedbackFragShader.fsh ********

// File data
static const char _FeedbackFragShader_fsh[] = 
	"#version 300 es\r\n"
	"\r\n"
	"layout(location = 0) out lowp vec4 oColour;\r\n"
	"\r\n"
	"void main()\r\n"
	"{\r\n"
	"\toColour = vec4(1.0);\r\n"
	"}\r\n";

// Register FeedbackFragShader.fsh in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_FeedbackFragShader_fsh("FeedbackFragShader.fsh", _FeedbackFragShader_fsh, 108);

// ******** End: FeedbackFragShader.fsh ********

