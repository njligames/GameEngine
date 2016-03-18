// This file was created by Filewrap 1.2
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: envmap.pfx ********

// File data
static const char _envmap_pfx[] = 
	"[HEADER]\n"
	"\tVERSION\t\t00.00.00.00\n"
	"\tDESCRIPTION Environment Map Example\n"
	"\tCOPYRIGHT\tImagination Technologies Ltd.\n"
	"[/HEADER]\n"
	"\n"
	"[TEXTURES]\n"
	"\tFILE base \t\t\tbase.pvr\t\t\tLINEAR-LINEAR-LINEAR\n"
	"\tFILE reflection \treflection.pvr\t\tLINEAR-LINEAR-LINEAR\n"
	"[/TEXTURES]\n"
	"\n"
	"[VERTEXSHADER]\n"
	"\tNAME myVertShader\n"
	"\t[GLSL_CODE]\n"
	"\t\tattribute highp vec4\tmyVertex;\n"
	"\t\tattribute mediump vec3\tmyNormal;\n"
	"\t\tattribute mediump vec4\tmyUV;\n"
	"\t\tuniform mediump mat4\tmyMVPMatrix;\n"
	"\t\tuniform mediump mat3\tmyModelViewIT;\n"
	"\n"
	"\t\tmediump vec3  Normal;\n"
	"\t\tmediump vec3  EyeDir;\n"
	"\t\t\n"
	"\t\tvarying mediump float LightIntensity;\n"
	"\t\tvarying mediump vec2  texCoord;\n"
	"\t\tvarying mediump vec2  ReflectTexCoord;\n"
	"\n"
	"\t\tconst mediump vec3  LightPos = vec3(1,1,1);\n"
	"\t\tconst mediump vec3 Xunitvec = vec3 (1.0, 0.0, 0.0);\n"
	"\t\tconst mediump vec3 Yunitvec = vec3 (0.0, 1.0, 0.0);\n"
	"\n"
	"\t\tvoid main(void) \n"
	"\t\t{\n"
	"\t\t\t// Transform Position\n"
	"\t\t\tgl_Position = myMVPMatrix * myVertex;\n"
	"\t\t\t\n"
	"\t\t\t// Transform Normal\n"
	"\t\t\tNormal = myModelViewIT * myNormal;\n"
	"\t\t\t\t\n"
	"\t\t\t// Calculate diffuse lighting\n"
	"\t\t\tEyeDir         = vec3(gl_Position);\n"
	"\t\t\tLightIntensity = abs(dot(normalize(LightPos - EyeDir), Normal))*0.5+0.5;\n"
	"\t\t\t\n"
	"\t\t\t// Passtrough UVs\n"
	"\t\t\ttexCoord = myUV.st;\n"
	"\t\t\t\n"
	"\t\t\t// Compute reflection vector   \n"
	"\t\t\tmediump vec3 reflectDir = normalize(reflect(EyeDir, Normal));\n"
	"\n"
	"\t\t\t// Compute altitude and azimuth angles\n"
	"\t\t\tReflectTexCoord.y = dot(reflectDir, Yunitvec);\n"
	"\t\t\tReflectTexCoord.x = dot(reflectDir, Xunitvec);\n"
	"\n"
	"\t\t\tReflectTexCoord = (ReflectTexCoord + 1.0) * 0.5;\n"
	"\n"
	"\t\t}\n"
	"\t[/GLSL_CODE]\n"
	"[/VERTEXSHADER]\n"
	"\n"
	"[FRAGMENTSHADER]\n"
	"\tNAME myFragShader\n"
	"\t[GLSL_CODE]\n"
	"\n"
	"\n"
	"\t\tconst mediump vec3  BaseColor = vec3(0.5, 1.0, 0.8);\n"
	"\t\tconst mediump float MixRatio = 0.6;\n"
	"\n"
	"\t\tuniform sampler2D sampler2d;\n"
	"\t\tuniform sampler2D reflect2d;\n"
	"\n"
	"\t\tvarying mediump float LightIntensity;\n"
	"\t\tvarying mediump vec2  texCoord;\n"
	"\t\tvarying mediump vec2  ReflectTexCoord;\n"
	"\n"
	"\t\tvoid main (void)\n"
	"\t\t{\n"
	"\n"
	"\t\t\t// Draw the static base    \n"
	"\t\t\tmediump vec3 envColor  = vec3 (texture2D(sampler2d, texCoord));\n"
	"\t\t    \n"
	"\t\t\t// Do a lookup into the environment map.\n"
	"\t\t\tmediump vec3 envColor2 = vec3 (texture2D(reflect2d, ReflectTexCoord));\n"
	"\t\t\t\n"
	"\t\t\t// Mix them\n"
	"\t\t\tenvColor = mix(envColor, envColor2, MixRatio);\n"
	"\n"
	"\t\t\t// Add lighting to base color and mix\n"
	"\t\t\tmediump vec3 base = LightIntensity * BaseColor;\n"
	"\t\t\tenvColor = mix(envColor, base, MixRatio);\n"
	"\n"
	"\t\t\tgl_FragColor = vec4 (envColor, 1.0);\n"
	"\t\t}\n"
	"\t[/GLSL_CODE]\n"
	"[/FRAGMENTSHADER]\n"
	"\n"
	"[EFFECT]\n"
	"\tNAME myEffect\n"
	"\n"
	"\tATTRIBUTE\tmyVertex\t\t\tPOSITION\n"
	"\tATTRIBUTE\tmyNormal\t\t\tNORMAL\n"
	"\tATTRIBUTE\tmyUV\t\t\t\tUV\n"
	"\tUNIFORM\t\tmyMVPMatrix\t\t\tWORLDVIEWPROJECTION\n"
	"\tUNIFORM\t\tmyModelViewIT\t\tWORLDVIEWIT\n"
	"\tUNIFORM\t\tsampler2d\t\t\tTEXTURE0\n"
	"\tUNIFORM\t\treflect2d\t\t\tTEXTURE1\n"
	"\n"
	"\tTEXTURE 0 base\n"
	"\tTEXTURE 1 reflection\n"
	"\n"
	"\tVERTEXSHADER myVertShader\n"
	"\tFRAGMENTSHADER myFragShader\n"
	"[/EFFECT]\n";

// Register envmap.pfx in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_envmap_pfx("envmap.pfx", _envmap_pfx, 2691);

// ******** End: envmap.pfx ********

