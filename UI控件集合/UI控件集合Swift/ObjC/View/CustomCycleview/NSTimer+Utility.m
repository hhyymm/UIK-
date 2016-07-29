//
//  NSTimer+Utility.m
//  CycleView
//
//  Created by 徐雅芳 on 16/5/26.
//  Copyright © 2016年 CycleView. All rights reserved.
//

#import "NSTimer+Utility.h"

@implementation NSTimer (Utility)
-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}
@end
