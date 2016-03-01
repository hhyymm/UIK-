//
//  BottomLineTF.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/3.
//  Copyright © 2016年 heyangmu. All rights reserved.
//

import UIKit
@IBDesignable
class BottomLineTF: UITextField {
    @IBInspectable var bottomOffset:CGFloat = 0{
        didSet{
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var lineColor:UIColor = UIColor.clearColor(){
        didSet{
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var lineWidth:CGFloat = 1{
        didSet{
            self.setNeedsDisplay()
        }
    }
//    var offset:UIEdgeInsets = UIEdgeInsetsZero{
//        didSet{
//            self.setNeedsDisplay()
//        }
//    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    var label:UILabel!{
        get{
            let label = self.valueForKeyPath("_placeholderLabel") as! UILabel
            return label
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let textRect = self.label.textRectForBounds(self.label.frame, limitedToNumberOfLines: 1)
        
        let offset = self.label.bottom() - (self.label.height() - textRect.height)/2.0
        
        let b = UIBezierPath()
        
        lineColor .set()
        b.moveToPoint(CGPointMake(0, /*.height*/ ceil(offset) - bottomOffset - DEF_SINGLE_LINE_ADJUST_OFFSET))
        
        b .addLineToPoint(CGPointMake(rect.width, /*rect.height*/ceil (offset) - bottomOffset - DEF_SINGLE_LINE_ADJUST_OFFSET))
        b.lineWidth = lineWidth * DEF_SINGLE_LINE_WIDTH
        b .stroke();
        
//        CGContextSetLineWidth(ref, DEF_SINGLE_LINE_WIDTH*UIScreen.mainScreen().scale);
//        CGContextMoveToPoint(ref, 0, rect.size.height - DEF_SINGLE_LINE_ADJUST_OFFSET);
//        CGContextAddLineToPoint(ref, rect.size.width,  rect.size.height - DEF_SINGLE_LINE_ADJUST_OFFSET);
//        CGContextSetStrokeColorWithColor(ref, lineColor.CGColor)
//        CGContextSetLineWidth(ref, 1.0)
//        CGContextMoveToPoint(ref, 0, rect.size.height - 1.0 - bottomOffset);
//        CGContextAddLineToPoint(ref, rect.size.width,  rect.size.height - 1.0 - bottomOffset);
    }
}
