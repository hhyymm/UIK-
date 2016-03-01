//
//  UserInfoCellView.m
//  DanceShow
//
//  Created by HYM on 15/5/5.
//  Copyright (c) 2015年 com.hym. All rights reserved.
//

#import "UserInfoCellView.h"

@implementation UserInfoCellView

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

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setNeedsDisplay];
}
//初始化配置
- (void)setUp
{
    if (!self.selectedBGColor) {
        self.selectedBGColor = [UIColor colorWithWhite:0.772 alpha:0.880];
    }
    self.clearsContextBeforeDrawing = YES;
    self.backgroundColor = [UIColor whiteColor];
    self.showDetail = YES;
    self.showImage = NO;
}

//配置属性
- (void)setLeftText:(NSString *)leftText
{
    _leftText = leftText;
    [self setNeedsDisplay];
}

- (void)setRightText:(NSString *)rightText
{
    _rightText = rightText;
    [self setNeedsDisplay];
}
- (void)setShowDetail:(BOOL)showDetail
{
    _showDetail = showDetail;
    [self setNeedsDisplay];
}

- (void)setShowImage:(BOOL)showImage
{
    _showImage = showImage;
    [self setNeedsDisplay];
}

//配置颜色

-(void)setSelectedBGColor:(UIColor *)selectedBGColor
{
    _selectedBGColor = selectedBGColor;
    [self setNeedsDisplay];
}
- (void)setUnSelectedBGColor:(UIColor *)unSelectedBGColor
{
    _unSelectedBGColor = unSelectedBGColor;
    [self setNeedsDisplay];
}

//触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    //    self.backgroundColor = self.selectedBGColof;
    self.touched = YES;
    [self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    self.touched = YES;
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.touched = NO;
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    self.touched = NO;
    [self setNeedsDisplay];
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *fillColor;
    if (self.touched) {
        fillColor = self.selectedBGColor;
    }else
    {
        fillColor = self.unSelectedBGColor?self.unSelectedBGColor:[UIColor whiteColor];
    }
    
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextFillRect(context, rect);
    
    if (_showImage) {
        UIImage *image = [UIImage imageNamed:self.imageName];
        [image drawInRect:CGRectMake(10, 8, CGRectGetHeight(rect)-8*2, CGRectGetHeight(rect)-8*2)];
    }
    
    NSDictionary *leftTextDict = @{NSFontAttributeName:[UIFont systemFontOfSize:17.0f],NSForegroundColorAttributeName:[UIColor blackColor]};
    
    CGSize leftSize = [self.leftText sizeWithAttributes:leftTextDict];
    CGFloat space = _showImage? CGRectGetHeight(rect):0;
    [self.leftText drawInRect:CGRectMake(10 +space, CGRectGetHeight(rect)/2 - leftSize.height/2, leftSize.width, leftSize.height) withAttributes:leftTextDict];
    
    NSDictionary *rightTextDict = @{NSFontAttributeName:[UIFont systemFontOfSize:12.0f],NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    
    CGSize rightSize = [self.rightText sizeWithAttributes:rightTextDict];
    
    [self.rightText drawInRect:CGRectMake(CGRectGetWidth(rect) - rightSize.width - 30, CGRectGetHeight(rect)/2 - rightSize.height/2, rightSize.width, rightSize.height) withAttributes:rightTextDict];
    
    if (self.showDetail) {
        UIImage *image = [UIImage imageNamed:@"13"];
        CGSize imageSize = image.size;
        [image drawInRect:CGRectMake(CGRectGetWidth(rect) - imageSize.width - 8, CGRectGetHeight(rect)/2 - imageSize.height/2, imageSize.width, imageSize.height)];
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor colorWithRed:0.710 green:0.714 blue:0.733 alpha:1.000].CGColor);  // set as the text's color
    CGContextSetLineWidth(ctx, 1.0f);
    CGPoint leftPoint = CGPointZero;
    CGPoint rightPoint = CGPointZero;
    
//#if NS_AVAILABLE_IOS(8.0)
//        leftPoint = CGPointMake(0,
//                                self.frame.size.height);
//        rightPoint = CGPointMake(self.frame.size.width,
//                                 self.frame.size.height);
//#else
//    {
        leftPoint = CGPointMake(0,
                                CGRectGetHeight(rect)-1.0f);
        rightPoint = CGPointMake(CGRectGetWidth(rect),
                                 CGRectGetHeight(rect)-1.0f);
//    }
//#endif
    
    CGContextMoveToPoint(ctx, leftPoint.x, leftPoint.y);
    CGContextAddLineToPoint(ctx, rightPoint.x, rightPoint.y);
    CGContextStrokePath(ctx);
}


@end
