//
//  CustomCycleview.h
//  CycleView
//
//  Created by 徐雅芳 on 16/5/25.
//  Copyright © 2016年 CycleView. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import <YYCategories.h>
#import <AFNetworking.h>
typedef void(^CycleClickBlock)(NSInteger index);
@interface CustomCycleview : UIView
/**
 *  数据源
 */
@property (nullable, nonatomic, strong) NSArray *imageUrls;

/**
 *  图片模式
 */
@property (nonatomic, assign) BOOL smallImg;

/**
 *  自动轮播的速度 默认为3
 */
@property (nonatomic ,assign) CGFloat scrollingSpeed;

/**
 *  是否自动轮播 默认为YES
 */
@property (nonatomic ,assign) BOOL isAutoScrolling;
/**
 *  占位图
 */
@property (nonatomic, strong,nonnull) NSString *placeholderImageStr;
/**
 *  是否有底部图层 默认为空
 */
@property (nonatomic ,assign) BOOL haveBottomView;


/**
 *  重启
 */
-(void)resumeTimer;
/**
 *  暂停
 */
-(void)pauseTimer;
/**
 *  移除
 */
- (void)removeTimer;

/**
 *  设置pageControl颜色和位置
 *
 *  @param frame <#frame description#>
 */
- (void)pageControlFrame:(CGRect)frame currentColor:(nonnull UIColor *)cColor nomalColor:(nonnull UIColor *)color;

/**
 *  点击
 */
@property (nonatomic,copy) CycleClickBlock cycleClickBlock;

//- (void)setImgs:(NSArray *)imageUrls titleArr:(NSArray *)titleArr;
//@property (nullable, nonatomic, strong) NSArray *titleStrArr;

@end
