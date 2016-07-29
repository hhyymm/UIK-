//
//  MMSetpView.h
//  UI控件集合Swift
//
//  Created by HF on 16/7/29.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>

IBInspectable
@class MMSetpViewItem,MMProgressView;
@interface MMSetpView : UIView

@property (nonatomic) CGFloat padding;//*< 边界 */

@property (strong, nonatomic) NSArray<MMSetpViewItem *> *itemArr;

@property (assign, nonatomic) NSInteger currentIndex;

@end


//@protocol MMSetpViewItem <NSObject>
@interface MMSetpViewItem : NSObject

@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSString *subTitle;

@property (strong, nonatomic) UIColor *titleColor;

@property (strong, nonatomic) UIColor *subTitleColor;

@end

@interface MMSetpViewItemView : UIView

@property (strong, nonatomic) NSString *title;

@end
