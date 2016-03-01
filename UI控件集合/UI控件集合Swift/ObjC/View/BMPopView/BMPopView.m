
#import "BMPopView.h"
#import <QuartzCore/QuartzCore.h>

#define isPad   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad   ? YES : NO)
#define isPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? YES : NO)
#define isRetina ([[UIScreen mainScreen] scale] > 1 ? YES : NO)

////获取屏幕宽度
//#define KScreenWidth MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
////获取屏幕高度
//#define KScreenHeight  MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)


@implementation BMPopView

+(BMPopView *)shareInstance
{
    static BMPopView *_sharedBMPopView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedBMPopView = [[BMPopView alloc]init];
    });
    return _sharedBMPopView;
}


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5f];
        self.bgColor = self.backgroundColor;
        self.isFullScreen = NO;
        self.contentView = nil;
        self.canDisMiss = YES;
        self.customFrame = NO;
        [self addKeyboardNote];//键盘通知
        [self addWindowNotic];//转屏
    }
    return self;
}

- (void)dealloc {
    
    self.contentView = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


+ (BMPopView *)showWithContentView:(UIView *)cView delegate:(id<BMPopViewDelegate>)delegate {
    BMPopView *popoverView = [BMPopView shareInstance];
    [popoverView showWithContentView:cView withAnimation:BMPopViewAnimationNone delegate:delegate];
    return popoverView;
}

- (void)showWithContentView:(UIView *)cView delegate:(id<BMPopViewDelegate>)delegate {
    BMPopView *popoverView = [BMPopView shareInstance];
    [popoverView showWithContentView:cView withAnimation:BMPopViewAnimationNone delegate:delegate];
}

- (void)showWithContentView:(UIView *)cView {
    [self showWithContentView:cView withAnimation:BMPopViewAnimationNone];
    /*
    [self.subviews makeObjectsPerformSelector:@selector (removeFromSuperview)];
    self.contentView = cView;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    UIView *topView = [[window subviews] objectAtIndex:0];
    
    
    
    CGRect topViewBounds = topView.bounds;
    
    if (!_customFrame)
    {
        _contentView.center = topView.center;
    }
    else
    {
        //_contentView 自定义位置
    }
    [self addSubview:_contentView];
    
    self.frame = topViewBounds;
    
    [self setNeedsDisplay];
    
    [window addSubview:self];
//    [topView addSubview:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tap];
    
    self.userInteractionEnabled = YES;
    
    self.alpha = 0.f;
//    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    self.contentView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);

    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.f;
        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
        self.contentView.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
            self.contentView.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
     */
}

#pragma mark -
#pragma mark 动画
+ (BMPopView *)showWithContentView:(UIView *)cView withAnimation:(BMPopViewAnimation)myAnimation delegate:(id<BMPopViewDelegate>)delegate
{
    //    BMPopView *popoverView = [[BMPopView alloc] initWithFrame:CGRectZero];
    BMPopView *popoverView = [BMPopView shareInstance];
    [popoverView showWithContentView:cView withAnimation:myAnimation];
    popoverView.delegate = delegate;
    return popoverView;
}

- (void)showWithContentView:(UIView *)cView withAnimation:(BMPopViewAnimation)myAnimation delegate:(id<BMPopViewDelegate>)delegate
{
    BMPopView *popoverView = [BMPopView shareInstance];
    [popoverView showWithContentView:cView withAnimation:myAnimation];
    popoverView.delegate = delegate;
    //    [popoverView release];
}

- (void)showWithContentView:(UIView *)cView withAnimation:(BMPopViewAnimation)myAnimation
{
    [self.subviews makeObjectsPerformSelector:@selector (removeFromSuperview)];
    _animation = myAnimation;
    self.contentView = cView;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    UIView *topView = [[window subviews] objectAtIndex:0];

    CGRect topViewBounds = topView.bounds;
    
    if (!_customFrame)
    {
        _contentView.center =window.center;// topView.center;
    }
    else
    {
//        _contentView.frame = _boxFrame;
        //_contentView 自定义位置
    }
    [self addSubview:_contentView];
    
    self.frame = topViewBounds;
    
    [self setNeedsDisplay];
    
    [window addSubview:self];
    //    [topView addSubview:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tap];
    
    self.userInteractionEnabled = YES;
    
    self.alpha = 0.f;
    
    CGFloat _screenWidth  = CGRectGetWidth (self.frame);
    CGFloat _screenHeight = CGRectGetHeight(self.frame);
    NSLog(@"出现（%f，%f）",_screenHeight,_screenWidth);

    switch (myAnimation) {
        case BMPopViewAnimationTransForm:
        {
            self.alpha = 0.f;
            self.contentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
            [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.alpha = 1.f;
                self.contentView.transform = CGAffineTransformMakeScale(1.05, 1.05);

            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.alpha = 1.f;
                    self.contentView.transform = CGAffineTransformMakeScale(1, 1);
                    
                } completion:^(BOOL finished) {
                }];

            }];

        }
            break;
        case BMPopViewAnimationShowFromBottom:
        {
            self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , _screenHeight - _offset.bottom + _offset.top);
            [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.alpha = 1.f;
                self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , _screenHeight - _contentView.frame.size.height/2.0 - _offset.bottom + _offset.top);
            } completion:^(BOOL finished) {
            }];

        }
            break;
        case BMPopViewAnimationShowFromRight:
        {

            self.contentView.center = CGPointMake(_screenWidth - _offset.left +_offset.right , _screenHeight/2.0 - _offset.bottom + _offset.top);
            [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.alpha = 1.f;
                self.contentView.center = CGPointMake(_screenWidth - CGRectGetWidth(self.contentView.frame)/2.0 - _offset.left +_offset.right , _screenHeight/2.0 - _offset.bottom + _offset.top);
            } completion:^(BOOL finished) {
            }];
            
        }
            break;
        case BMPopViewAnimationShowBegainTop:
        {
            self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , - _offset.bottom + _offset.top);
            [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.alpha = 1.f;
                self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , _contentView.frame.size.height/2 - _offset.bottom + _offset.top);
            } completion:^(BOOL finished) {
            }];
            
        }
            break;
        case BMPopViewAnimationShowFromLeft:
        {
            self.contentView.center = CGPointMake(_offset.left -_offset.right - CGRectGetWidth(_contentView.frame)/2, _screenHeight/2 + _offset.top - _offset.bottom );
            [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.alpha = 1.f;
                self.contentView.center = CGPointMake(_offset.left - _offset.right + CGRectGetWidth(_contentView.frame)/2, _screenHeight/2 + _offset.top - _offset.bottom );
            } completion:^(BOOL finished) {
            }];
        }
            break;
        default:
        {
            self.alpha = 1.f;
        }
            break;
    }
   
}


#pragma mark - User Interaction

- (void)tapped:(UITapGestureRecognizer *)tap {
    
    CGPoint point = [tap locationInView:_contentView];
    
    BOOL found = NO;

    if(!found && CGRectContainsPoint(_contentView.bounds, point)) {
        found = YES;
    }
    
    if(!found && _canDisMiss) {
        [self dismiss];
    }
    
}

- (void)dismiss {
    CGFloat _screenWidth  = CGRectGetWidth (self.frame);
    CGFloat _screenHeight = CGRectGetHeight(self.frame);
    
    [self.contentView endEditing:YES];
    
    NSLog(@"消失（%f，%f）",_screenHeight,_screenWidth);
    
    switch (_animation) {
        case BMPopViewAnimationTransForm:
        {
            [UIView animateWithDuration:0.2f animations:^{
                self.alpha = 0.1f;
                //        self.layer.anchorPoint = CGPointMake(0, 0);
                //        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
                self.contentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
            } completion:^(BOOL finished) {
                [self.contentView removeFromSuperview];

                [self removeFromSuperview];
                
                if(self.delegate && [self.delegate respondsToSelector:@selector(popViewDidDismiss:)]) {
                    [_delegate popViewDidDismiss:self];
                }
                
            }];

        }
            break;
        case BMPopViewAnimationShowFromBottom:
        {
            [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.alpha = 0.1f;
                self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , _screenHeight + _contentView.frame.size.height/2);
            } completion:^(BOOL finished) {
                [self.contentView removeFromSuperview];

                [self removeFromSuperview];
                if(self.delegate && [self.delegate respondsToSelector:@selector(popViewDidDismiss:)]) {
                    [_delegate popViewDidDismiss:self];
                }
            }];
            
        }
            break;
        case BMPopViewAnimationShowFromRight:
        {
            
            [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.alpha = 0.1f;
                self.contentView.center = CGPointMake(_screenWidth - _offset.left +_offset.right , _screenHeight/2.0 - _offset.bottom + _offset.top);
            } completion:^(BOOL finished) {
                
                [self.contentView removeFromSuperview];

                [self removeFromSuperview];
                if(self.delegate && [self.delegate respondsToSelector:@selector(popViewDidDismiss:)]) {
                    [_delegate popViewDidDismiss:self];
                }
            }];
            
        }
            break;
        case BMPopViewAnimationShowBegainTop:
        {
            
            [UIView animateWithDuration:0.20f delay:0.f options:UIViewAnimationOptionCurveLinear animations:^{
                
                self.alpha = 0.1f;
                self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , - _offset.bottom + _offset.top);
                
            } completion:^(BOOL finished) {
                
                [self.contentView removeFromSuperview];
                
                [self removeFromSuperview];
                if(self.delegate && [self.delegate respondsToSelector:@selector(popViewDidDismiss:)]) {
                    [_delegate popViewDidDismiss:self];
                }
            }];
            
        }
            break;
        case BMPopViewAnimationShowFromLeft:
        {
            
            [UIView animateWithDuration:0.20f delay:0.f options:UIViewAnimationOptionCurveLinear animations:^{
                
                self.alpha = 0.1f;
                self.contentView.center = CGPointMake(_offset.left -_offset.right - CGRectGetWidth(_contentView.frame)/2, _screenHeight/2.0 + _offset.top - _offset.bottom );
                
            } completion:^(BOOL finished) {
    
                [self.contentView removeFromSuperview];
                
                [self removeFromSuperview];
                if(self.delegate && [self.delegate respondsToSelector:@selector(popViewDidDismiss:)]) {
                    [_delegate popViewDidDismiss:self];
                }
            }];
        }
            break;
        default:
        {
            self.alpha = 0.1;
            [self.contentView removeFromSuperview];

            [self removeFromSuperview];
            if(self.delegate && [self.delegate respondsToSelector:@selector(popViewDidDismiss:)]) {
                [_delegate popViewDidDismiss:self];
            }
        }
            break;
    }

    /**
     *  @author HYM, 15-02-26 19:02:35
     *
     *  重置
     */
    _animation = BMPopViewAnimationNone;
    self.customFrame = NO;
    self.offset = UIEdgeInsetsZero;
    self.isFullScreen = NO;
    self.boxFrame = CGRectZero;
}


#pragma mark - 键盘处理
#pragma mark 监听系统发出的键盘通知
- (void)addKeyboardNote
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    // 1.显示键盘
    [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];

    // 2.隐藏键盘
    [center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark 显示一个新的键盘就会调用
- (void)keyboardWillShow:(NSNotification *)note
{
    // 1.取得当前聚焦文本框最下面的Y值
    CGFloat fieldMaxY = CGRectGetMaxY(_contentView.frame);
    
    // 2.计算键盘的Y值
    // 2.1.取出键盘的高度
    CGFloat keyboardH = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    // 2.2.控制器view的高度 - 键盘的高度
    CGFloat keyboardY = self.frame.size.height - keyboardH +self.contentView.transform.ty;
    
    // 3.比较 文本框最大Y 跟 键盘Y
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    if (duration <= 0.0) {
        duration = 0.25;
    }
    
    [UIView animateWithDuration:duration animations:^{
        if (fieldMaxY > keyboardY) { // 键盘挡住了文本框
            self.contentView.transform = CGAffineTransformMakeTranslation(0, keyboardY - fieldMaxY -4);
        } else { // 没有挡住文本框
            self.contentView.transform = CGAffineTransformIdentity;
        }
    }];
}

#pragma mark 隐藏键盘就会调用
- (void)keyboardWillHide:(NSNotification *)note
{
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.contentView.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark - 转屏
// 转屏
- (void)addWindowNotic
{
//    if (_keyWindow) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationChanged:) name:UIDeviceOrientationDidChangeNotification  object:nil];
//    }
}

- (void)deviceOrientationChanged:(NSNotification *)notic
{
    NSLog(@"%ld",    (long)[UIDevice currentDevice].orientation);
    [self setNeedsLayout];
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = [UIApplication sharedApplication].keyWindow.bounds;
//    self.contentView.center = CGPointMake(CGRectGetWidth(self.frame)/2- _offset.left +_offset.right , CGRectGetHeight(self.frame)/2.0  - _offset.bottom + _offset.top);
    CGFloat _screenWidth  = CGRectGetWidth (self.frame);
    CGFloat _screenHeight = CGRectGetHeight(self.frame);
    NSLog(@"出现（%f，%f）",_screenHeight,_screenWidth);
    
    switch (_animation) {
        case BMPopViewAnimationTransForm:
        {
            self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , _screenHeight/2.0  - _offset.bottom + _offset.top);
        }
            break;
        case BMPopViewAnimationShowFromBottom:
        {
            self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , _screenHeight - _contentView.frame.size.height/2.0 - _offset.bottom + _offset.top);
        }
            break;
        case BMPopViewAnimationShowFromRight:
        {
            
            self.contentView.center = CGPointMake(_screenWidth - CGRectGetWidth(self.contentView.frame)/2.0 - _offset.left +_offset.right , _screenHeight/2.0 - _offset.bottom + _offset.top);

        }
            break;
        case BMPopViewAnimationShowBegainTop:
        {
            self.contentView.center = CGPointMake(_screenWidth/2- _offset.left +_offset.right , _contentView.frame.size.height/2 - _offset.bottom + _offset.top);

        }
            break;
        case BMPopViewAnimationShowFromLeft:
        {
            self.contentView.center = CGPointMake(_offset.left - _offset.right + CGRectGetWidth(_contentView.frame)/2, _screenHeight/2 + _offset.top - _offset.bottom );

        }
            break;
        default:
        {
            self.alpha = 1.f;
        }
            break;
    }
    
}


#pragma mark - Drawing Routines
//
//- (void)drawRect:(CGRect)rect
//{
//    CGRect frame;
//    if(_isFullScreen)
//    {
//        frame = self.frame;
//    }
//    else
//    {
//        frame = self.contentView.frame;
//    }
//    float xMin = CGRectGetMinX(frame);
//    float yMin = CGRectGetMinY(frame);
//    
//    float xMax = CGRectGetMaxX(frame);
//    float yMax = CGRectGetMaxY(frame);
//    
//    float radius = 0;
//    
// 
//    UIBezierPath *popoverPath = [UIBezierPath bezierPath];
//    [popoverPath moveToPoint:CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + radius)];//LT1
//    [popoverPath addCurveToPoint:CGPointMake(xMin + radius, yMin) controlPoint1:CGPointMake(xMin, yMin + radius ) controlPoint2:CGPointMake(xMin + radius , yMin)];//LT2
//    
//    [popoverPath addLineToPoint:CGPointMake(xMax - radius, yMin)];//RT1
//    [popoverPath addCurveToPoint:CGPointMake(xMax, yMin + radius) controlPoint1:CGPointMake(xMax - radius, yMin) controlPoint2:CGPointMake(xMax, yMin + radius )];//RT2
//    [popoverPath addLineToPoint:CGPointMake(xMax, yMax - radius)];//RB1
//    [popoverPath addCurveToPoint:CGPointMake(xMax - radius, yMax) controlPoint1:CGPointMake(xMax, yMax - radius ) controlPoint2:CGPointMake(xMax - radius , yMax)];//RB2
//
//    
//    [popoverPath addLineToPoint:CGPointMake(xMin + radius, yMax)];//LB1
//    [popoverPath addCurveToPoint:CGPointMake(xMin, yMax - radius) controlPoint1:CGPointMake(xMin + radius , yMax) controlPoint2:CGPointMake(xMin, yMax - radius )];//LB2
//    [popoverPath closePath];
//    
//    //// General Declarations
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //// Shadow Declarations
//    UIColor* shadow = [UIColor colorWithWhite:0.f alpha:0.7];
//    CGSize shadowOffset = CGSizeMake(0, 1);
//    CGFloat shadowBlurRadius = 10;
//    
//    //// Gradient Declarations
//    NSArray* gradientColors = [NSArray arrayWithObjects:
//                               (id)[UIColor colorWithWhite:0.f alpha:0.4f].CGColor,
//                               (id)[UIColor colorWithWhite:0.f alpha:0.9f].CGColor, nil];
//    CGFloat gradientLocations[] = {0,1};
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, gradientLocations);
//    
//    
//    //These floats are the top and bottom offsets for the gradient drawing so the drawing includes the arrows.
//    float bottomOffset = 0;
//    float topOffset = 0;
//    
//    //Draw the actual gradient and shadow.
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
//    CGContextBeginTransparencyLayer(context, NULL);
//    [popoverPath addClip];
//    CGContextDrawLinearGradient(context, gradient, CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame) - topOffset), CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame) + bottomOffset), 0);
//    CGContextEndTransparencyLayer(context);
//    CGContextRestoreGState(context);
//    
//    // Cleanup
//    CGGradientRelease(gradient);
//    CGColorSpaceRelease(colorSpace);
//    
//}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // Build the popover path
    CGRect frame;
    if(_isFullScreen)
    {
        frame = self.frame;
    }
    else
    {
        frame = _boxFrame;
    }
    
    float xMin = CGRectGetMinX(frame);
    float yMin = CGRectGetMinY(frame);
    
    float xMax = CGRectGetMaxX(frame);
    float yMax = CGRectGetMaxY(frame);
    
    float radius = 0; //Radius of the curvature.
    
    float cpOffset = 0; //Control Point Offset.  Modifies how "curved" the corners are.
    
    
    /*
     LT2            RT1
     LT1⌜⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⌝RT2
     |               |
     |    popover    |
     |               |
     LB2⌞_______________⌟RB1
     LB1           RB2
     
     Traverse rectangle in clockwise order, starting at LT1
     L = Left
     R = Right
     T = Top
     B = Bottom
     1,2 = order of traversal for any given corner
     
     */
    
    UIBezierPath *popoverPath = [UIBezierPath bezierPath];
    [popoverPath moveToPoint:CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + radius)];//LT1
    [popoverPath addCurveToPoint:CGPointMake(xMin + radius, yMin) controlPoint1:CGPointMake(xMin, yMin + radius - cpOffset) controlPoint2:CGPointMake(xMin + radius - cpOffset, yMin)];//LT2
    
    //If the popover is positioned below (!above) the arrowPoint, then we know that the arrow must be on the top of the popover.
    //In this case, the arrow is located between LT2 and RT1
//    if(!above) {
//        [popoverPath addLineToPoint:CGPointMake(arrowPoint.x - kArrowHeight, yMin)];//left side
//        [popoverPath addCurveToPoint:arrowPoint controlPoint1:CGPointMake(arrowPoint.x - kArrowHeight + kArrowCurvature, yMin) controlPoint2:arrowPoint];//actual arrow point
//        [popoverPath addCurveToPoint:CGPointMake(arrowPoint.x + kArrowHeight, yMin) controlPoint1:arrowPoint controlPoint2:CGPointMake(arrowPoint.x + kArrowHeight - kArrowCurvature, yMin)];//right side
//    }
    
    [popoverPath addLineToPoint:CGPointMake(xMax - radius, yMin)];//RT1
    [popoverPath addCurveToPoint:CGPointMake(xMax, yMin + radius) controlPoint1:CGPointMake(xMax - radius + cpOffset, yMin) controlPoint2:CGPointMake(xMax, yMin + radius - cpOffset)];//RT2
    [popoverPath addLineToPoint:CGPointMake(xMax, yMax - radius)];//RB1
    [popoverPath addCurveToPoint:CGPointMake(xMax - radius, yMax) controlPoint1:CGPointMake(xMax, yMax - radius + cpOffset) controlPoint2:CGPointMake(xMax - radius + cpOffset, yMax)];//RB2
    
    //If the popover is positioned above the arrowPoint, then we know that the arrow must be on the bottom of the popover.
    //In this case, the arrow is located somewhere between LB1 and RB2
//    if(above) {
//        [popoverPath addLineToPoint:CGPointMake(arrowPoint.x + kArrowHeight, yMax)];//right side
//        [popoverPath addCurveToPoint:arrowPoint controlPoint1:CGPointMake(arrowPoint.x + kArrowHeight - kArrowCurvature, yMax) controlPoint2:arrowPoint];//arrow point
//        [popoverPath addCurveToPoint:CGPointMake(arrowPoint.x - kArrowHeight, yMax) controlPoint1:arrowPoint controlPoint2:CGPointMake(arrowPoint.x - kArrowHeight + kArrowCurvature, yMax)];
//    }
    
    [popoverPath addLineToPoint:CGPointMake(xMin + radius, yMax)];//LB1
    [popoverPath addCurveToPoint:CGPointMake(xMin, yMax - radius) controlPoint1:CGPointMake(xMin + radius - cpOffset, yMax) controlPoint2:CGPointMake(xMin, yMax - radius + cpOffset)];//LB2
    [popoverPath closePath];
    
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Shadow Declarations
    UIColor* shadow = [UIColor colorWithWhite:0.f alpha:1.0];
    CGSize shadowOffset = CGSizeMake(0, 1);
    CGFloat shadowBlurRadius = 10;
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)_bgColor.CGColor,
                               (id)_bgColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, gradientLocations);
    
    
    //These floats are the top and bottom offsets for the gradient drawing so the drawing includes the arrows.
    float bottomOffset = 0;
    float topOffset = 0;
    
    //Draw the actual gradient and shadow.
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [popoverPath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame) - topOffset), CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame) + bottomOffset), 0);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    
  
}


@end
