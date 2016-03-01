//
//  UIViewController+Utility.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/3.
//  Copyright © 2016年 heyangmu. All rights reserved.
//

import UIKit

extension UIViewController{
    /** 从xib初始化 */
    func initFromNib()->UIViewController
    {
        return UIViewController(nibName: NSObject.className(self.classForCoder), bundle: NSBundle.mainBundle())
    }
    class func loadFromStoryBoard(name:String)->UIViewController{
        let storyboard:UIStoryboard = UIStoryboard(name: name, bundle: NSBundle.mainBundle())
        var vc:UIViewController!
        var str = NSStringFromClass(self)
        str = NSObject.className(self.classForCoder())
        if (str.characters.count == 0) {
            //            vc = BaseNavVC.init()
        }
        else
        {
            vc = storyboard.instantiateViewControllerWithIdentifier(str) 
        }
        //        vc = storyboard.instantiateViewControllerWithIdentifier(NSStringFromClass(self)) as! BaseNavVC
        
        return vc;
    }

}
