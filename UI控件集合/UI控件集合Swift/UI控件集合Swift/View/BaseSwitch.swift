//
//  BaseSwitch.swift
//  UI控件集合Swift
//
//  Created by 阳模何 on 16/2/26.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
class BaseSwitch: UIView {
    
    @IBInspectable var on:Bool = true{
        didSet{
            setNeedsLayout()
        }
    }
    
    @IBInspectable var animation:Bool = true
    @IBInspectable var onColor:UIColor = UIColor.colorWithHex(0x30C867, alpha: 1.0){
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var offColor:UIColor = UIColor.grayColor() {
        didSet{
            setNeedsDisplay()
        }
    }

    var theSwitch:UIView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func setUp(){
        self.addSubview(self.theSwitch)
        self.theSwitch.layer.masksToBounds = true
        self.theSwitch.layer.cornerRadius = 3.0
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 3.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if animation {
            UIView .animateWithDuration(0.20, animations: {[unowned self] () -> Void in
                self.layoutTheView()
            })
        }else{
            layoutTheView()
        }
    }
    
    func layoutTheView(){
        if !on {
            self.theSwitch.frame = CGRectMake(2, 2, self.width()/2.0 - 2, self.height() - 4.0)
            self.theSwitch.backgroundColor = onColor
            self.theSwitch.layer.borderColor = UIColor.clearColor().CGColor
        }else{
            self.theSwitch.frame = CGRectMake(self.width()/2.0, 2, self.width()/2.0 - 2, self.height() - 4.0)
            self.theSwitch.backgroundColor = offColor
            self.theSwitch.layer.borderColor = UIColor.colorWithHex(0xe6e6e6, alpha: 1.0).CGColor
        }

    }
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        self.on = !self.on
        return 
        
        if touches.count == 1 {
            let anytouch = touches.first
            let point:CGPoint = (anytouch?.locationInView(self))!
            let width = CGRectGetWidth(self.frame)/2.0
            
            let index = Int(floor(point.x / width))
            
            if index == 0 {
                self.on = false
            }else {
                self.on = true
            }
            /*
            if Int(index) <= 1 &&  Int(index) == theValue{
            self.theValue = (0 == Int(index)) ? 1:0
            }else{
            self.theValue = Int(index)
            }
            */
        }
    }

    

}
