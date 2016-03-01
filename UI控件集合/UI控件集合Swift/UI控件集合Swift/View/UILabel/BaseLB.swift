//
//  BaseLB.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
class BaseLB: UILabel {
    
    @IBInspectable var pading:CGFloat = 10{
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        super.drawTextInRect(CGRectMake(self.pading, 0, rect.width - self.pading*2, rect.height))
    }


}
