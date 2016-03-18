/*******************************************************************************************************************************************

 @File         OGLES2HelloAPI_iOS.cpp

 @Title        OpenGL ES 2.0 HelloAPI Tutorial

 @Version

 @Copyright    Copyright (c) Imagination Technologies Limited.

 @Platform

 @Description  Basic Tutorial that shows step-by-step how to initialize OpenGL ES 2.0, use it for drawing a triangle and terminate it.
               Entry Point: main

 *******************************************************************************************************************************************/
/*******************************************************************************************************************************************
 Include Files
 *******************************************************************************************************************************************/
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/EAGLDrawable.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

/*******************************************************************************************************************************************
 Defines
 *******************************************************************************************************************************************/
// Index to bind the attributes to vertex shaders
#define VERTEX_ARRAY	0
#define KFPS			120.0

/*!*****************************************************************************************************************************************
 @Function		TestGLError
 @Input			functionLastCalled          Function which triggered the error
 @Return		True if no GL error was detected
 @Description	Tests for an GL error and prints it in a message box.
 *******************************************************************************************************************************************/
bool TestGLError(const char* functionLastCalled)
{
	/*	glGetError returns the last error that occurred using OpenGL ES, not necessarily the status of the last called function. The user
	 has to check after every single OpenGL ES call or at least once every frame. Usually this would be for debugging only, but for this
	 example it is enabled always
	 */
	GLenum lastError = glGetError();
	if (lastError != GL_NO_ERROR)
	{
		NSLog(@"%s failed (%d).\n", functionLastCalled, lastError);
		return false;
	}

	return true;
}

/*!*****************************************************************************************************************************************
 Class EAGLView
********************************************************************************************************************************************/
@class EAGLView;
@interface EAGLView : UIView
{
@private
	EAGLContext*        m_context;
	GLuint				m_framebuffer;
	GLuint				m_renderbuffer;
	GLuint				m_depthBuffer;
	
	GLuint				m_vertexShader, m_fragmentShader;
	GLuint				m_shaderProgram;
	GLuint				m_vertexBuffer;
	
	NSTimer*			m_timer;			// timer for rendering our OpenGL content
	id					m_displayLink;		// Prefer using displaylink, if it's available.
	
	BOOL				m_animating;
    BOOL				m_displayLinkSupported;
}

+ (Class) layerClass;
- (void) renderScene;
- (void) dealloc;
- (id)   initWithFrame:(CGRect)frame scale:(CGFloat)scale;
- (BOOL) initialiseBuffer:(GLuint*)vertexBuffer;
- (BOOL) initialiseFragmentShader:(GLuint*)fragmentShader vertexShader:(GLuint*)vertexShader programObject:(GLuint*)shaderProgram;
- (BOOL) createEAGLContext:(CAEAGLLayer*)eaglLayer frame:(CGRect)frame scale:(CGFloat)scale;
- (BOOL) createRenderbuffer:(CAEAGLLayer*)eaglLayer;
- (void) deInitialiseGLState;

@end

@implementation EAGLView

+ (Class) layerClass
{
	return [CAEAGLLayer class];
}

/*!*****************************************************************************************************************************************
 @Function		initialiseBuffer
 @Output		vertexBuffer                Handle to a vertex buffer object
 @Return		Whether the function succeeds or not.
 @Description	Initialises shaders, buffers and other state required to begin rendering with OpenGL ES
 *******************************************************************************************************************************************/
- (BOOL) initialiseBuffer:(GLuint*)vertexBuffer
{
	if(!vertexBuffer)
		return FALSE;

	/*	Concept: Vertices
	 When rendering a polygon or model to screen, OpenGL ES has to be told where to draw the object, and more fundamentally what shape
	 it is. The data used to do this is referred to as vertices, points in 3D space which are usually collected into groups of three
	 to render as triangles. Fundamentally, any advanced 3D shape in OpenGL ES is constructed from a series of these vertices - each
	 vertex representing one corner of a polygon.
	 */

	/*	Concept: Buffer Objects
	 To operate on any data, OpenGL first needs to be able to access it. The GPU maintains a separate pool of memory it uses independent
	 of the CPU. Whilst on many embedded systems these are in the same physical memory, the distinction exists so that they can use and
	 allocate memory without having to worry about synchronising with any other processors in the device.
	 To this end, data needs to be uploaded into buffers, which are essentially a reserved bit of memory for the GPU to use. By creating
	 a buffer and giving it some data we can tell the GPU how to render a triangle.
	 */

	// Vertex data containing the positions of each point of the triangle
	GLfloat vertexData[] = {-0.4f,-0.4f, 0.0f,  // Bottom Left
		0.4f,-0.4f, 0.0f,  // Bottom Right
		0.0f, 0.4f, 0.0f}; // Top Middle

	// Generate a buffer object
	glGenBuffers(1, vertexBuffer);

	// Bind buffer as an vertex buffer so we can fill it with data
	glBindBuffer(GL_ARRAY_BUFFER, *vertexBuffer);

	/*	Set the buffer's size, data and usage
	 Note the last argument - GL_STATIC_DRAW. This tells the driver that we intend to read from the buffer on the GPU, and don't intend
	 to modify the data until we're done with it.
	 */
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertexData), vertexData, GL_STATIC_DRAW);

	if (!TestGLError("glBufferData"))
	{
		return FALSE;
	}

	return TRUE;
}

/*!*****************************************************************************************************************************************
 @Function		initialiseFragmentShader
 @Output		fragmentShader              Handle to a fragment shader
 @Output		vertexShader                Handle to a vertex shader
 @Output		shaderProgram               Handle to a shader program containing the fragment and vertex shader
 @Return		Whether the function succeeds or not.
 @Description	Initialises shaders, buffers and other state required to begin rendering with OpenGL ES
 *******************************************************************************************************************************************/
- (BOOL) initialiseFragmentShader:(GLuint*)fragmentShader vertexShader:(GLuint*)vertexShader programObject:(GLuint*)shaderProgram
{
	if(!fragmentShader || !vertexShader || !shaderProgram)
		return FALSE;

	/*	Concept: Shaders
	 OpenGL ES 2.0 uses what are known as shaders to determine how to draw objects on the screen. Instead of the fixed function
	 pipeline in early OpenGL or OpenGL ES 1.x, users can now programmatically define how vertices are transformed on screen, what
	 data is used where, and how each pixel on the screen is coloured.
	 These shaders are written in GL Shading Language ES: http://www.khronos.org/registry/gles/specs/2.0/GLSL_ES_Specification_1.0.17.pdf
	 which is usually abbreviated to simply "GLSL ES".
	 Each shader is compiled on-device and then linked into a shader program, which combines a vertex and fragment shader into a form
	 that the OpenGL ES implementation can execute.
	 */

	/*	Concept: Fragment Shaders
	 In a final buffer of image data, each individual point is referred to as a pixel. Fragment shaders are the part of the pipeline
	 which determine how these final pixels are coloured when drawn to the framebuffer. When data is passed through here, the positions
	 of these pixels is already set, all that's left to do is set the final colour based on any defined inputs.
	 The reason these are called "fragment" shaders instead of "pixel" shaders is due to a small technical difference between the two
	 concepts. When you colour a fragment, it may not be the final colour which ends up on screen. This is particularly true when
	 performing blending, where multiple fragments can contribute to the final pixel colour.
	 */
	const char* const fragmentShaderSource = "\
	void main (void)\
	{\
	gl_FragColor = vec4(1.0, 1.0, 0.66 ,1.0);\
	}";

	// Create a fragment shader object
	GLuint fragShader = glCreateShader(GL_FRAGMENT_SHADER);

	// Load the source code into it
	glShaderSource(fragShader, 1, (const char**)&fragmentShaderSource, NULL);

	// Compile the source code
	glCompileShader(fragShader);

	// Check that the shader compiled
	GLint isShaderCompiled;
	glGetShaderiv(fragShader, GL_COMPILE_STATUS, &isShaderCompiled);
	if (!isShaderCompiled)
	{
		// If an error happened, first retrieve the length of the log message
		int infoLogLength, charactersWritten;
		glGetShaderiv(fragShader, GL_INFO_LOG_LENGTH, &infoLogLength);

		// Allocate enough space for the message and retrieve it
		char* infoLog = new char[infoLogLength];
		glGetShaderInfoLog(fragShader, infoLogLength, &charactersWritten, infoLog);

		// Display the error in a dialog box
		if (infoLogLength>1)
		{
			NSLog(@"%s\n", infoLog);
		}
		else
		{
			NSLog(@"Failed to compile fragment shader.\n");
		}

		delete[] infoLog;
		return FALSE;
	}

	*fragmentShader = fragShader;

	/*	Concept: Vertex Shaders
	 Vertex shaders primarily exist to allow a developer to express how to orient vertices in 3D space, through transformations like
	 Scaling, Translation or Rotation. Using the same basic layout and structure as a fragment shader, these take in vertex data and
	 output a fully transformed set of positions. Other inputs are also able to be used such as normals or texture coordinates, and can
	 also be transformed and output alongside the position data.
	 */
	// Vertex shader code
	const char* const vertexShaderSource = "\
	attribute highp vec4	myVertex;\
	uniform mediump mat4	transformationMatrix;\
	void main(void)\
	{\
	gl_Position = transformationMatrix * myVertex;\
	}";

	// Create a vertex shader object
	GLuint vertShader = glCreateShader(GL_VERTEX_SHADER);

	// Load the source code into the shader
	glShaderSource(vertShader, 1, (const char**)&vertexShaderSource, NULL);

	// Compile the shader
	glCompileShader(vertShader);

	// Check the shader has compiled
	glGetShaderiv(vertShader, GL_COMPILE_STATUS, &isShaderCompiled);
	if (!isShaderCompiled)
	{
		// If an error happened, first retrieve the length of the log message
		int infoLogLength, charactersWritten;
		glGetShaderiv(vertShader, GL_INFO_LOG_LENGTH, &infoLogLength);

		// Allocate enough space for the message and retrieve it
		char* infoLog = new char[infoLogLength];
		glGetShaderInfoLog(vertShader, infoLogLength, &charactersWritten, infoLog);

		// Display the error in a dialog box
		if (infoLogLength>1)
		{
			NSLog(@"%s\n", infoLog);
		}
		else
		{
			NSLog(@"Failed to compile vertex shader.\n");
		}

		delete[] infoLog;
		return FALSE;
	}

	*vertexShader = vertShader;

	// Create the shader program
	GLuint program = glCreateProgram();

	// Attach the fragment and vertex shaders to it
	glAttachShader(program, fragShader);
	glAttachShader(program, vertShader);

	// Bind the vertex attribute "myVertex" to location VERTEX_ARRAY (0)
	glBindAttribLocation(program, VERTEX_ARRAY, "myVertex");

	// Link the program
	glLinkProgram(program);

	// Check if linking succeeded in the same way we checked for compilation success
	GLint isLinked;
	glGetProgramiv(program, GL_LINK_STATUS, &isLinked);
	if (!isLinked)
	{
		// If an error happened, first retrieve the length of the log message
		int infoLogLength, charactersWritten;
		glGetProgramiv(program, GL_INFO_LOG_LENGTH, &infoLogLength);

		// Allocate enough space for the message and retrieve it
		char* infoLog = new char[infoLogLength];
		glGetProgramInfoLog(program, infoLogLength, &charactersWritten, infoLog);

		// Display the error in a dialog box
		if (infoLogLength>1)
		{
			NSLog(@"%s\n", infoLog);
		}
		else
		{
			NSLog(@"Failed to link shader program.\n");
		}

		delete[] infoLog;
		return FALSE;
	}

	/*	Use the Program
	 Calling glUseProgram tells OpenGL ES that the application intends to use this program for rendering. Now that it's installed into
	 the current state, any further glDraw* calls will use the shaders contained within it to process scene data. Only one program can
	 be active at once, so in a multi-program application this function would be called in the render loop. Since this application only
	 uses one program it can be installed in the current state and left there.
	 */
	glUseProgram(program);

	if (!TestGLError("glUseProgram"))
	{
		return FALSE;
	}

	*shaderProgram = program;

	return TRUE;
}

/*!*****************************************************************************************************************************************
 @Function		createEAGLContext
 @Return        Whether the function succeeds or not.
 @Description	Initialises EAGL and sets of the context for rendering.
 *******************************************************************************************************************************************/
- (BOOL) createEAGLContext:(CAEAGLLayer*)eaglLayer frame:(CGRect)frame scale:(CGFloat)scale
{
	/*	Create a context.
	 EAGL has to create what is known as a context for OpenGL ES. The concept of a context is OpenGL ES's way of encapsulating any
	 resources and state. What appear to be "global" functions in OpenGL actually only operate on the current context. A context
	 is required for any operations in OpenGL ES.
	 */

	/*
	 Initialise EAGL.
	 */
	[eaglLayer setDrawableProperties: [	NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithBool:NO],
									   kEAGLDrawablePropertyRetainedBacking,
									   kEAGLColorFormatRGBA8,
									   kEAGLDrawablePropertyColorFormat,
									   nil]];

	/*
	 Create a context for rendering with OpenGL ES2.
	 */
	m_context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];

	if((!m_context) || (![EAGLContext setCurrentContext:m_context]))
	{
		return FALSE;
	}

	// Scale the display appropriately.
	if([self respondsToSelector:@selector(contentScaleFactor)])
	{
		self.contentScaleFactor = scale;
	}
	else
	{
		self.bounds    = CGRectMake(0.0, 0.0, frame.size.width * scale, frame.size.height * scale);
		self.transform = CGAffineTransformScale(self.transform, 1 / scale, 1 / scale);
	}

	return TRUE;
}

/*!*****************************************************************************************************************************************
 @Function		createRenderbuffer
 @Return        Whether the function succeeds or not.
 @Description	Creates a render buffer suitable for rendering to.
 *******************************************************************************************************************************************/
- (BOOL) createRenderbuffer:(CAEAGLLayer*)eaglLayer
{
	/* Create a renderbuffer.
	 iOS requires a renderbuffer to be created and attached with a framebuffer. Applications on iOS do not render to the 'default'
	 framebuffer (i.e framebuffer 0). Instead, clients are required to create their own framebuffer and render to this instead. The OS
	 can then composite the user's framebuffer with it's own buffers to create the UI.
	 */

	/*
	 Create a render buffer.
	 */
	GLuint oldRenderbuffer;
	glGetIntegerv(GL_RENDERBUFFER_BINDING, (GLint *) &oldRenderbuffer);
	glGenRenderbuffers(1, &m_renderbuffer);
	glBindRenderbuffer(GL_RENDERBUFFER, m_renderbuffer);

	if(![m_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:eaglLayer])
	{
		glDeleteRenderbuffers(1, &m_renderbuffer);
		glBindRenderbuffer(GL_RENDERBUFFER_BINDING, oldRenderbuffer);
		return FALSE;
	}

	GLint width, height;
	glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH,  &width);
	glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &height);

	/*
	 Create a frame buffer.
	 */
	glGenFramebuffers(1, &m_framebuffer);
	glBindFramebuffer(GL_FRAMEBUFFER, m_framebuffer);
	glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, m_renderbuffer);

	/*
	 Create a depth buffer.
	 */
	glGenRenderbuffers(1, &m_depthBuffer);
	glBindRenderbuffer(GL_RENDERBUFFER, m_depthBuffer);
	glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, width, height);
	glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, m_depthBuffer);

	/*
	 Attach the render buffer to the framebuffer.
	 */
	if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
	{
		return FALSE;
	}

	/*
	 Set the viewport size to the window size.
	 */
	glViewport(0, 0, width, height);

	return TRUE;
}

/*!*****************************************************************************************************************************************
 @Function		initWithFrame
 @Input			frame
 @Return        self or nil
 @Description	Initialises EAGL and sets of the context for rendering. Also call functions to setup GL resources.
 *******************************************************************************************************************************************/
- (id) initWithFrame:(CGRect)frame scale:(CGFloat)scale
{
	if(!(self = [super initWithFrame:frame]))
		return self;

	CAEAGLLayer* eaglLayer = (CAEAGLLayer*)[self layer];
	if(![self createEAGLContext:eaglLayer frame:frame scale:scale])
	{
		[self release];
		return nil;
	}
	
	if(![self createRenderbuffer:eaglLayer])
	{
		[self release];
		return nil;
	}

	if(![self initialiseFragmentShader:&m_fragmentShader vertexShader:&m_vertexBuffer programObject:&m_shaderProgram])
	{
		[self release];
		return nil;
	}

	if(![self initialiseBuffer:&m_vertexBuffer])
	{
		[self release];
		return nil;
	}
	
	return self;
}

/*!*****************************************************************************************************************************************
 @Function		renderScene
 @Description	Renders the scene to the framebuffer. Usually called within a loop.
 *******************************************************************************************************************************************/
- (void) renderScene
{
	/* Bind the user renderbuffer
	 As previously mentioned, iOS requires users to render to their own renderbuffer, which is later composited by the OS.
	 First though, we take the previously bound render buffer, so we can reset it after rendering.
	 */
	GLuint oldRenderBuffer;
	glGetIntegerv(GL_RENDERBUFFER_BINDING, (GLint*)&oldRenderBuffer);
	glBindRenderbuffer(GL_RENDERBUFFER, m_renderbuffer);

	/*	Set the clear color
	 At the start of a frame, generally you clear the image to tell OpenGL ES that you're done with whatever was there before and want to
	 draw a new frame. In order to do that however, OpenGL ES needs to know what colour to set in the image's place. glClearColor
	 sets this value as 4 floating point values between 0.0 and 1.0, as the Red, Green, Blue and Alpha channels. Each value represents
	 the intensity of the particular channel, with all 0.0 being transparent black, and all 1.0 being opaque white. Subsequent calls to
	 glClear with the colour bit will clear the frame buffer to this value.
	 The functions glClearDepth and glClearStencil allow an application to do the same with depth and stencil values respectively.
	 */
	glClearColor(0.6f, 0.8f, 1.0f, 1.0f);

	/*	Clears the color buffer.
	 glClear is used here with the Colour Buffer to clear the colour. It can also be used to clear the depth or stencil buffer using
	 GL_DEPTH_BUFFER_BIT or GL_STENCIL_BUFFER_BIT, respectively.
	 */
	glClear(GL_COLOR_BUFFER_BIT);

	// Get the location of the transformation matrix in the shader using its name
	int matrixLocation = glGetUniformLocation(m_shaderProgram, "transformationMatrix");

	// Matrix used to specify the orientation of the triangle on screen.
	const float transformationMatrix[] =
	{
		1.0f,0.0f,0.0f,0.0f,
		0.0f,1.0f,0.0f,0.0f,
		0.0f,0.0f,1.0f,0.0f,
		0.0f,0.0f,0.0f,1.0f
	};

	// Pass the transformationMatrix to the shader using its location
	glUniformMatrix4fv( matrixLocation, 1, GL_FALSE, transformationMatrix);
	TestGLError("glUniformMatrix4fv");

	// Enable the user-defined vertex array
	glEnableVertexAttribArray(VERTEX_ARRAY);

	// Sets the vertex data to this attribute index, with the number of floats in each position
	glVertexAttribPointer(VERTEX_ARRAY, 3, GL_FLOAT, GL_FALSE, 0, 0);
	TestGLError("glVertexAttribPointer");

	/*	Draw the triangle
	 glDrawArrays is a draw call, and executes the shader program using the vertices and other state set by the user. Draw calls are the
	 functions which tell OpenGL ES when to actually draw something to the framebuffer given the current state.
	 glDrawArrays causes the vertices to be submitted sequentially from the position given by the "first" argument until it has processed
	 "count" vertices. Other draw calls exist, notably glDrawElements which also accepts index data to allow the user to specify that
	 some vertices are accessed multiple times, without copying the vertex multiple times.
	 Others include versions of the above that allow the user to draw the same object multiple times with slightly different data, and
	 a version of glDrawElements which allows a user to restrict the actual indices accessed.
	 */
	glDrawArrays(GL_TRIANGLES, 0, 3);
	TestGLError("glDrawArrays");

	/*	Present the display data to the screen.
	 When rendering to a Window surface, OpenGL ES is double buffered. This means that OpenGL ES renders directly to one frame buffer,
	 known as the back buffer, whilst the display reads from another - the front buffer. eglSwapBuffers signals to the windowing system
	 that OpenGL ES 2.0 has finished rendering a scene, and that the display should now draw to the screen from the new data. At the same
	 time, the front buffer is made available for OpenGL ES 2.0 to start rendering to. In effect, this call swaps the front and back
	 buffers.
	 */

	if(![m_context presentRenderbuffer:GL_RENDERBUFFER])
	{
		NSLog(@"Failed to swap renderbuffer.\n");
	}

	// Reset the older renderbuffer
	glBindRenderbuffer(GL_RENDERBUFFER, oldRenderBuffer);
}

/*!*****************************************************************************************************************************************
 @Function		deInitialiseGLState
 @Description	Releases GL resources previously allocated
 *******************************************************************************************************************************************/
- (void) deInitialiseGLState
{
	// Delete the VBO as it is no longer needed
	glDeleteBuffers(1, &m_vertexBuffer);

	// Frees the OpenGL handles for the program and the 2 shaders
	glDeleteProgram(m_shaderProgram);
	glDeleteShader(m_vertexShader);
	glDeleteShader(m_fragmentShader);

	/*
	 Release renderbuffers
	 */
	EAGLContext *oldContext = [EAGLContext currentContext];

	if (oldContext != m_context)
		[EAGLContext setCurrentContext:m_context];

	glDeleteRenderbuffers(1, &m_depthBuffer);
	m_depthBuffer = 0;

	glDeleteRenderbuffers(1, &m_renderbuffer);
	m_renderbuffer = 0;

	glDeleteFramebuffers(1, &m_framebuffer);

	m_framebuffer = 0;
	if (oldContext != m_context)
		[EAGLContext setCurrentContext:oldContext];

	/*
	 EAGLContext deinitialisation.
	 */
	[m_context release];
	m_context = nil;
}

/*!*****************************************************************************************************************************************
 @Function		dealloc
 @Description	Class destructor. Calls function to destroy the GL state.
 *******************************************************************************************************************************************/
- (void) dealloc
{
	[self deInitialiseGLState];
	[super dealloc];
}

/*!*****************************************************************************************************************************************
 @Function		startAnimation
 @Description	Starts rendering.
 *******************************************************************************************************************************************/
- (void)startAnimation
{
    if(!m_animating)
    {
        if(m_displayLinkSupported)
        {
            // CADisplayLink is an API new to iOS SDK 3.1. We prefer to use it for animation rather than a timer, but fallback to the timer
			// if it's not available.
            m_displayLink = [NSClassFromString(@"CADisplayLink") displayLinkWithTarget:self selector:@selector(renderScene)];
            [m_displayLink setFrameInterval:1];		// Fire at 60fps on a 60Hz display
            [m_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        }
        else
		{
			m_timer = [NSTimer scheduledTimerWithTimeInterval:(1.0 / KFPS) target:self selector:@selector(renderScene) userInfo:nil repeats:YES];
		}
        
        m_animating = TRUE;
    }
}

/*!*****************************************************************************************************************************************
 @Function		stopAnimation
 @Description	Stops rendering.
 *******************************************************************************************************************************************/
- (void)stopAnimation
{
    if(m_animating)
    {
        if(m_displayLinkSupported)
        {
            [m_displayLink invalidate];
            m_displayLink = nil;
        }
        else
        {
            [m_timer invalidate];
            m_timer = nil;
        }
        
        m_animating = FALSE;
    }
}

@end

/*!*****************************************************************************************************************************************
 Class AppController
 *******************************************************************************************************************************************/
@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow*			window; 	// Our window
	EAGLView*			view;		// View
}
@end

@implementation AppController

- (void) applicationDidFinishLaunching:(UIApplication *)application
{
	/*
	 Create a fullscreen window that we can use for OpenGL ES output.
	 */
	CGRect frameSize;
	UIScreen* screen = [UIScreen mainScreen];
	CGFloat    scale = 1.0;
	if ([UIScreen instancesRespondToSelector:@selector(scale)])
	{
		scale = [screen scale];
	}
	CGRect appFrame = [screen bounds];
	frameSize       = CGRectMake(appFrame.origin.x, appFrame.origin.y,
								 appFrame.size.width, appFrame.size.height);

	window = [[UIWindow alloc] initWithFrame:frameSize];
	view   = [[EAGLView alloc] initWithFrame:frameSize scale:scale];
	if(view)
	{
		/*
		 Add this view to the window and show
		 */
		[window addSubview: view];
		[window makeKeyAndVisible];
		
		// Setup a timer to redraw the view at a regular interval
		[view startAnimation];
	}
}

- (void) applicationWillResignActive:(UIApplication *)application
{
	[view stopAnimation];
}

- (void) applicationDidBecomeActive:(UIApplication *)application
{
    [view startAnimation];
}

- (void) applicationWillTerminate:(UIApplication *)application
{
	[view stopAnimation];
}

- (void) dealloc
{
    [window release];
    [view release];
    
    [super dealloc];
}

@end

/*!*****************************************************************************************************************************************
 @Function		main
 @Description	Runs the application.
 *******************************************************************************************************************************************/
int main(int argc, char **argv)
{
	NSAutoreleasePool* pool = [NSAutoreleasePool new];
	UIApplicationMain(argc, argv, nil, @"AppController");
	[pool release];
	return 0;
}
