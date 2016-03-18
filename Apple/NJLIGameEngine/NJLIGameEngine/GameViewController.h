//
//  GameViewController.h
//  NJLIGameEngine
//
//  Created by James Folk on 3/17/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <AVFoundation/AVAudioSession.h>

#import <NJLIGameEngine_iOS/NJLIGameEngine_iOS.h>
#import <NJLIGameEngine_iOS/TZKeyboardPop.h>
#import <NJLIGameEngine_iOS/UIDeviceUtil.h>


@interface GameViewController : GLKViewController <TZKeyboardPopDelegate, AVAudioSessionDelegate>

- (void)showKeyboard:(NSString *)initialText;

@end
