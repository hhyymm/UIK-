//
//  UIViewcategory.swift
//  ChaiMiYouYan
//
//  Created by Avon Xu on 16/2/2.
//  Copyright © 2016年 Avon Xu. All rights reserved.
//
import UIKit
import Foundation

func getName(classType:AnyClass) -> String {
    
    let classString = NSStringFromClass(classType)
    let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
    return classString.substringFromIndex(range!.endIndex)
}

extension UIView
{
//MARK: - 边框
    func setCornerRadius(cornerRadius:CGFloat,color:UIColor,cWidth:CGFloat) ->Void
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = cWidth;
        self.layer.borderColor = (color ?? UIColor .clearColor()).CGColor
        self.layer.masksToBounds = true
    }
//MARK: - 从xib加载
    class func loadFromNib() -> UIView?
    {
        return self.loadFromNib(named: getName(self))
    }
    
    class func loadFromNib(named nibName:String) -> UIView? {
        let nibContents = NSBundle.mainBundle().loadNibNamed(nibName,owner: nil, options: nil) as NSArray
        
        if let actualView = nibContents.lastObject as? UIView {
            return actualView
        }
        
        return nil
    }

    
    
    func left() ->CGFloat
    {
        return self.frame.origin.x;
    }
    
    func top() ->CGFloat
    {
        return self.frame.origin.y;
    }
    
    func right() ->CGFloat
    {
         return self.frame.origin.x + self.frame.size.width;
    }
    
    func bottom() ->CGFloat
    {
        return self.frame.origin.y + self.frame.size.height;

    }
    
    
    func width() ->CGFloat
    {
        return self.frame.size.width;
    }
    
    func height() ->CGFloat
    {
        return self.frame.size.height;
    }
    
    func setWidth(width:CGFloat) ->Void
    {
        var frame:CGRect = self.frame;
        frame.size = CGSizeMake(width,CGRectGetHeight(frame));
        self.frame = frame;

    }
    
    func setHeight(height:CGFloat) ->Void
    {
        var frame:CGRect = self.frame;
        frame.size = CGSizeMake(CGRectGetWidth(frame),height);
        self.frame = frame;
        
    }
    
    func setCenterX(x:CGFloat) ->Void
    {
        self.center = CGPointMake(x, self.center.y);
        
    }
    
    func setCenterY(y:CGFloat) ->Void
    {
        self.center = CGPointMake(self.center.x, y);
        
    }
    
    func setSize(size:CGSize) ->Void
    {
        var frame:CGRect = self.frame;
        frame.size = size;
        self.frame = frame;
        
    }
    
    func setOrigin(origin:CGPoint) ->Void
    {
        var frame:CGRect = self.frame;
        frame.origin = origin;
        self.frame = frame;

    }    
}


extension UIButton
{
//MARK: - 切圆角
    func setCutRoundedButton(cornerRadius:CGFloat,color:UIColor) ->Void
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = color.CGColor
        self.layer.masksToBounds = true;
    }
    
}