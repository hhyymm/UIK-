//
//  BaseTF_BottomLine.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
//BUG 0000001
//Failed to set (updateDisplisy) user defined inspected property on (WanChouJinRong.BaseTF_BottomLine): [<WanChouJinRong.BaseTF_BottomLine 0x7fb398f418f0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key updateDisplisy.

class BaseTF_BottomLine:BaseTF {
    @IBInspectable var bottomOffset:CGFloat = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var lineColor:UIColor = UIColor.clearColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var lineWidth:CGFloat = 1{
        didSet{
            setNeedsDisplay()
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var label:UILabel!{
        get{
            let label = self.valueForKeyPath("_placeholderLabel") as! UILabel
            return label
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
    }
}
