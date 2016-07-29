//
//  MMSetpView.m
//  UI控件集合Swift
//
//  Created by HF on 16/7/29.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import "MMSetpView.h"
#import "MMProgressView.h"

@interface MMSetpView ()

@property (strong, nonatomic) NSMutableArray *itemViewArr;

@property (strong, nonatomic) MMProgressView *backView;

@end


@implementation MMSetpView

-(void)awakeFromNib
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        MMSetpViewItem *item = [[MMSetpViewItem alloc]init];
        item.title = @(i).stringValue;
        [arr addObject:item];
    }
    self.itemArr = arr;
    self.padding = 20;
}

#pragma mark - getter/setter 

- (NSMutableArray *)itemViewArr
{
    if (!_itemViewArr) {
        _itemViewArr = [NSMutableArray array];
    }
    return _itemViewArr;
}

- (MMProgressView *)backView
{
    if (!_backView) {
        _backView = [[MMProgressView alloc]init];
    }
    return _backView;
}

- (void)setItemArr:(NSArray<MMSetpViewItem *> *)itemArr
{
    _itemArr = itemArr;
    [self setNeedsLayout];
}

- (void)setUI
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat subTitleHeight = 30;
    CGFloat centerY = (height - subTitleHeight)/2.0;
    NSInteger count = self.itemArr.count;
    if (count <= 0) {
        return;
    }
    
    self.backView.maxValue = count;
    self.backView.currentValue = self.currentIndex;
    self.backView.frame = CGRectMake(self.padding, 0, width - 2*self.padding, height);
    [self addSubview:self.backView];

    NSAssert((count - 1) > 0, @"item should be more than 1");
    CGFloat itemSpace = (width - 2 * self.padding)/(count-1);
    
    [self.itemArr enumerateObjectsUsingBlock:^(MMSetpViewItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MMSetpViewItemView *item = [[MMSetpViewItemView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        item.center = CGPointMake(self.padding + itemSpace*idx,centerY);
        item.title = obj.title;
        [self addSubview:item];
    }];
}



- (void)layoutSubviews
{
    [self setUI];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation MMSetpViewItem


@end

@implementation MMSetpViewItemView

- (void)didMoveToSuperview
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect
{
    self.clearsContextBeforeDrawing = YES;
    
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGPoint center = CGPointMake(width/2.0, height/2.0);
    
    [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1] setFill];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:CGRectGetWidth(rect)/2.0f];
    [path fill];
    
    [[UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:1] setFill];

    [path addArcWithCenter:center radius: width - 3 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path fill];
    CATextLayer *layer = [[CALayer alloc]init];
    
    [self.title drawInRect:rect withAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
    
}

@end