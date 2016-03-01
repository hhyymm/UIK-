//
//  PadingLabel.m
//  com.mb.slideglass
//
//  Created by heyangyang on 15/11/18.
//  Copyright © 2015年 com.BlueMobi.www. All rights reserved.
//

#import "PadingLabel.h"

@implementation PadingLabel

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

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (void)setUp
{
    self.contentInset = UIEdgeInsetsMake(8, 10, 8, 10);
    [self setNeedsDisplay];
}


- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines;
{
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    return CGRectMake(_contentInset.left, _contentInset.top, rect.size.width - (_contentInset.left + _contentInset.right), CGRectGetHeight(rect) - (_contentInset.top+_contentInset.bottom));
}
- (void)drawTextInRect:(CGRect)rect
{
    CGRect drRect = CGRectMake(_contentInset.left, _contentInset.top, rect.size.width - (_contentInset.left + _contentInset.right), CGRectGetHeight(rect) - (_contentInset.top+_contentInset.bottom));
    [super drawTextInRect:drRect];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
