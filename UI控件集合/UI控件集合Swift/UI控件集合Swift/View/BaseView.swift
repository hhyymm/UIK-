//
//  BaseView.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/23.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
class BaseView: UIView {
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            displayView()
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            displayView()
        }
    }

    @IBInspectable var borderColor:UIColor = UIColor.whiteColor(){
        didSet{
            displayView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        displayView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        displayView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        displayView()
    }
    
    func displayView() {
        self.setCornerRadius(cornerRadius, color: UIColor.clearColor(), cWidth: 0)
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
//        super.drawRect(rect)

        borderColor.setStroke()
        let b:UIBezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        b.lineWidth = borderWidth
        let point:UnsafePointer<CGFloat> = UnsafePointer([ 1.0,1.0])
        b.setLineDash(point, count: 2, phase: 0)
        b.stroke()

//        let context:CGContext = UIGraphicsGetCurrentContext()!
//        CGContextAddPath(context, b.CGPath)
//        CGContextSetLineWidth(context, borderWidth)
//        CGContextSetLineDash(context, 0, point, 2)
//        CGContextSetStrokeColorWithColor(context, borderColor.CGColor)
//        CGContextStrokePath(context)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    class func drawDashLine(lineView:UIView, lineLength:Int, lineSpacing:Int , lineColor:UIColor){
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        shapeLayer.bounds = lineView.bounds
        shapeLayer.position = CGPointMake(CGRectGetWidth(lineView.frame) / 2.0, CGRectGetHeight(lineView.frame))
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        //  设置虚线颜色为blackColor
        shapeLayer.strokeColor = lineColor.CGColor
        //  设置虚线宽度
        shapeLayer.lineWidth = CGRectGetHeight(lineView.frame)
        shapeLayer.lineJoin  = kCALineJoinRound
        //  设置线宽，线间距
        shapeLayer.lineDashPattern = [NSNumber(integer:lineLength) ,NSNumber(integer:lineLength)]
        //  设置路径
        let path:CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, CGRectGetWidth(lineView.frame), 0)
        shapeLayer.path = path
        CGPathCreateMutable()
//        CGPathRelease(path)
    //  把绘制好的虚线添加上来
        lineView.layer .addSublayer(shapeLayer)
    }
}
