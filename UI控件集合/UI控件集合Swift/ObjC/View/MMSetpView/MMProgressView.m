//
//  MMProgressView.m
//  UI控件集合Swift
//
//  Created by HF on 16/7/29.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import "MMProgressView.h"

@implementation MMProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


- (void)setUp
{
    self.minValue = 0;
    self.maxValue = 1;
    self.currentValue = 0.0;
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    // Drawing code
    [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] setFill];
    UIBezierPath *backPath = [UIBezierPath bezierPathWithRect:rect];
    [backPath fill];
    
    CGFloat currentX =  width*(self.currentValue - self.minValue)/(self.maxValue - self.minValue);
    
    UIBezierPath *forgroundPath = [UIBezierPath bezierPath];
    [forgroundPath moveToPoint:CGPointMake(0, 0)];
    [forgroundPath addLineToPoint:CGPointMake(currentX, 0)];
    [forgroundPath addLineToPoint:CGPointMake(currentX, height)];
    [forgroundPath addLineToPoint:CGPointMake(0, height)];
    [forgroundPath addLineToPoint:CGPointMake(0, 0)];
    [[UIColor colorWithRed:.5 green:0.5 blue:.5 alpha:1.0] setFill];
    [forgroundPath fill];
    
    [backPath appendPath:forgroundPath];
}

@end
