//
//  UserInfoCellView.h
//  DanceShow
//
//  Created by HYM on 15/5/5.
//  Copyright (c) 2015年 com.hym. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UserInfoCellView : UIControl
@property (nonatomic,strong) IBInspectable NSString* imageName;//图标
@property (nonatomic,strong) IBInspectable NSString* leftText;//左边标题
@property (nonatomic,strong) IBInspectable NSString* rightText;//右方小字体
@property (nonatomic,assign) IBInspectable BOOL showDetail;//右箭头
@property (nonatomic,assign) IBInspectable BOOL showImage;//是否显示图标
@property (nonatomic,assign) IBInspectable BOOL touched;
@property (nonatomic,strong) IBInspectable UIColor *selectedBGColor;
@property (nonatomic,strong) IBInspectable UIColor *unSelectedBGColor;
@end
