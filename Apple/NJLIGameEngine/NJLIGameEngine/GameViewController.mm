//
//  GameViewController.m
//  NJLIGameEngine
//
//  Created by James Folk on 3/17/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
{
}
@property (strong, nonatomic) EAGLContext *context;
@property (strong, nonatomic) TZKeyboardPop *customKeyboard;

- (void)setupGL;
- (void)tearDownGL;
@end

@implementation GameViewController



+ (void) printKeyValueString:(NSString *)key value:(NSString*)value
{
    DEBUG_LOG_V("GameViewController.mm", "%s => %s", [key UTF8String], [value UTF8String]);
}

- (void) printKeyValueArray:(NSString *)key value:(NSArray*)array
{
    for (id obj in array)
    {
        if ([obj isKindOfClass:[NSString class]])
        {
            [GameViewController printKeyValueString:key value:obj];
        }
        //        else if ([obj isKindOfClass:[NSArray class]])
        //        {
        //            [GameViewController printKeyValueArray:key value:obj];
        //        }
        //        else if ([obj isKindOfClass:[NSDictionary class]])
        //        {
        //            [GameViewController printKeyValueDictionary:key value:obj];
        //        }
    }
}

+ (void) printKeyValueDictionary:(NSString *)key value:(NSDictionary*)dict
{
    for(NSString *key in [dict allKeys])
    {
        id obj = [dict objectForKey:key];
        
        if ([obj isKindOfClass:[NSString class]])
        {
            [GameViewController printKeyValueString:key value:obj];
        }
        //        else if ([obj isKindOfClass:[NSArray class]])
        //        {
        //            [GameViewController printKeyValueArray:key value:obj];
        //        }
        //        else if ([obj isKindOfClass:[NSDictionary class]])
        //        {
        //            [GameViewController printKeyValueDictionary:key value:obj];
        //        }
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    //    for(NSString *key in [dict allKeys])
    //    {
    //        id obj = [dict objectForKey:key];
    //        [GameViewController printKeyValueDictionary:key value:obj];
    //    }
    
    //#if defined(DEBUG) || defined (_DEBUG)
    //    [self emptyDocumentFiles];
    //
    //#endif
    
        setupFileSystem();
    
    [[AVAudioSession sharedInstance] setDelegate:self];
    
    _customKeyboard = [[TZKeyboardPop alloc] initWithView:self.view];
    _customKeyboard.delegate = self;
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    //    [self.context setMultiThreaded:YES];
    
    self.preferredFramesPerSecond = 60;
    
    
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    view.drawableStencilFormat = GLKViewDrawableStencilFormat8;
    view.drawableMultisample = GLKViewDrawableMultisample4X;
    view.contentScaleFactor = [UIScreen mainScreen].scale;
    
    
    
    [self.view setMultipleTouchEnabled:YES];
    
    
    UI_USER_INTERFACE_IDIOM();
    //
    
    [self setupGL];
    
    
    
    
}

- (void)dealloc
{
    [self tearDownGL];
    
    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] && ([[self view] window] == nil)) {
        self.view = nil;
        
        [self tearDownGL];
        
        if ([EAGLContext currentContext] == self.context) {
            [EAGLContext setCurrentContext:nil];
        }
        self.context = nil;
    }
    
    // Dispose of any resources that can be recreated.
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}








- (void)setupGL
{//[UIDevice currentDevice].model
    NSLog(@"%@", [UIDevice currentDevice].model);
    [EAGLContext setCurrentContext:self.context];
    
    GLKView *view = (GLKView *)self.view;
    
    //    struct utsname systemInfo;
    //    uname(&systemInfo);
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    njli::NJLIGameEngine::create(0, 0, view.frame.size.width * view.contentScaleFactor, view.frame.size.height * view.contentScaleFactor, orientation, [[UIDeviceUtil hardwareDescription] UTF8String]);
}

- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self.context];
    
    njli::NJLIGameEngine::destroy();
}

#pragma mark - GLKView and GLKViewController delegate methods

- (void)update
{
    //    BT_PROFILE("GameViewController update");
    //    reset_touches();
    njli::NJLIGameEngine::update(self.timeSinceLastUpdate);
    
    //    CProfileManager::dumpAll();
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    
    njli::NJLIGameEngine::render();
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    GLKView *view = (GLKView *)self.view;
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    njli::NJLIGameEngine::resize(0, 0, view.frame.size.width * view.contentScaleFactor, view.frame.size.height * view.contentScaleFactor, orientation);
}

-(void) createTouchVector:(NSSet*)touches
{
    njli::NJLIGameEngine::clearNodeTouches();
    
    GLKView *view = (GLKView *)self.view;
    
    int i = 0;
    for(UITouch *touch in touches)
    {
        njli::NJLIGameEngine::setTouch((__bridge const void*)touch, i, touches.count);
        ++i;
    }
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self createTouchVector:touches];
    njli::NJLIGameEngine::touchDown();
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self createTouchVector:touches];
    njli::NJLIGameEngine::touchMove();
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self createTouchVector:touches];
    njli::NJLIGameEngine::touchUp();
    
    njli::NJLIGameEngine::clearNodeTouches();
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self createTouchVector:touches];
    njli::NJLIGameEngine::touchCancelled();
}

- (void)showKeyboard:(NSString *)initialText
{
    [_customKeyboard setTextFieldText:initialText];
    [_customKeyboard showKeyboard];
}

- (void) didShowKeyboard
{
    njli::NJLIGameEngine::keyboardShow();
}

- (void) didCancelKeyboard
{
    njli::NJLIGameEngine::keyboardCancel();
}

- (void) didReturnKeyPressedWithText:(NSString *)str
{
    njli::NJLIGameEngine::keyboardReturn([str UTF8String]);
}

#include "zlib.h"




- (NSData *)gzipInflate:(NSData*)data
{
    if ([data length] == 0) return data;
    
    unsigned full_length = [data length];
    unsigned half_length = [data length] / 2;
    
    NSMutableData *decompressed = [NSMutableData dataWithLength: full_length + half_length];
    BOOL done = NO;
    int status;
    
    z_stream strm;
    strm.next_in = (Bytef *)[data bytes];
    strm.avail_in = [data length];
    strm.total_out = 0;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    
    if (inflateInit2(&strm, (15+32)) != Z_OK) return nil;
    while (!done)
    {
        // Make sure we have enough room and reset the lengths.
        if (strm.total_out >= [decompressed length])
            [decompressed increaseLengthBy: half_length];
        strm.next_out = (Bytef*)[decompressed mutableBytes] + strm.total_out;
        strm.avail_out = [decompressed length] - strm.total_out;
        
        // Inflate another chunk.
        status = inflate (&strm, Z_SYNC_FLUSH);
        if (status == Z_STREAM_END) done = YES;
        else if (status != Z_OK) break;
    }
    if (inflateEnd (&strm) != Z_OK) return nil;
    
    // Set real length.
    if (done)
    {
        [decompressed setLength: strm.total_out];
        return [NSData dataWithData: decompressed];
    }
    else return nil;
}

- (NSData *)gzipDeflate:(NSData*)data
{
    if ([data length] == 0) return data;
    
    z_stream strm;
    
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.total_out = 0;
    strm.next_in=(Bytef *)[data bytes];
    strm.avail_in = [data length];
    
    // Compresssion Levels:
    //   Z_NO_COMPRESSION
    //   Z_BEST_SPEED
    //   Z_BEST_COMPRESSION
    //   Z_DEFAULT_COMPRESSION
    
    if (deflateInit2(&strm, Z_DEFAULT_COMPRESSION, Z_DEFLATED, (15+16), 8, Z_DEFAULT_STRATEGY) != Z_OK) return nil;
    
    NSMutableData *compressed = [NSMutableData dataWithLength:16384];  // 16K chunks for expansion
    
    do {
        
        if (strm.total_out >= [compressed length])
            [compressed increaseLengthBy: 16384];
        
        strm.next_out = (Bytef*)[compressed mutableBytes] + strm.total_out;
        strm.avail_out = [compressed length] - strm.total_out;
        
        deflate(&strm, Z_FINISH);
        
    } while (strm.avail_out == 0);
    
    deflateEnd(&strm);
    
    [compressed setLength: strm.total_out];
    return [NSData dataWithData:compressed];
}

- (void)beginInterruption
{
    BOOL success = NO;
    NSError *error = nil;
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    njli::NJLIGameEngine::pauseSound();
    
    //    jli::World::getInstance()->getWorldSound()->enableSuspend();
    
    //    success = [session setCategory:AVAudioSessionCategoryPlayback error:&error];
    //    DEBUG_ASSERT_PRINT(success, "%s", [[error localizedDescription] UTF8String]);
    
    success = [session setActive:NO error:&error];
    //    DEBUG_ASSERT_PRINT(success, "%s", [[error localizedDescription] UTF8String]);
    
    //    jli::World::getInstance()->enablePauseGame();
    njli::NJLIGameEngine::pauseGame();
}

- (void)endInterruption
{
    BOOL success = NO;
    NSError *error = nil;
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    //    jli::World::getInstance()->getWorldSound()->enableSuspend(false);
    njli::NJLIGameEngine::unpauseSound();
    
    success = [session setCategory:AVAudioSessionCategoryPlayback error:&error];
    //    DEBUG_ASSERT_PRINT(success, "%s", [[error localizedDescription] UTF8String]);
    
    success = [session setActive:YES error:&error];
    //    DEBUG_ASSERT_PRINT(success, "%s", [[error localizedDescription] UTF8String]);
}

-(void)emptyDocumentFiles
{
    NSFileManager *fileMgr = [[NSFileManager alloc] init];
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSArray *files = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
    
    while (files.count > 0) {
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *directoryContents = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error];
        if (error == nil) {
            for (NSString *path in directoryContents) {
                NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:path];
                BOOL removeSuccess = [fileMgr removeItemAtPath:fullPath error:&error];
                files = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
                if (!removeSuccess) {
                    // Error
                }
            }
        } else {
            // Error
        }
    }
}

@end
