#define GL_APIENTRY
#define GL_API extern


/*-------------------------------------------------------------------------
 * Data type definitions
 *-----------------------------------------------------------------------*/

typedef void            GLvoid;
typedef char            GLchar;
typedef unsigned int    GLenum;
typedef unsigned char   GLboolean;
typedef unsigned int    GLbitfield;
typedef signed char     GLbyte;
typedef short           GLshort;
typedef int             GLint;
typedef int             GLsizei;
typedef unsigned char   GLubyte;
typedef unsigned short  GLushort;
typedef unsigned int    GLuint;
typedef float           GLfloat;
typedef float           GLclampf;
typedef int             GLfixed;
typedef int             GLclampx;
typedef long            GLintptr;
typedef long            GLsizeiptr;

/*-------------------------------------------------------------------------
 * Token definitions
 *-----------------------------------------------------------------------*/

/* OpenGL ES core versions */
#define GL_ES_VERSION_2_0                                1

/* ClearBufferMask */
#define GL_DEPTH_BUFFER_BIT                              0x00000100
#define GL_STENCIL_BUFFER_BIT                            0x00000400
#define GL_COLOR_BUFFER_BIT                              0x00004000

/* Boolean */
#define GL_FALSE                                         0
#define GL_TRUE                                          1

/* BeginMode */
#define GL_POINTS                                        0x0000
#define GL_LINES                                         0x0001
#define GL_LINE_LOOP                                     0x0002
#define GL_LINE_STRIP                                    0x0003
#define GL_TRIANGLES                                     0x0004
#define GL_TRIANGLE_STRIP                                0x0005
#define GL_TRIANGLE_FAN                                  0x0006

/* BlendingFactorDest */
#define GL_ZERO                                          0
#define GL_ONE                                           1
#define GL_SRC_COLOR                                     0x0300
#define GL_ONE_MINUS_SRC_COLOR                           0x0301
#define GL_SRC_ALPHA                                     0x0302
#define GL_ONE_MINUS_SRC_ALPHA                           0x0303
#define GL_DST_ALPHA                                     0x0304
#define GL_ONE_MINUS_DST_ALPHA                           0x0305

/* BlendingFactorSrc */
/*      GL_ZERO */
/*      GL_ONE */
#define GL_DST_COLOR                                     0x0306
#define GL_ONE_MINUS_DST_COLOR                           0x0307
#define GL_SRC_ALPHA_SATURATE                            0x0308
/*      GL_SRC_ALPHA */
/*      GL_ONE_MINUS_SRC_ALPHA */
/*      GL_DST_ALPHA */
/*      GL_ONE_MINUS_DST_ALPHA */

/* BlendEquationSeparate */
#define GL_FUNC_ADD                                      0x8006
#define GL_BLEND_EQUATION                                0x8009
#define GL_BLEND_EQUATION_RGB                            0x8009    /* same as BLEND_EQUATION */
#define GL_BLEND_EQUATION_ALPHA                          0x883D

/* BlendSubtract */
#define GL_FUNC_SUBTRACT                                 0x800A
#define GL_FUNC_REVERSE_SUBTRACT                         0x800B

/* Separate Blend Functions */
#define GL_BLEND_DST_RGB                                 0x80C8
#define GL_BLEND_SRC_RGB                                 0x80C9
#define GL_BLEND_DST_ALPHA                               0x80CA
#define GL_BLEND_SRC_ALPHA                               0x80CB
#define GL_CONSTANT_COLOR                                0x8001
#define GL_ONE_MINUS_CONSTANT_COLOR                      0x8002
#define GL_CONSTANT_ALPHA                                0x8003
#define GL_ONE_MINUS_CONSTANT_ALPHA                      0x8004
#define GL_BLEND_COLOR                                   0x8005

/* Buffer Objects */
#define GL_ARRAY_BUFFER                                  0x8892
#define GL_ELEMENT_ARRAY_BUFFER                          0x8893
#define GL_ARRAY_BUFFER_BINDING                          0x8894
#define GL_ELEMENT_ARRAY_BUFFER_BINDING                  0x8895

#define GL_STREAM_DRAW                                   0x88E0
#define GL_STATIC_DRAW                                   0x88E4
#define GL_DYNAMIC_DRAW                                  0x88E8

#define GL_BUFFER_SIZE                                   0x8764
#define GL_BUFFER_USAGE                                  0x8765

#define GL_CURRENT_VERTEX_ATTRIB                         0x8626

/* CullFaceMode */
#define GL_FRONT                                         0x0404
#define GL_BACK                                          0x0405
#define GL_FRONT_AND_BACK                                0x0408

/* DepthFunction */
/*      GL_NEVER */
/*      GL_LESS */
/*      GL_EQUAL */
/*      GL_LEQUAL */
/*      GL_GREATER */
/*      GL_NOTEQUAL */
/*      GL_GEQUAL */
/*      GL_ALWAYS */

/* EnableCap */
#define GL_TEXTURE_2D                                    0x0DE1
#define GL_CULL_FACE                                     0x0B44
#define GL_BLEND                                         0x0BE2
#define GL_DITHER                                        0x0BD0
#define GL_STENCIL_TEST                                  0x0B90
#define GL_DEPTH_TEST                                    0x0B71
#define GL_SCISSOR_TEST                                  0x0C11
#define GL_POLYGON_OFFSET_FILL                           0x8037
#define GL_SAMPLE_ALPHA_TO_COVERAGE                      0x809E
#define GL_SAMPLE_COVERAGE                               0x80A0

/* ErrorCode */
#define GL_NO_ERROR                                      0
#define GL_INVALID_ENUM                                  0x0500
#define GL_INVALID_VALUE                                 0x0501
#define GL_INVALID_OPERATION                             0x0502
#define GL_OUT_OF_MEMORY                                 0x0505

/* FrontFaceDirection */
#define GL_CW                                            0x0900
#define GL_CCW                                           0x0901

/* GetPName */
#define GL_LINE_WIDTH                                    0x0B21
#define GL_ALIASED_POINT_SIZE_RANGE                      0x846D
#define GL_ALIASED_LINE_WIDTH_RANGE                      0x846E
#define GL_CULL_FACE_MODE                                0x0B45
#define GL_FRONT_FACE                                    0x0B46
#define GL_DEPTH_RANGE                                   0x0B70
#define GL_DEPTH_WRITEMASK                               0x0B72
#define GL_DEPTH_CLEAR_VALUE                             0x0B73
#define GL_DEPTH_FUNC                                    0x0B74
#define GL_STENCIL_CLEAR_VALUE                           0x0B91
#define GL_STENCIL_FUNC                                  0x0B92
#define GL_STENCIL_FAIL                                  0x0B94
#define GL_STENCIL_PASS_DEPTH_FAIL                       0x0B95
#define GL_STENCIL_PASS_DEPTH_PASS                       0x0B96
#define GL_STENCIL_REF                                   0x0B97
#define GL_STENCIL_VALUE_MASK                            0x0B93
#define GL_STENCIL_WRITEMASK                             0x0B98
#define GL_STENCIL_BACK_FUNC                             0x8800
#define GL_STENCIL_BACK_FAIL                             0x8801
#define GL_STENCIL_BACK_PASS_DEPTH_FAIL                  0x8802
#define GL_STENCIL_BACK_PASS_DEPTH_PASS                  0x8803
#define GL_STENCIL_BACK_REF                              0x8CA3
#define GL_STENCIL_BACK_VALUE_MASK                       0x8CA4
#define GL_STENCIL_BACK_WRITEMASK                        0x8CA5
#define GL_VIEWPORT                                      0x0BA2
#define GL_SCISSOR_BOX                                   0x0C10
/*      GL_SCISSOR_TEST */
#define GL_COLOR_CLEAR_VALUE                             0x0C22
#define GL_COLOR_WRITEMASK                               0x0C23
#define GL_UNPACK_ALIGNMENT                              0x0CF5
#define GL_PACK_ALIGNMENT                                0x0D05
#define GL_MAX_TEXTURE_SIZE                              0x0D33
#define GL_MAX_VIEWPORT_DIMS                             0x0D3A
#define GL_SUBPIXEL_BITS                                 0x0D50
#define GL_RED_BITS                                      0x0D52
#define GL_GREEN_BITS                                    0x0D53
#define GL_BLUE_BITS                                     0x0D54
#define GL_ALPHA_BITS                                    0x0D55
#define GL_DEPTH_BITS                                    0x0D56
#define GL_STENCIL_BITS                                  0x0D57
#define GL_POLYGON_OFFSET_UNITS                          0x2A00
/*      GL_POLYGON_OFFSET_FILL */
#define GL_POLYGON_OFFSET_FACTOR                         0x8038
#define GL_TEXTURE_BINDING_2D                            0x8069
#define GL_SAMPLE_BUFFERS                                0x80A8
#define GL_SAMPLES                                       0x80A9
#define GL_SAMPLE_COVERAGE_VALUE                         0x80AA
#define GL_SAMPLE_COVERAGE_INVERT                        0x80AB

/* GetTextureParameter */
/*      GL_TEXTURE_MAG_FILTER */
/*      GL_TEXTURE_MIN_FILTER */
/*      GL_TEXTURE_WRAP_S */
/*      GL_TEXTURE_WRAP_T */

#define GL_NUM_COMPRESSED_TEXTURE_FORMATS                0x86A2
#define GL_COMPRESSED_TEXTURE_FORMATS                    0x86A3

/* HintMode */
#define GL_DONT_CARE                                     0x1100
#define GL_FASTEST                                       0x1101
#define GL_NICEST                                        0x1102

/* HintTarget */
#define GL_GENERATE_MIPMAP_HINT                          0x8192

/* DataType */
#define GL_BYTE                                          0x1400
#define GL_UNSIGNED_BYTE                                 0x1401
#define GL_SHORT                                         0x1402
#define GL_UNSIGNED_SHORT                                0x1403
#define GL_INT                                           0x1404
#define GL_UNSIGNED_INT                                  0x1405
#define GL_FLOAT                                         0x1406
#define GL_FIXED                                         0x140C

/* PixelFormat */
#define GL_DEPTH_COMPONENT                               0x1902
#define GL_ALPHA                                         0x1906
#define GL_RGB                                           0x1907
#define GL_RGBA                                          0x1908
#define GL_LUMINANCE                                     0x1909
#define GL_LUMINANCE_ALPHA                               0x190A

/* PixelType */
/*      GL_UNSIGNED_BYTE */
#define GL_UNSIGNED_SHORT_4_4_4_4                        0x8033
#define GL_UNSIGNED_SHORT_5_5_5_1                        0x8034
#define GL_UNSIGNED_SHORT_5_6_5                          0x8363

/* Shaders */
#define GL_FRAGMENT_SHADER                               0x8B30
#define GL_VERTEX_SHADER                                 0x8B31
#define GL_MAX_VERTEX_ATTRIBS                            0x8869
#define GL_MAX_VERTEX_UNIFORM_VECTORS                    0x8DFB
#define GL_MAX_VARYING_VECTORS                           0x8DFC
#define GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS              0x8B4D
#define GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS                0x8B4C
#define GL_MAX_TEXTURE_IMAGE_UNITS                       0x8872
#define GL_MAX_FRAGMENT_UNIFORM_VECTORS                  0x8DFD
#define GL_SHADER_TYPE                                   0x8B4F
#define GL_DELETE_STATUS                                 0x8B80
#define GL_LINK_STATUS                                   0x8B82
#define GL_VALIDATE_STATUS                               0x8B83
#define GL_ATTACHED_SHADERS                              0x8B85
#define GL_ACTIVE_UNIFORMS                               0x8B86
#define GL_ACTIVE_UNIFORM_MAX_LENGTH                     0x8B87
#define GL_ACTIVE_ATTRIBUTES                             0x8B89
#define GL_ACTIVE_ATTRIBUTE_MAX_LENGTH                   0x8B8A
#define GL_SHADING_LANGUAGE_VERSION                      0x8B8C
#define GL_CURRENT_PROGRAM                               0x8B8D

/* StencilFunction */
#define GL_NEVER                                         0x0200
#define GL_LESS                                          0x0201
#define GL_EQUAL                                         0x0202
#define GL_LEQUAL                                        0x0203
#define GL_GREATER                                       0x0204
#define GL_NOTEQUAL                                      0x0205
#define GL_GEQUAL                                        0x0206
#define GL_ALWAYS                                        0x0207

/* StencilOp */
/*      GL_ZERO */
#define GL_KEEP                                          0x1E00
#define GL_REPLACE                                       0x1E01
#define GL_INCR                                          0x1E02
#define GL_DECR                                          0x1E03
#define GL_INVERT                                        0x150A
#define GL_INCR_WRAP                                     0x8507
#define GL_DECR_WRAP                                     0x8508

/* StringName */
#define GL_VENDOR                                        0x1F00
#define GL_RENDERER                                      0x1F01
#define GL_VERSION                                       0x1F02
#define GL_EXTENSIONS                                    0x1F03

/* TextureMagFilter */
#define GL_NEAREST                                       0x2600
#define GL_LINEAR                                        0x2601

/* TextureMinFilter */
/*      GL_NEAREST */
/*      GL_LINEAR */
#define GL_NEAREST_MIPMAP_NEAREST                        0x2700
#define GL_LINEAR_MIPMAP_NEAREST                         0x2701
#define GL_NEAREST_MIPMAP_LINEAR                         0x2702
#define GL_LINEAR_MIPMAP_LINEAR                          0x2703

/* TextureParameterName */
#define GL_TEXTURE_MAG_FILTER                            0x2800
#define GL_TEXTURE_MIN_FILTER                            0x2801
#define GL_TEXTURE_WRAP_S                                0x2802
#define GL_TEXTURE_WRAP_T                                0x2803

/* TextureTarget */
/*      GL_TEXTURE_2D */
#define GL_TEXTURE                                       0x1702

#define GL_TEXTURE_CUBE_MAP                              0x8513
#define GL_TEXTURE_BINDING_CUBE_MAP                      0x8514
#define GL_TEXTURE_CUBE_MAP_POSITIVE_X                   0x8515
#define GL_TEXTURE_CUBE_MAP_NEGATIVE_X                   0x8516
#define GL_TEXTURE_CUBE_MAP_POSITIVE_Y                   0x8517
#define GL_TEXTURE_CUBE_MAP_NEGATIVE_Y                   0x8518
#define GL_TEXTURE_CUBE_MAP_POSITIVE_Z                   0x8519
#define GL_TEXTURE_CUBE_MAP_NEGATIVE_Z                   0x851A
#define GL_MAX_CUBE_MAP_TEXTURE_SIZE                     0x851C

/* TextureUnit */
#define GL_TEXTURE0                                      0x84C0
#define GL_TEXTURE1                                      0x84C1
#define GL_TEXTURE2                                      0x84C2
#define GL_TEXTURE3                                      0x84C3
#define GL_TEXTURE4                                      0x84C4
#define GL_TEXTURE5                                      0x84C5
#define GL_TEXTURE6                                      0x84C6
#define GL_TEXTURE7                                      0x84C7
#define GL_TEXTURE8                                      0x84C8
#define GL_TEXTURE9                                      0x84C9
#define GL_TEXTURE10                                     0x84CA
#define GL_TEXTURE11                                     0x84CB
#define GL_TEXTURE12                                     0x84CC
#define GL_TEXTURE13                                     0x84CD
#define GL_TEXTURE14                                     0x84CE
#define GL_TEXTURE15                                     0x84CF
#define GL_TEXTURE16                                     0x84D0
#define GL_TEXTURE17                                     0x84D1
#define GL_TEXTURE18                                     0x84D2
#define GL_TEXTURE19                                     0x84D3
#define GL_TEXTURE20                                     0x84D4
#define GL_TEXTURE21                                     0x84D5
#define GL_TEXTURE22                                     0x84D6
#define GL_TEXTURE23                                     0x84D7
#define GL_TEXTURE24                                     0x84D8
#define GL_TEXTURE25                                     0x84D9
#define GL_TEXTURE26                                     0x84DA
#define GL_TEXTURE27                                     0x84DB
#define GL_TEXTURE28                                     0x84DC
#define GL_TEXTURE29                                     0x84DD
#define GL_TEXTURE30                                     0x84DE
#define GL_TEXTURE31                                     0x84DF
#define GL_ACTIVE_TEXTURE                                0x84E0

/* TextureWrapMode */
#define GL_REPEAT                                        0x2901
#define GL_CLAMP_TO_EDGE                                 0x812F
#define GL_MIRRORED_REPEAT                               0x8370

/* Uniform Types */
#define GL_FLOAT_VEC2                                    0x8B50
#define GL_FLOAT_VEC3                                    0x8B51
#define GL_FLOAT_VEC4                                    0x8B52
#define GL_INT_VEC2                                      0x8B53
#define GL_INT_VEC3                                      0x8B54
#define GL_INT_VEC4                                      0x8B55
#define GL_BOOL                                          0x8B56
#define GL_BOOL_VEC2                                     0x8B57
#define GL_BOOL_VEC3                                     0x8B58
#define GL_BOOL_VEC4                                     0x8B59
#define GL_FLOAT_MAT2                                    0x8B5A
#define GL_FLOAT_MAT3                                    0x8B5B
#define GL_FLOAT_MAT4                                    0x8B5C
#define GL_SAMPLER_2D                                    0x8B5E
#define GL_SAMPLER_CUBE                                  0x8B60

/* Vertex Arrays */
#define GL_VERTEX_ATTRIB_ARRAY_ENABLED                   0x8622
#define GL_VERTEX_ATTRIB_ARRAY_SIZE                      0x8623
#define GL_VERTEX_ATTRIB_ARRAY_STRIDE                    0x8624
#define GL_VERTEX_ATTRIB_ARRAY_TYPE                      0x8625
#define GL_VERTEX_ATTRIB_ARRAY_NORMALIZED                0x886A
#define GL_VERTEX_ATTRIB_ARRAY_POINTER                   0x8645
#define GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING            0x889F

/* Read Format */
#define GL_IMPLEMENTATION_COLOR_READ_TYPE                0x8B9A
#define GL_IMPLEMENTATION_COLOR_READ_FORMAT              0x8B9B

/* Shader Source */
#define GL_COMPILE_STATUS                                0x8B81
#define GL_INFO_LOG_LENGTH                               0x8B84
#define GL_SHADER_SOURCE_LENGTH                          0x8B88
#define GL_SHADER_COMPILER                               0x8DFA

/* Shader Binary */
#define GL_SHADER_BINARY_FORMATS                         0x8DF8
#define GL_NUM_SHADER_BINARY_FORMATS                     0x8DF9

/* Shader Precision-Specified Types */
#define GL_LOW_FLOAT                                     0x8DF0
#define GL_MEDIUM_FLOAT                                  0x8DF1
#define GL_HIGH_FLOAT                                    0x8DF2
#define GL_LOW_INT                                       0x8DF3
#define GL_MEDIUM_INT                                    0x8DF4
#define GL_HIGH_INT                                      0x8DF5

/* Framebuffer Object. */
#define GL_FRAMEBUFFER                                   0x8D40
#define GL_RENDERBUFFER                                  0x8D41

#define GL_RGBA4                                         0x8056
#define GL_RGB5_A1                                       0x8057
#define GL_RGB565                                        0x8D62
#define GL_DEPTH_COMPONENT16                             0x81A5
#define GL_STENCIL_INDEX8                                0x8D48

#define GL_RENDERBUFFER_WIDTH                            0x8D42
#define GL_RENDERBUFFER_HEIGHT                           0x8D43
#define GL_RENDERBUFFER_INTERNAL_FORMAT                  0x8D44
#define GL_RENDERBUFFER_RED_SIZE                         0x8D50
#define GL_RENDERBUFFER_GREEN_SIZE                       0x8D51
#define GL_RENDERBUFFER_BLUE_SIZE                        0x8D52
#define GL_RENDERBUFFER_ALPHA_SIZE                       0x8D53
#define GL_RENDERBUFFER_DEPTH_SIZE                       0x8D54
#define GL_RENDERBUFFER_STENCIL_SIZE                     0x8D55

#define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE            0x8CD0
#define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME            0x8CD1
#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL          0x8CD2
#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE  0x8CD3

#define GL_COLOR_ATTACHMENT0                             0x8CE0
#define GL_DEPTH_ATTACHMENT                              0x8D00
#define GL_STENCIL_ATTACHMENT                            0x8D20

#define GL_NONE                                          0

#define GL_FRAMEBUFFER_COMPLETE                          0x8CD5
#define GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT             0x8CD6
#define GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT     0x8CD7
#define GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS             0x8CD9
#define GL_FRAMEBUFFER_UNSUPPORTED                       0x8CDD

#define GL_FRAMEBUFFER_BINDING                           0x8CA6
#define GL_RENDERBUFFER_BINDING                          0x8CA7
#define GL_MAX_RENDERBUFFER_SIZE                         0x84E8

#define GL_INVALID_FRAMEBUFFER_OPERATION                 0x0506

/*-------------------------------------------------------------------------
 * Entrypoint definitions
 *-----------------------------------------------------------------------*/

GL_API void           GL_APIENTRY glActiveTexture (GLenum texture);
GL_API void           GL_APIENTRY glAttachShader (GLuint program, GLuint shader)  ;
GL_API void           GL_APIENTRY glBindAttribLocation (GLuint program, GLuint index, const GLchar* name)  ;
GL_API void           GL_APIENTRY glBindBuffer (GLenum target, GLuint buffer);
GL_API void           GL_APIENTRY glBindFramebuffer (GLenum target, GLuint framebuffer)  ;
GL_API void           GL_APIENTRY glBindRenderbuffer (GLenum target, GLuint renderbuffer)  ;
GL_API void           GL_APIENTRY glBindTexture (GLenum target, GLuint texture);
GL_API void           GL_APIENTRY glBlendColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)  ;
GL_API void           GL_APIENTRY glBlendEquation (GLenum mode)  ;
GL_API void           GL_APIENTRY glBlendEquationSeparate (GLenum modeRGB, GLenum modeAlpha)  ;
GL_API void           GL_APIENTRY glBlendFunc (GLenum sfactor, GLenum dfactor);
GL_API void           GL_APIENTRY glBlendFuncSeparate (GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)  ;
GL_API void           GL_APIENTRY glBufferData (GLenum target, GLsizeiptr size, const GLvoid* data, GLenum usage);
GL_API void           GL_APIENTRY glBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid* data);
GL_API GLenum         GL_APIENTRY glCheckFramebufferStatus (GLenum target)  ;
GL_API void           GL_APIENTRY glClear (GLbitfield mask);
GL_API void           GL_APIENTRY glClearColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
GL_API void           GL_APIENTRY glClearDepthf (GLclampf depth);
GL_API void           GL_APIENTRY glClearStencil (GLint s);
GL_API void           GL_APIENTRY glColorMask (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
GL_API void           GL_APIENTRY glCompileShader (GLuint shader)  ;
GL_API void           GL_APIENTRY glCompressedTexImage2D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid* data);
GL_API void           GL_APIENTRY glCompressedTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const GLvoid* data);
GL_API void           GL_APIENTRY glCopyTexImage2D (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
GL_API void           GL_APIENTRY glCopyTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
GL_API GLuint         GL_APIENTRY glCreateProgram (void)  ;
GL_API GLuint         GL_APIENTRY glCreateShader (GLenum type)  ;
GL_API void           GL_APIENTRY glCullFace (GLenum mode);
GL_API void           GL_APIENTRY glDeleteBuffers (GLsizei n, const GLuint* buffers);
GL_API void           GL_APIENTRY glDeleteFramebuffers (GLsizei n, const GLuint* framebuffers)  ;
GL_API void           GL_APIENTRY glDeleteProgram (GLuint program)  ;
GL_API void           GL_APIENTRY glDeleteRenderbuffers (GLsizei n, const GLuint* renderbuffers)  ;
GL_API void           GL_APIENTRY glDeleteShader (GLuint shader)  ;
GL_API void           GL_APIENTRY glDeleteTextures (GLsizei n, const GLuint* textures);
GL_API void           GL_APIENTRY glDepthFunc (GLenum func);
GL_API void           GL_APIENTRY glDepthMask (GLboolean flag);
GL_API void           GL_APIENTRY glDepthRangef (GLclampf zNear, GLclampf zFar);
GL_API void           GL_APIENTRY glDetachShader (GLuint program, GLuint shader)  ;
GL_API void           GL_APIENTRY glDisable (GLenum cap);
GL_API void           GL_APIENTRY glDisableVertexAttribArray (GLuint index)  ;
GL_API void           GL_APIENTRY glDrawArrays (GLenum mode, GLint first, GLsizei count);
GL_API void           GL_APIENTRY glDrawElements (GLenum mode, GLsizei count, GLenum type, const GLvoid* indices);
GL_API void           GL_APIENTRY glEnable (GLenum cap);
GL_API void           GL_APIENTRY glEnableVertexAttribArray (GLuint index)  ;
GL_API void           GL_APIENTRY glFinish (void);
GL_API void           GL_APIENTRY glFlush (void);
GL_API void           GL_APIENTRY glFramebufferRenderbuffer (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)  ;
GL_API void           GL_APIENTRY glFramebufferTexture2D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)  ;
GL_API void           GL_APIENTRY glFrontFace (GLenum mode);
GL_API void           GL_APIENTRY glGenBuffers (GLsizei n, GLuint* buffers);
GL_API void           GL_APIENTRY glGenerateMipmap (GLenum target)  ;
GL_API void           GL_APIENTRY glGenFramebuffers (GLsizei n, GLuint* framebuffers)  ;
GL_API void           GL_APIENTRY glGenRenderbuffers (GLsizei n, GLuint* renderbuffers)  ;
GL_API void           GL_APIENTRY glGenTextures (GLsizei n, GLuint* textures);
GL_API void           GL_APIENTRY glGetActiveAttrib (GLuint program, GLuint index, GLsizei bufsize, GLsizei* length, GLint* size, GLenum* type, GLchar* name)  ;
GL_API void           GL_APIENTRY glGetActiveUniform (GLuint program, GLuint index, GLsizei bufsize, GLsizei* length, GLint* size, GLenum* type, GLchar* name)  ;
GL_API void           GL_APIENTRY glGetAttachedShaders (GLuint program, GLsizei maxcount, GLsizei* count, GLuint* shaders)  ;
GL_API int            GL_APIENTRY glGetAttribLocation (GLuint program, const GLchar* name)  ;
GL_API void           GL_APIENTRY glGetBooleanv (GLenum pname, GLboolean* params);
GL_API void           GL_APIENTRY glGetBufferParameteriv (GLenum target, GLenum pname, GLint* params);
GL_API GLenum         GL_APIENTRY glGetError (void);
GL_API void           GL_APIENTRY glGetFloatv (GLenum pname, GLfloat* params);
GL_API void           GL_APIENTRY glGetFramebufferAttachmentParameteriv (GLenum target, GLenum attachment, GLenum pname, GLint* params)  ;
GL_API void           GL_APIENTRY glGetIntegerv (GLenum pname, GLint* params);
GL_API void           GL_APIENTRY glGetProgramiv (GLuint program, GLenum pname, GLint* params)  ;
GL_API void           GL_APIENTRY glGetProgramInfoLog (GLuint program, GLsizei bufsize, GLsizei* length, GLchar* infolog)  ;
GL_API void           GL_APIENTRY glGetRenderbufferParameteriv (GLenum target, GLenum pname, GLint* params)  ;
GL_API void           GL_APIENTRY glGetShaderiv (GLuint shader, GLenum pname, GLint* params)  ;
GL_API void           GL_APIENTRY glGetShaderInfoLog (GLuint shader, GLsizei bufsize, GLsizei* length, GLchar* infolog)  ;
GL_API void           GL_APIENTRY glGetShaderPrecisionFormat (GLenum shadertype, GLenum precisiontype, GLint* range, GLint* precision)  ;
GL_API void           GL_APIENTRY glGetShaderSource (GLuint shader, GLsizei bufsize, GLsizei* length, GLchar* source)  ;
GL_API const GLubyte* GL_APIENTRY glGetString (GLenum name);
GL_API void           GL_APIENTRY glGetTexParameterfv (GLenum target, GLenum pname, GLfloat* params);
GL_API void           GL_APIENTRY glGetTexParameteriv (GLenum target, GLenum pname, GLint* params);
GL_API void           GL_APIENTRY glGetUniformfv (GLuint program, GLint location, GLfloat* params)  ;
GL_API void           GL_APIENTRY glGetUniformiv (GLuint program, GLint location, GLint* params)  ;
GL_API int            GL_APIENTRY glGetUniformLocation (GLuint program, const GLchar* name)  ;
GL_API void           GL_APIENTRY glGetVertexAttribfv (GLuint index, GLenum pname, GLfloat* params)  ;
GL_API void           GL_APIENTRY glGetVertexAttribiv (GLuint index, GLenum pname, GLint* params)  ;
GL_API void           GL_APIENTRY glGetVertexAttribPointerv (GLuint index, GLenum pname, GLvoid** pointer)  ;
GL_API void           GL_APIENTRY glHint (GLenum target, GLenum mode);
GL_API GLboolean      GL_APIENTRY glIsBuffer (GLuint buffer);
GL_API GLboolean      GL_APIENTRY glIsEnabled (GLenum cap);
GL_API GLboolean      GL_APIENTRY glIsFramebuffer (GLuint framebuffer)  ;
GL_API GLboolean      GL_APIENTRY glIsProgram (GLuint program);
GL_API GLboolean      GL_APIENTRY glIsRenderbuffer (GLuint renderbuffer)  ;
GL_API GLboolean      GL_APIENTRY glIsShader (GLuint shader)  ;
GL_API GLboolean      GL_APIENTRY glIsTexture (GLuint texture);
GL_API void           GL_APIENTRY glLineWidth (GLfloat width);
GL_API void           GL_APIENTRY glLinkProgram (GLuint program)  ;
GL_API void           GL_APIENTRY glPixelStorei (GLenum pname, GLint param);
GL_API void           GL_APIENTRY glPolygonOffset (GLfloat factor, GLfloat units);
GL_API void           GL_APIENTRY glReadPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid* pixels);
GL_API void           GL_APIENTRY glReleaseShaderCompiler (void)  ;
GL_API void           GL_APIENTRY glRenderbufferStorage (GLenum target, GLenum internalformat, GLsizei width, GLsizei height)  ;
GL_API void           GL_APIENTRY glSampleCoverage (GLclampf value, GLboolean invert);
GL_API void           GL_APIENTRY glScissor (GLint x, GLint y, GLsizei width, GLsizei height);
GL_API void           GL_APIENTRY glShaderBinary (GLsizei n, const GLuint* shaders, GLenum binaryformat, const GLvoid* binary, GLsizei length)  ;
GL_API void           GL_APIENTRY glShaderSource (GLuint shader, GLsizei count, const GLchar* const *string, const GLint* length)  ;
GL_API void           GL_APIENTRY glStencilFunc (GLenum func, GLint ref, GLuint mask);
GL_API void           GL_APIENTRY glStencilFuncSeparate (GLenum face, GLenum func, GLint ref, GLuint mask)  ;
GL_API void           GL_APIENTRY glStencilMask (GLuint mask);
GL_API void           GL_APIENTRY glStencilMaskSeparate (GLenum face, GLuint mask)  ;
GL_API void           GL_APIENTRY glStencilOp (GLenum fail, GLenum zfail, GLenum zpass);
GL_API void           GL_APIENTRY glStencilOpSeparate (GLenum face, GLenum fail, GLenum zfail, GLenum zpass)  ;
GL_API void           GL_APIENTRY glTexImage2D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid* pixels);
GL_API void           GL_APIENTRY glTexParameterf (GLenum target, GLenum pname, GLfloat param);
GL_API void           GL_APIENTRY glTexParameterfv (GLenum target, GLenum pname, const GLfloat* params);
GL_API void           GL_APIENTRY glTexParameteri (GLenum target, GLenum pname, GLint param);
GL_API void           GL_APIENTRY glTexParameteriv (GLenum target, GLenum pname, const GLint* params);
GL_API void           GL_APIENTRY glTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid* pixels);
GL_API void           GL_APIENTRY glUniform1f (GLint location, GLfloat x)  ;
GL_API void           GL_APIENTRY glUniform1fv (GLint location, GLsizei count, const GLfloat* v)  ;
GL_API void           GL_APIENTRY glUniform1i (GLint location, GLint x)  ;
GL_API void           GL_APIENTRY glUniform1iv (GLint location, GLsizei count, const GLint* v)  ;
GL_API void           GL_APIENTRY glUniform2f (GLint location, GLfloat x, GLfloat y)  ;
GL_API void           GL_APIENTRY glUniform2fv (GLint location, GLsizei count, const GLfloat* v)  ;
GL_API void           GL_APIENTRY glUniform2i (GLint location, GLint x, GLint y)  ;
GL_API void           GL_APIENTRY glUniform2iv (GLint location, GLsizei count, const GLint* v)  ;
GL_API void           GL_APIENTRY glUniform3f (GLint location, GLfloat x, GLfloat y, GLfloat z)  ;
GL_API void           GL_APIENTRY glUniform3fv (GLint location, GLsizei count, const GLfloat* v)  ;
GL_API void           GL_APIENTRY glUniform3i (GLint location, GLint x, GLint y, GLint z)  ;
GL_API void           GL_APIENTRY glUniform3iv (GLint location, GLsizei count, const GLint* v)  ;
GL_API void           GL_APIENTRY glUniform4f (GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)  ;
GL_API void           GL_APIENTRY glUniform4fv (GLint location, GLsizei count, const GLfloat* v)  ;
GL_API void           GL_APIENTRY glUniform4i (GLint location, GLint x, GLint y, GLint z, GLint w)  ;
GL_API void           GL_APIENTRY glUniform4iv (GLint location, GLsizei count, const GLint* v)  ;
GL_API void           GL_APIENTRY glUniformMatrix2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value)  ;
GL_API void           GL_APIENTRY glUniformMatrix3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value)  ;
GL_API void           GL_APIENTRY glUniformMatrix4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value)  ;
GL_API void           GL_APIENTRY glUseProgram (GLuint program)  ;
GL_API void           GL_APIENTRY glValidateProgram (GLuint program)  ;
GL_API void           GL_APIENTRY glVertexAttrib1f (GLuint indx, GLfloat x)  ;
GL_API void           GL_APIENTRY glVertexAttrib1fv (GLuint indx, const GLfloat* values)  ;
GL_API void           GL_APIENTRY glVertexAttrib2f (GLuint indx, GLfloat x, GLfloat y)  ;
GL_API void           GL_APIENTRY glVertexAttrib2fv (GLuint indx, const GLfloat* values)  ;
GL_API void           GL_APIENTRY glVertexAttrib3f (GLuint indx, GLfloat x, GLfloat y, GLfloat z)  ;
GL_API void           GL_APIENTRY glVertexAttrib3fv (GLuint indx, const GLfloat* values)  ;
GL_API void           GL_APIENTRY glVertexAttrib4f (GLuint indx, GLfloat x, GLfloat y, GLfloat z, GLfloat w)  ;
GL_API void           GL_APIENTRY glVertexAttrib4fv (GLuint indx, const GLfloat* values)  ;
GL_API void           GL_APIENTRY glVertexAttribPointer (GLuint indx, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid* ptr)  ;
GL_API void           GL_APIENTRY glViewport (GLint x, GLint y, GLsizei width, GLsizei height);

















#ifndef GL_APIENTRYP
//#   define GL_APIENTRYP GL_APIENTRY*
#endif

#define GL_APPLE_copy_texture_levels                            1
#define GL_APPLE_framebuffer_multisample                        1
#define GL_APPLE_rgb_422                                        1
#define GL_APPLE_sync                                           1
#define GL_APPLE_texture_format_BGRA8888                        1
#define GL_APPLE_texture_max_level                              1
#define GL_EXT_blend_minmax                                     1
#define GL_EXT_color_buffer_half_float                          1
#define GL_EXT_debug_label                                      1
#define GL_EXT_debug_marker                                     1
#define GL_EXT_discard_framebuffer                              1
#define GL_EXT_draw_instanced                                   1
#define GL_EXT_instanced_arrays                                 1
#define GL_EXT_map_buffer_range                                 1
#define GL_EXT_occlusion_query_boolean                          1
#define GL_EXT_pvrtc_sRGB                                       1
#define GL_EXT_read_format_bgra                                 1
#define GL_EXT_separate_shader_objects                          1
#define GL_EXT_shader_framebuffer_fetch                         1
#define GL_EXT_shader_texture_lod                               1
#define GL_EXT_shadow_samplers                                  1
#define GL_EXT_sRGB                                             1
#define GL_EXT_texture_filter_anisotropic                       1
#define GL_EXT_texture_rg                                       1
#define GL_EXT_texture_storage                                  1
#define GL_IMG_read_format                                      1
#define GL_IMG_texture_compression_pvrtc                        1
#define GL_OES_depth_texture                                    1
#define GL_OES_depth24                                          1
#define GL_OES_element_index_uint                               1
#define GL_OES_fbo_render_mipmap                                1
#define GL_OES_mapbuffer                                        1
#define GL_OES_packed_depth_stencil                             1
#define GL_OES_rgb8_rgba8                                       1
#define GL_OES_standard_derivatives                             1
#define GL_OES_texture_float                                    1
#define GL_OES_texture_half_float                               1
#define GL_OES_texture_half_float_linear                        1
#define GL_OES_vertex_array_object                              1

/**************************************************************************/

#ifndef __gltypes_h_
#if GL_OES_texture_half_float
typedef unsigned short GLhalf;
#endif
#endif

#if GL_APPLE_sync
typedef int64_t GLint64;
typedef uint64_t GLuint64;
typedef struct __GLsync *GLsync;
#endif

/**************************************************************************/

/*------------------------------------------------------------------------*
 * APPLE extension tokens
 *------------------------------------------------------------------------*/
#if GL_APPLE_framebuffer_multisample
#define GL_RENDERBUFFER_SAMPLES_APPLE                           0x8CAB
#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_APPLE             0x8D56
#define GL_MAX_SAMPLES_APPLE                                    0x8D57
#define GL_READ_FRAMEBUFFER_APPLE                               0x8CA8
#define GL_DRAW_FRAMEBUFFER_APPLE                               0x8CA9
#define GL_DRAW_FRAMEBUFFER_BINDING_APPLE                       0x8CA6
#define GL_READ_FRAMEBUFFER_BINDING_APPLE                       0x8CAA
#endif

#if GL_APPLE_rgb_422
#define GL_RGB_422_APPLE                                        0x8A1F
#define GL_UNSIGNED_SHORT_8_8_APPLE                             0x85BA
#define GL_UNSIGNED_SHORT_8_8_REV_APPLE                         0x85BB
#endif

#if GL_APPLE_sync
#define GL_MAX_SERVER_WAIT_TIMEOUT_APPLE                        0x9111
#define GL_OBJECT_TYPE_APPLE                                    0x9112
#define GL_SYNC_CONDITION_APPLE                                 0x9113
#define GL_SYNC_STATUS_APPLE                                    0x9114
#define GL_SYNC_FLAGS_APPLE                                     0x9115
#define GL_SYNC_FENCE_APPLE                                     0x9116
#define GL_SYNC_GPU_COMMANDS_COMPLETE_APPLE                     0x9117
#define GL_UNSIGNALED_APPLE                                     0x9118
#define GL_SIGNALED_APPLE                                       0x9119
#define GL_ALREADY_SIGNALED_APPLE                               0x911A
#define GL_TIMEOUT_EXPIRED_APPLE                                0x911B
#define GL_CONDITION_SATISFIED_APPLE                            0x911C
#define GL_WAIT_FAILED_APPLE                                    0x911D
#define GL_SYNC_FLUSH_COMMANDS_BIT_APPLE                        0x00000001
#define GL_TIMEOUT_IGNORED_APPLE                                0xFFFFFFFFFFFFFFFFull
#define GL_SYNC_OBJECT_APPLE                                    0x8A53
#endif

#if GL_APPLE_texture_format_BGRA8888
#define GL_BGRA_EXT                                             0x80E1
#endif

#if GL_APPLE_texture_format_BGRA8888 || GL_IMG_read_format
#define GL_BGRA                                                 0x80E1
#endif

#if GL_APPLE_texture_max_level
#define GL_TEXTURE_MAX_LEVEL_APPLE                              0x813D
#endif

/*------------------------------------------------------------------------*
 * EXT extension tokens
 *------------------------------------------------------------------------*/
#if GL_EXT_blend_minmax
#define GL_MIN_EXT                                              0x8007
#define GL_MAX_EXT                                              0x8008
#endif

#if GL_EXT_color_buffer_half_float
#define GL_RGBA16F_EXT                                          0x881A
#define GL_RGB16F_EXT                                           0x881B
#define GL_RG16F_EXT                                            0x822F
#define GL_R16F_EXT                                             0x822D
#define GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT            0x8211
#define GL_UNSIGNED_NORMALIZED_EXT                              0x8C17
#endif

#if GL_EXT_debug_label
#define GL_BUFFER_OBJECT_EXT                                    0x9151
#define GL_SHADER_OBJECT_EXT                                    0x8B48
#define GL_PROGRAM_OBJECT_EXT                                   0x8B40
#define GL_QUERY_OBJECT_EXT                                     0x9153
#define GL_VERTEX_ARRAY_OBJECT_EXT                              0x9154
#define GL_PROGRAM_PIPELINE_OBJECT_EXT                          0x8A4F
/*      GL_SYNC_OBJECT_APPLE */
#endif

#if GL_EXT_discard_framebuffer
#define GL_COLOR_EXT                                            0x1800
#define GL_DEPTH_EXT                                            0x1801
#define GL_STENCIL_EXT                                          0x1802
#endif

#if GL_EXT_instanced_arrays
#define GL_VERTEX_ATTRIB_ARRAY_DIVISOR_EXT                      0x88FE
#endif

#if GL_EXT_map_buffer_range
#define GL_MAP_READ_BIT_EXT                                     0x0001
#define GL_MAP_WRITE_BIT_EXT                                    0x0002
#define GL_MAP_INVALIDATE_RANGE_BIT_EXT                         0x0004
#define GL_MAP_INVALIDATE_BUFFER_BIT_EXT                        0x0008
#define GL_MAP_FLUSH_EXPLICIT_BIT_EXT                           0x0010
#define GL_MAP_UNSYNCHRONIZED_BIT_EXT                           0x0020
#endif

#if GL_EXT_occlusion_query_boolean
#define GL_ANY_SAMPLES_PASSED_EXT                               0x8C2F
#define GL_ANY_SAMPLES_PASSED_CONSERVATIVE_EXT                  0x8D6A
#define GL_CURRENT_QUERY_EXT                                    0x8865
#define GL_QUERY_RESULT_EXT                                     0x8866
#define GL_QUERY_RESULT_AVAILABLE_EXT                           0x8867
#endif

#if GL_EXT_pvrtc_sRGB
#define GL_COMPRESSED_SRGB_PVRTC_2BPPV1_EXT                     0x8A54
#define GL_COMPRESSED_SRGB_PVRTC_4BPPV1_EXT                     0x8A55
#define GL_COMPRESSED_SRGB_ALPHA_PVRTC_2BPPV1_EXT               0x8A56
#define GL_COMPRESSED_SRGB_ALPHA_PVRTC_4BPPV1_EXT               0x8A57
#endif

#if GL_EXT_read_format_bgra
#define GL_UNSIGNED_SHORT_4_4_4_4_REV_EXT                       0x8365
#define GL_UNSIGNED_SHORT_1_5_5_5_REV_EXT                       0x8366
#define GL_UNSIGNED_SHORT_1_5_5_5_REV                           GL_UNSIGNED_SHORT_1_5_5_5_REV_EXT
#endif

#if GL_EXT_read_format_bgra || GL_IMG_read_format
#define GL_UNSIGNED_SHORT_4_4_4_4_REV                           0x8365
#endif

#if GL_EXT_separate_shader_objects
#define GL_VERTEX_SHADER_BIT_EXT                                0x00000001
#define GL_FRAGMENT_SHADER_BIT_EXT                              0x00000002
#define GL_ALL_SHADER_BITS_EXT                                  0xFFFFFFFF
#define GL_PROGRAM_SEPARABLE_EXT                                0x8258
#define GL_ACTIVE_PROGRAM_EXT                                   0x8259
#define GL_PROGRAM_PIPELINE_BINDING_EXT                         0x825A
#endif

#if GL_EXT_shader_framebuffer_fetch
#define GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT                 0x8A52
#endif

#if GL_EXT_shadow_samplers
#define GL_TEXTURE_COMPARE_MODE_EXT                             0x884C
#define GL_TEXTURE_COMPARE_FUNC_EXT                             0x884D
#define GL_COMPARE_REF_TO_TEXTURE_EXT                           0x884E
#define GL_SAMPLER_2D_SHADOW_EXT                                0x8B62
#endif

#if GL_EXT_sRGB
#define GL_SRGB_EXT                                             0x8C40
#define GL_SRGB_ALPHA_EXT                                       0x8C42
#define GL_SRGB8_ALPHA8_EXT                                     0x8C43
#define GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT            0x8210
#endif

#if GL_EXT_texture_filter_anisotropic
#define GL_TEXTURE_MAX_ANISOTROPY_EXT                           0x84FE
#define GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT                       0x84FF
#endif

#if GL_EXT_texture_rg
#define GL_RED_EXT                                              0x1903
#define GL_RG_EXT                                               0x8227
#define GL_R8_EXT                                               0x8229
#define GL_RG8_EXT                                              0x822B
#endif

#if GL_EXT_texture_storage
#define GL_TEXTURE_IMMUTABLE_FORMAT_EXT                         0x912F
#define GL_ALPHA8_EXT                                           0x803C
#define GL_LUMINANCE8_EXT                                       0x8040
#define GL_LUMINANCE8_ALPHA8_EXT                                0x8045
#define GL_BGRA8_EXT                                            0x93A1
#define GL_RGBA32F_EXT                                          0x8814
#define GL_RGB32F_EXT                                           0x8815
#define GL_RG32F_EXT                                            0x8230
#define GL_R32F_EXT                                             0x822E
#define GL_ALPHA32F_EXT                                         0x8816
#define GL_LUMINANCE32F_EXT                                     0x8818
#define GL_LUMINANCE_ALPHA32F_EXT                               0x8819
#define GL_ALPHA16F_EXT                                         0x881C
#define GL_LUMINANCE16F_EXT                                     0x881E
#define GL_LUMINANCE_ALPHA16F_EXT                               0x881F
#define GL_DEPTH_COMPONENT32_OES                                0x81A7
#define GL_RGB_RAW_422_APPLE                                    0x8A51
#endif

/*------------------------------------------------------------------------*
 * IMG extension tokens
 *------------------------------------------------------------------------*/
#if GL_IMG_read_format
#define GL_BGRA_IMG                                             0x80E1
#define GL_UNSIGNED_SHORT_4_4_4_4_REV_IMG                       0x8365
#endif

#if GL_IMG_texture_compression_pvrtc
#define GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG                      0x8C00
#define GL_COMPRESSED_RGB_PVRTC_2BPPV1_IMG                      0x8C01
#define GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG                     0x8C02
#define GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG                     0x8C03
#endif

/*------------------------------------------------------------------------*
 * OES extension tokens
 *------------------------------------------------------------------------*/
#if GL_OES_depth24
#define GL_DEPTH_COMPONENT24_OES                                0x81A6
#endif

#if GL_OES_mapbuffer
#define GL_WRITE_ONLY_OES                                       0x88B9
#define GL_BUFFER_ACCESS_OES                                    0x88BB
#define GL_BUFFER_MAPPED_OES                                    0x88BC
#define GL_BUFFER_MAP_POINTER_OES                               0x88BD
#endif

#if GL_OES_packed_depth_stencil
#define GL_DEPTH_STENCIL_OES                                    0x84F9
#define GL_UNSIGNED_INT_24_8_OES                                0x84FA
#define GL_DEPTH24_STENCIL8_OES                                 0x88F0
#endif

#if GL_OES_rgb8_rgba8
#define GL_RGB8_OES                                             0x8051
#define GL_RGBA8_OES                                            0x8058
#endif

#if GL_OES_standard_derivatives
#define GL_FRAGMENT_SHADER_DERIVATIVE_HINT_OES                  0x8B8B
#endif

#if GL_OES_texture_half_float
#define GL_HALF_FLOAT_OES                                       0x8D61
#endif

#if GL_OES_vertex_array_object
#define GL_VERTEX_ARRAY_BINDING_OES                             0x85B5
#endif

/**************************************************************************/

/*------------------------------------------------------------------------*
 * APPLE extension functions
 *------------------------------------------------------------------------*/
#if GL_APPLE_copy_texture_levels
GL_API GLvoid glCopyTextureLevelsAPPLE(GLuint destinationTexture, GLuint sourceTexture, GLint sourceBaseLevel, GLsizei sourceLevelCount) ;
#endif

#if GL_APPLE_framebuffer_multisample
GL_API GLvoid glRenderbufferStorageMultisampleAPPLE(GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height)  ;
GL_API GLvoid glResolveMultisampleFramebufferAPPLE(void)  ;
#endif

#if GL_APPLE_sync
GL_API GLsync glFenceSyncAPPLE(GLenum condition, GLbitfield flags) ;
GL_API GLboolean glIsSyncAPPLE(GLsync sync) ;
GL_API void glDeleteSyncAPPLE(GLsync sync) ;
GL_API GLenum glClientWaitSyncAPPLE(GLsync sync, GLbitfield flags, GLuint64 timeout) ;
GL_API void glWaitSyncAPPLE(GLsync sync, GLbitfield flags, GLuint64 timeout) ;
GL_API void glGetInteger64vAPPLE(GLenum pname, GLint64 *params) ;
GL_API void glGetSyncivAPPLE(GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values) ;
#endif

/*------------------------------------------------------------------------*
 * EXT extension functions
 *------------------------------------------------------------------------*/
#if GL_EXT_debug_label
GL_API GLvoid glLabelObjectEXT(GLenum type, GLuint object, GLsizei length, const GLchar *label)  ;
GL_API GLvoid glGetObjectLabelEXT(GLenum type, GLuint object, GLsizei bufSize, GLsizei *length, GLchar *label)  ;
#endif

#if GL_EXT_debug_marker
GL_API GLvoid glInsertEventMarkerEXT(GLsizei length, const GLchar *marker)  ;
GL_API GLvoid glPushGroupMarkerEXT(GLsizei length, const GLchar *marker)  ;
GL_API GLvoid glPopGroupMarkerEXT(void)  ;
#endif

#if GL_EXT_discard_framebuffer
GL_API GLvoid GL_APIENTRY glDiscardFramebufferEXT(GLenum target, GLsizei numAttachments, const GLenum *attachments)  ;
#endif

#if GL_EXT_draw_instanced
GL_API GLvoid glDrawArraysInstancedEXT(GLenum mode, GLint first, GLsizei count, GLsizei instanceCount)  ;
GL_API GLvoid glDrawElementsInstancedEXT(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices, GLsizei instanceCount)  ;
#endif

#if GL_EXT_instanced_arrays
GL_API GLvoid glVertexAttribDivisorEXT(GLuint index, GLuint divisor)  ;
#endif

#if GL_EXT_map_buffer_range
GL_API GLvoid *glMapBufferRangeEXT(GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access) ;
GL_API GLvoid glFlushMappedBufferRangeEXT(GLenum target, GLintptr offset, GLsizeiptr length) ;
#endif

#if GL_EXT_occlusion_query_boolean
GL_API GLvoid glGenQueriesEXT(GLsizei n, GLuint *ids)  ;
GL_API GLvoid glDeleteQueriesEXT(GLsizei n, const GLuint *ids)  ;
GL_API GLboolean glIsQueryEXT(GLuint id)  ;
GL_API GLvoid glBeginQueryEXT(GLenum target, GLuint id)  ;
GL_API GLvoid glEndQueryEXT(GLenum target)  ;
GL_API GLvoid glGetQueryivEXT(GLenum target, GLenum pname, GLint *params)  ;
GL_API GLvoid glGetQueryObjectuivEXT(GLuint id, GLenum pname, GLuint *params)  ;
#endif

#if GL_EXT_separate_shader_objects
GL_API GLvoid glUseProgramStagesEXT(GLuint pipeline, GLbitfield stages, GLuint program)  ;
GL_API GLvoid glActiveShaderProgramEXT(GLuint pipeline, GLuint program)  ;
GL_API GLuint glCreateShaderProgramvEXT(GLenum type, GLsizei count, const GLchar* const *strings)  ;
GL_API GLvoid glBindProgramPipelineEXT(GLuint pipeline)  ;
GL_API GLvoid glDeleteProgramPipelinesEXT(GLsizei n, const GLuint *pipelines)  ;
GL_API GLvoid glGenProgramPipelinesEXT(GLsizei n, GLuint *pipelines)  ;
GL_API GLboolean glIsProgramPipelineEXT(GLuint pipeline)  ;
GL_API GLvoid glProgramParameteriEXT(GLuint program, GLenum pname, GLint value)  ;
GL_API GLvoid glGetProgramPipelineivEXT(GLuint pipeline, GLenum pname, GLint *params)  ;
GL_API GLvoid glValidateProgramPipelineEXT(GLuint pipeline)  ;
GL_API GLvoid glGetProgramPipelineInfoLogEXT(GLuint pipeline, GLsizei bufSize, GLsizei *length, GLchar *infoLog)  ;

GL_API GLvoid glProgramUniform1iEXT(GLuint program, GLint location, GLint x)  ;
GL_API GLvoid glProgramUniform2iEXT(GLuint program, GLint location, GLint x, GLint y)  ;
GL_API GLvoid glProgramUniform3iEXT(GLuint program, GLint location, GLint x, GLint y, GLint z)  ;
GL_API GLvoid glProgramUniform4iEXT(GLuint program, GLint location, GLint x, GLint y, GLint z, GLint w)  ;

GL_API GLvoid glProgramUniform1fEXT(GLuint program, GLint location, GLfloat x)  ;
GL_API GLvoid glProgramUniform2fEXT(GLuint program, GLint location, GLfloat x, GLfloat y)  ;
GL_API GLvoid glProgramUniform3fEXT(GLuint program, GLint location, GLfloat x, GLfloat y, GLfloat z)  ;
GL_API GLvoid glProgramUniform4fEXT(GLuint program, GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)  ;

GL_API GLvoid glProgramUniform1ivEXT(GLuint program, GLint location, GLsizei count, const GLint *value)  ;
GL_API GLvoid glProgramUniform2ivEXT(GLuint program, GLint location, GLsizei count, const GLint *value)  ;
GL_API GLvoid glProgramUniform3ivEXT(GLuint program, GLint location, GLsizei count, const GLint *value)  ;
GL_API GLvoid glProgramUniform4ivEXT(GLuint program, GLint location, GLsizei count, const GLint *value)  ;

GL_API GLvoid glProgramUniform1fvEXT(GLuint program, GLint location, GLsizei count, const GLfloat *value)  ;
GL_API GLvoid glProgramUniform2fvEXT(GLuint program, GLint location, GLsizei count, const GLfloat *value)  ;
GL_API GLvoid glProgramUniform3fvEXT(GLuint program, GLint location, GLsizei count, const GLfloat *value)  ;
GL_API GLvoid glProgramUniform4fvEXT(GLuint program, GLint location, GLsizei count, const GLfloat *value)  ;

GL_API GLvoid glProgramUniformMatrix2fvEXT(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value)  ;
GL_API GLvoid glProgramUniformMatrix3fvEXT(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value)  ;
GL_API GLvoid glProgramUniformMatrix4fvEXT(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value)  ;
#endif

#if GL_EXT_texture_storage
GL_API GLvoid glTexStorage2DEXT(GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height) ;
#endif

/*------------------------------------------------------------------------*
 * OES extension functions
 *------------------------------------------------------------------------*/
#if GL_OES_mapbuffer
GL_API GLvoid GL_APIENTRY glGetBufferPointervOES (GLenum target, GLenum pname, GLvoid **params);
GL_API GLvoid * GL_APIENTRY glMapBufferOES (GLenum target, GLenum access);
GL_API GLboolean GL_APIENTRY glUnmapBufferOES (GLenum target);
#endif

#if GL_OES_vertex_array_object
GL_API GLvoid glBindVertexArrayOES(GLuint array)  ;
GL_API GLvoid glDeleteVertexArraysOES(GLsizei n, const GLuint *arrays)  ;
GL_API GLvoid glGenVertexArraysOES(GLsizei n, GLuint *arrays)  ;
GL_API GLboolean glIsVertexArrayOES(GLuint array)  ;
#endif








