//
//  KlineView.h
//  Kline
//
//  Created by yndfcd on 15/3/27.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface KlineView : UIView
/**
 *  K线的数据源，数据顺序为，最旧（如2015-5-5) ---->  最新（如2015-5-6）
 *  [[108.96,108.96,108.03,108.08,7460.0,8111816.2,108.74,"20150505"],[106.87,107.18,105.8,106.87,8716.0,9360065.4,107.39,"20150506"]]
 *   元素说明：[108.96,108.96,108.03,108.08,7460.0,8111816.2,108.74,"20150505"]意义：[开盘,最高,最低,收盘,未使用,未使用,未使用,日期]
 *  未使用代表此数据在绘制整个K线时没有用到，可以不关注
 */
@property (nonatomic,strong) NSArray* rawData;

/**
 *  如需查看示例效果，可调此方法（该方法会从服务器取原始数据并绘制成K线）
 *  正常开发请勿调用此方法，只需对rawData按照上述数据格式赋值即可
 */
-(void)fetchData;

/**
 *  初始化方法
 *
 *  @param frame frame
 *
 */
-(id) initWithFrame:(CGRect)frame;

@end
