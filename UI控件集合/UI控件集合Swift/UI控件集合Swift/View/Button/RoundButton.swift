//
//  RoundButton.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/3.
//  Copyright © 2016年 heyangmu. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: BaseBtn {
    override init(frame: CGRect) {
        super.init(frame: frame)
        _settingView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _settingView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _settingView()

    }
    
    func _settingView(){
        self.setCornerRadius(5.0, color: UIColor.clearColor(), cWidth: 0)
    }

}
