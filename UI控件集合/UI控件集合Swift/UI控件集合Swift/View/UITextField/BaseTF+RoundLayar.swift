//
//  BaseTF+RoundLayar.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

class BaseTF_RoundLayar: BaseTF {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        
    }
    
    
    override func setup() ->Void
    {
        self.setCornerRadius(5.0, color: UIColor.clearColor(), cWidth: 1.0)
        self.layer.masksToBounds = true
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
