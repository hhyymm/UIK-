//
//  HH_HorizontalAlignButton.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/24.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

class HH_HorizontalAlignButton: HorizontalAlignButton {

    override func updateContentOffset(){
        gap = 10
        let size    = self.bounds.size
        let width   = size.width
        let imgSize = self.imageView?.image?.size
        let imgWidth = imgSize?.width
   
        var imgLeft:CGFloat = 0
        var titleLeft:CGFloat = 0
        
        // 计算left偏移量
        imgLeft = width - imgWidth!
        titleLeft = -imgWidth!
        
        self.imageEdgeInsets = UIEdgeInsetsMake(0, imgLeft - gap, 0, -imgLeft + gap)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, titleLeft + gap, 0, -titleLeft - gap)
        
    }
    
}
