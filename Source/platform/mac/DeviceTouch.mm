//
//  DeviceTouch.mm
//  JLIGameEngineTest
//
//  Created by James Folk on 12/8/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#include "DeviceTouch.h"
//#include <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "JLIFactoryTypes.h"
#include "World.h"

namespace njli
{
    const u8 DeviceTouch::MAX_TOUCHES = 5;
    
    void DeviceTouch::convert(DeviceTouch &t, const void *_touch)
    {
        if(_touch)
        {
//            UITouch *touch = (__bridge UITouch*)_touch;
//            
////            pixelPointFromViewPoint([touch locationInView:touch.view], touch.view);
//            
//            CGFloat scaleFactor = touch.view.contentScaleFactor;
//            m_scale = scaleFactor;
////            m_scale = [UIScreen mainScreen].nativeScale * 0.96;
//            
//            t.setTimeStampFrame(touch.timestamp);
//            CGPoint p = [touch locationInView:touch.view];
//            m_xpos = (p.x * scaleFactor) * 1;
//            m_ypos = (njli::World::getInstance()->getViewportDimensions().y() - (p.y * scaleFactor)) * 1;
//            p = [touch previousLocationInView:touch.view];
//            m_prev_xpos = (p.x * scaleFactor);
//            m_prev_ypos = njli::World::getInstance()->getViewportDimensions().y() - (p.y * scaleFactor);
//            t.m_address = [touch hash];
//            t.m_tapCount = [touch tapCount];
        }
    }
}
