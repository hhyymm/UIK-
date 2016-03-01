
/**
 *  @author HYM, 15-02-03 17:02:06
 *
 *  V2.3 更新转屏操作
 *  V2.3.1 位置调整
 */

#import <UIKit/UIKit.h>

typedef enum {
    BMPopViewAnimationNone = 1,
    BMPopViewAnimationTransForm,
    BMPopViewAnimationShowFromBottom,
    BMPopViewAnimationShowFromLeft,
    BMPopViewAnimationShowFromRight,
    BMPopViewAnimationShowBegainTop,
} BMPopViewAnimation;

@class BMPopView;

@protocol BMPopViewDelegate <NSObject>

@optional

- (void)popViewDidDismiss:(BMPopView *)popView;

@end

@interface BMPopView : UIView
{

    BMPopViewAnimation _animation;
//    UIWindow *_keyWindow;
}

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) id<BMPopViewDelegate> delegate;
// 自定义contentView 的frame  (位置)
@property (nonatomic, assign) BOOL customFrame;

@property (nonatomic) UIEdgeInsets offset;// 目测用CGPoint 就可以了

// 是否全屏
@property (nonatomic,assign)BOOL isFullScreen;

// 点击灰色区域是否消失
@property (nonatomic,assign)BOOL canDisMiss;

@property (nonatomic,assign)CGRect boxFrame;

@property (nonatomic,strong)UIColor *bgColor;

+ (BMPopView *)shareInstance;


+ (BMPopView *)showWithContentView:(UIView *)cView delegate:(id<BMPopViewDelegate>)delegate;
+ (BMPopView *)showWithContentView:(UIView *)cView withAnimation:(BMPopViewAnimation)myAnimation delegate:(id<BMPopViewDelegate>)delegate;

/**
 *  @author HYM, 15-07-21 13:07:32
 *
 *  默认无delegate ，animation ＝ BMPopViewAnimationNone
 *
 *  @param cView    要显示的容器
 *  @param delegate 代理
 */
- (void)showWithContentView:(UIView *)cView delegate:(id<BMPopViewDelegate>)delegate;
/**
 *  @author HYM, 15-07-21 13:07:29
 *
 *  默认无delegate ，animation ＝ BMPopViewAnimationNone
 *
 *  @param cView 容器
 */
- (void)showWithContentView:(UIView *)cView;


- (void)showWithContentView:(UIView *)cView withAnimation:(BMPopViewAnimation)myAnimation delegate:(id<BMPopViewDelegate>)delegate;

- (void)showWithContentView:(UIView *)cView withAnimation:(BMPopViewAnimation)myAnimation;



- (void)dismiss;


@end
