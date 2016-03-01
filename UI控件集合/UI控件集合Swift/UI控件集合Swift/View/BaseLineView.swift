//
//  BaseLineView.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/24.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit
public enum BaseLineDirection : Int {
    case DirectionV = 0
    case DirectionH = 1
}

@IBDesignable
class BaseLineView: UIView {

    @IBInspectable var lineWidth:Int = 1 {// px
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var lineColor:UIColor! = UIColor.lightGrayColor() {// px
        didSet{
            setNeedsDisplay()
        }
    }

    var direction:BaseLineDirection! = .DirectionV
    @IBInspectable var directionV:Bool = true {
        didSet{
            if directionV {
                self.direction = .DirectionV
            }else{
                self.direction = .DirectionH
            }
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setNeedsDisplay()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setNeedsDisplay()
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let ctx = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor)
        CGContextSetLineWidth(ctx, CGFloat(lineWidth) * DEF_SINGLE_LINE_WIDTH)
        CGContextMoveToPoint(ctx, DEF_SINGLE_LINE_ADJUST_OFFSET, DEF_SINGLE_LINE_ADJUST_OFFSET)
        var point = CGPointMake(rect.width+DEF_SINGLE_LINE_ADJUST_OFFSET, DEF_SINGLE_LINE_ADJUST_OFFSET)
        if direction == .DirectionV {
            point = CGPointMake(DEF_SINGLE_LINE_ADJUST_OFFSET, rect.height+DEF_SINGLE_LINE_ADJUST_OFFSET)
        }
        CGContextAddLineToPoint(ctx, point.x, point.y)
        CGContextStrokePath(ctx)
    }

}
