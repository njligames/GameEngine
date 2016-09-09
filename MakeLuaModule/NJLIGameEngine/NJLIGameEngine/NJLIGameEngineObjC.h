//
//  NJLIGameEngineObjC.h
//  NJLIGameEngine
//
//  Created by James Folk on 9/5/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface NJLIGameEngineObjC : NSObject

- (void)create:(GLKView *)view;
- (void)destroy;
- (void)update:(NSTimeInterval)interval;
- (void)render;
- (void)resize:(GLKView *)view orientation:(UIInterfaceOrientation)orientation;

- (void)touchDown:(NSSet *)touches;
- (void)touchUp:(NSSet *)touches;
- (void)touchMove:(NSSet *)touches;
- (void)touchCancelled:(NSSet *)touches;

- (void)willResignActive;
- (void)didBecomeActive;
- (void)didEnterBackground;
- (void)willEnterForeground;
- (void)willTerminate;
- (void)interrupt;
- (void)resumeInterrupt;

@end
