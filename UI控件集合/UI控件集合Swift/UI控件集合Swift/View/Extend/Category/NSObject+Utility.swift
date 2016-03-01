//
//  NSObject+Utility.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/3.
//  Copyright © 2016年 heyangmu. All rights reserved.
//

import UIKit

extension NSObject{
//    class func className() -> String {
//        let classString = NSStringFromClass(self.classForCoder())
//        let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
//        return classString.substringFromIndex(range!.endIndex)
//    }
    
    
    class func className(classType:AnyClass) -> String {
        let classString = NSStringFromClass(classType)
        let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
        return classString.substringFromIndex(range!.endIndex)
    }
}
