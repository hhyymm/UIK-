//
//  BaseDashLineView.swift
//  UI控件集合Swift
//
//  Created by 阳模何 on 16/2/26.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
class BaseDashLineView: BaseLineView{
    
    @IBInspectable var showAtLeft :Bool = true{
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var showAtTop :Bool = true{
        didSet{
            setNeedsDisplay()
        }
    }

    override func drawRect(rect: CGRect) {
        self.clearsContextBeforeDrawing = true
        let width   = CGRectGetWidth(rect)
        let height  = CGRectGetHeight(rect)
        
        let lineDrawWidth = CGFloat(lineWidth) * DEF_SINGLE_LINE_WIDTH
        
        let offSet:CGFloat = (lineWidth % 2 == 0) ?CGFloat(0):DEF_SINGLE_LINE_ADJUST_OFFSET
        let pxOffset:CGFloat = CGFloat(floor( Float(lineWidth / 2))) * DEF_SINGLE_LINE_WIDTH
        
        var x:[CGFloat] = [0,0]
        var y:[CGFloat] = [0,0]
        
        if direction == .DirectionV {
            x[0] = showAtLeft ? offSet + pxOffset:(width - offSet - pxOffset)
            x[1] = showAtLeft ? offSet + pxOffset:(width - offSet - pxOffset)
            y[0] = 0
            y[1] = height

        }else {
            x[0] = 0
            x[1] = width
            
            y[0] = showAtTop ? offSet + pxOffset :(height - offSet - pxOffset)
            y[1] = showAtTop ? offSet + pxOffset :(height - offSet - pxOffset)
        }
        
        lineColor.setStroke()
        let dashPoint:UnsafePointer<CGFloat> = UnsafePointer([1.0,1.0])
        let b:UIBezierPath = UIBezierPath()
        b.lineWidth = lineDrawWidth
        b.setLineDash(dashPoint, count: 2, phase: 0)
        b.moveToPoint(CGPointMake(x[0], y[0]))
        b.addLineToPoint(CGPointMake(x[1], y[1]))
        b.stroke()        
    }
    

}
