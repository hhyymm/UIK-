//
//  BottomLineBtn.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
class BottomLineBtn: BaseBtn {
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
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var label:UILabel?{
        get{
            let label = self.titleLabel
            return label
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let textRect = self.label!.textRectForBounds(self.label!.frame, limitedToNumberOfLines: 1)
        
        let offset = self.label!.bottom() - (self.label!.height() - textRect.height)/2.0
        
        let b = UIBezierPath()
        
        lineColor .set()
        b.moveToPoint(CGPointMake(0 + textRect.origin.x, /*.height*/ ceil(offset) - bottomOffset - DEF_SINGLE_LINE_ADJUST_OFFSET))
        
        b .addLineToPoint(CGPointMake(0 + textRect.origin.x + textRect.width, /*rect.height*/ceil (offset) - bottomOffset - DEF_SINGLE_LINE_ADJUST_OFFSET))
        b.lineWidth = lineWidth * DEF_SINGLE_LINE_WIDTH
        b .stroke();
    }
}
