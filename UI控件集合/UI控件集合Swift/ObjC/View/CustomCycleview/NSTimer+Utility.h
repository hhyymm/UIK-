//
//  NSTimer+Utility.h
//  CycleView
//
//  Created by 徐雅芳 on 16/5/26.
//  Copyright © 2016年 CycleView. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Utility)
- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
