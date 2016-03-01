//
//  BaseBtn.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/5.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

class BaseBtn: UIButton {
    var _timer:dispatch_source_t!//计时器
    
    deinit
    {
        if (_timer != nil) {
            dispatch_source_cancel(_timer!);
        }
    }

}
