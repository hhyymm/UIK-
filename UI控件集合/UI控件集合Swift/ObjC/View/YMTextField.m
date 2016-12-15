//
//  YMTextField.m
//  UI控件集合Swift
//
//  Created by F H on 2016/12/15.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import "YMTextField.h"

@implementation YMTextField

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
        
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
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
    self.contentEdg = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    if ([self.leftView isKindOfClass:[UIImageView class]]) {
        [(UIImageView *)self.leftView setContentMode:UIViewContentModeScaleAspectFit];
    }else
    {
        [super leftViewRectForBounds:bounds];
    }
    return CGRectMake(20, 0, 16, bounds.size.height);
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    if ([self.rightView isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)self.rightView;
        btn.contentMode = UIViewContentModeScaleAspectFit;
        [btn sizeToFit];
        return CGRectMake(bounds.size.width - btn.frame.size.width - 20, 0,  btn.frame.size.width + 20, bounds.size.height);
    }else
    {
        return [super rightViewRectForBounds:bounds];
    }
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    if (self.rightView != nil)
    {
        return CGRectMake(self.contentEdg.left, 0, bounds.size.width - self.contentEdg.left - 36, bounds.size.height);
    }
    else
    {
        return CGRectMake(self.contentEdg.left, 0, bounds.size.width - self.contentEdg.left, bounds.size.height);
    }
}

-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    if (self.rightView != nil)
    {
        return CGRectMake(self.contentEdg.left, 0, bounds.size.width - self.contentEdg.left - 36, bounds.size.height);
    }
    else
    {
        return CGRectMake(self.contentEdg.left, 0, bounds.size.width - self.contentEdg.left, bounds.size.height);
    }
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    if (self.rightView != nil)
    {
        return CGRectMake(self.contentEdg.left, 0, bounds.size.width - self.contentEdg.left - 36, bounds.size.height);
    }
    else
    {
        return CGRectMake(self.contentEdg.left, 0, bounds.size.width - self.contentEdg.left, bounds.size.height);
    }
}

@end
