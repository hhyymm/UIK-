//
//  Header.swift
//  HongWeiYiJia
//
//  Created by HYM on 15/5/6.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

import Foundation
import UIKit

let APIKey:NSString = "4399cd25c0e44f66e81166e4430c0c6b"
//项目textField 边界颜色
let DEF_TextField_Color:UIColor = UIColor(white: 0.0, alpha: 0.2)

let DEF_MainBack_Image:String = "14"

let IOS8_OR_LATER:Bool =  UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending

let IOS7_OR_LATER:Bool =  UIDevice.currentDevice().systemVersion.compare("7.0.0", options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending
let IOS6_OR_LATER:Bool =  UIDevice.currentDevice().systemVersion.compare("6.0.0", options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending
let IOS5_OR_LATER:Bool =  UIDevice.currentDevice().systemVersion.compare("5.0.0", options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending
let IOS4_OR_LATER:Bool =  UIDevice.currentDevice().systemVersion.compare("4.0.0", options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending
let IOS3_OR_LATER:Bool =  UIDevice.currentDevice().systemVersion.compare("3.0.0", options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending


let IOS7_OR_EARLIER:Bool = ( !IOS8_OR_LATER )
let IOS6_OR_EARLIER:Bool = ( !IOS7_OR_LATER )
let IOS5_OR_EARLIER:Bool = ( !IOS6_OR_LATER )
let IOS4_OR_EARLIER:Bool = ( !IOS5_OR_LATER )
let IOS3_OR_EARLIER:Bool = ( !IOS4_OR_LATER )


//([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//let IS_SCREEN_35_INCH:CGFloat = 	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

let screenBound:CGRect = UIScreen.mainScreen().bounds
//是否为iphone4
let IS_IPHONE_4:Bool = fabs(Double( CGRectGetHeight(screenBound)) - Double(480))   < DBL_EPSILON


//是否为iphone5
let IS_IPHONE_5:Bool = fabs(Double( CGRectGetHeight(screenBound)) - Double(568))   < DBL_EPSILON


//是否为iphone6
let IS_IPHONE_6:Bool = fabs(Double( CGRectGetHeight(screenBound)) - Double(667))   < DBL_EPSILON

//是否为iphone6Plus
let IS_IPHONE_6PLUS:Bool = fabs(Double( CGRectGetHeight(screenBound)) - Double(736))   < DBL_EPSILON

//获取屏幕宽度
let KScreenHeight:CGFloat = UIScreen.mainScreen().bounds.size.height
//获取屏幕高度
let KScreenWidth :CGFloat = UIScreen.mainScreen().bounds.size.width

let KScreenWidthScale = KScreenWidth / 320.0
let KScreenHeightScale = KScreenHeight / 480.0

//导航栏 + 状态栏高度
let KNavTopH:CGFloat =  64

let KBorderH:CGFloat =  10

let KBGColor:UIColor = UIColor(white: 0.957, alpha: 1.0)

func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor { return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }


/**
*  绘图 相关 1像素
*/
let DEF_SINGLE_LINE_WIDTH           = (1 / UIScreen.mainScreen().scale)
let DEF_SINGLE_LINE_ADJUST_OFFSET   = ((1 / UIScreen.mainScreen().scale) / 2)


//let Data_Status = [[NSString stringWithFormat:@"%@",resultsDictionary[@"status"]] isEqualToString:@"0"]

//let DEF_LoginCheck if (![SaveUserInfo isLogin]) {    [[[UIApplication sharedApplication].keyWindow rootViewController] performSegueWithIdentifier:@"login" sender:nil]; return;}

//let DEF_LoginCheckAdd(action) if (![SaveUserInfo isLogin]) {    [[[UIApplication sharedApplication].keyWindow rootViewController] performSegueWithIdentifier:@"login" sender:nil]; (action); return;}


//let JSON_Data_Status [[BaseModel alloc]initWithString:json error:nil].status

//let Data_Fail [wself showUIAlertView:@"网络连接失败!"];//网络连接失败


//MARK: - 横屏
// 以640*1136 为准 5.5--750*1334  4.7--1242*2208  4--640*1136 3.5-- 640*960
/*
let DEF_Scale_Width     = (UIView.getScaleSize().width)
let DEF_Scale_Height    = (UIView.getScaleSize().height)

func DEF_IPhone_Scale_Width(x:CGFloat)->CGFloat  { return ((x)*DEF_Scale_Width)}
func DEF_IPhone_Scale_Height(x:CGFloat)->CGFloat { return ((x)*DEF_Scale_Height)}

//let DEF_CGRectMake(x,y,w,h) CGRectMake(DEF_IPhone_Scale_Width(x),DEF_IPhone_Scale_Height(y),DEF_IPhone_Scale_Width(w),DEF_IPhone_Scale_Height(h))



let DEF_Fit_ScaleWidth = (KScreenWidth/320.0)
let DEF_Fit_ScaleHeight = (KScreenHeight/568.0)

func DEF_CGRectMake(x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat)->CGRect {
    return CGRectMake(DEF_Fit_ScaleWidth*(x),DEF_Fit_ScaleHeight*(y),DEF_Fit_ScaleWidth*(w),DEF_Fit_ScaleHeight*(h))
}

func DEF_CGRectMake_Nav(x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat)->CGRect{
    return CGRectMake(DEF_Fit_ScaleWidth*(x),DEF_Fit_ScaleHeight*(y-64),DEF_Fit_ScaleWidth*(w),DEF_Fit_ScaleHeight*(h))
}
*/

let DEF_BackImage = "backIcon"
let DEF_BACKTITLE = "6" // Fill 267.png

let DEF_PlaceHolderImg = "45"/*< 占位符 */

let DEF_EMPTY_IMG:UIImage = UIImage(named: "wuwu")!// imageNamed:@"wuwu"]

let DEF_layerColor = RGBA(0.7961, g: 0.7961, b: 0.7961, a: 1.0) //) [UIColor colorWithRed:0.7961 green:0.7961 blue:0.7961 alpha:1.0]//边框颜色

//MARK: - 测试相关配置

//let DEF_KEY_TEST_UI = "UI" //纯UI测试模式
let DEF_KEY_TEST_UI2 = "UI" //方便手写联想用


//MARK: - 配置信息

let accountOrPassWordError = "账号或密码错误，请重新输入"
let codeError = "推荐码无效"
let phoneCheckError = "手机号格式错误，请重新填写"
let checkCodeError = "验证码错误，请重新输入"
let Error = "请正确填写您的身份证号码"
let infoError = "请完整填写您的信息"



//MARK: - 常用方法
func textSizeWithFont(text:String ,font:UIFont)->CGSize {
    return text.characters.count > 0 ? (text as NSString).sizeWithAttributes([NSFontAttributeName:font]) : CGSizeZero
}





