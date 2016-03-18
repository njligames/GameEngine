//
//  GameViewController.h
//  tvOS
//

//  Copyright (c) 2016 NJLIGames Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <AVFoundation/AVAudioSession.h>

#import <NJLIGameEngine_tvOS/NJLIGameEngine_tvOS.h>
#import <NJLIGameEngine_tvOS/TZKeyboardPop.h>
#import <NJLIGameEngine_tvOS/UIDeviceUtil.h>


@interface GameViewController : GLKViewController <TZKeyboardPopDelegate>//, AVAudioSessionDelegate>

- (void)showKeyboard:(NSString *)initialText;

@end