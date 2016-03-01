//
//  NSString+Utility.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/3.
//  Copyright © 2016年 heyangmu. All rights reserved.
//

import UIKit
import Foundation

extension NSString {
    // 获取文本高度
    func textSizeWithFont(font: UIFont!) -> CGSize {
        return self.sizeWithAttributes([NSFontAttributeName:font])
    }
    
    // 多行文本获取高度
    func multilineTextSizeWithFont(font:UIFont ,maxSize:CGSize)->CGSize{
        return self.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context:nil).size
    }
    
}
