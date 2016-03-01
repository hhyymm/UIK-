//
//  Hex.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/5.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit


extension UIColor {
    
    class func hexColor(hex:Int)->UIColor{
        return UIColor(red: CGFloat((hex>>24)&0xFF)/255.0, green: CGFloat((hex>>16)&0xFF)/255.0, blue: CGFloat((hex>>8)&0xFF)/255.0, alpha: CGFloat(hex & 0xFF )/255.0)
    }
    
    class func colorWithHex(hex:Int,alpha:CGFloat)->UIColor{
        return UIColor(red: CGFloat((hex>>16)&0xFF)/255.0, green: CGFloat((hex>>8)&0xFF)/255.0, blue: CGFloat(hex & 0xFF)/255.0, alpha: alpha)
    }
    
//    UIColor *uicolor = [UIColor redColor];
//    
//    CGColorRef color = [uicolor CGColor];
//    int numComponents = CGColorGetNumberOfComponents(color);
//    
//    if (numComponents >= 3)
//    {
//        const CGFloat *tmComponents = CGColorGetComponents(color);
//        red = tmComponents[0];
//        green = tmComponents[1];
//        blue = tmComponents[2];
//        alpha = tmComponents[3];
//    ｝
}