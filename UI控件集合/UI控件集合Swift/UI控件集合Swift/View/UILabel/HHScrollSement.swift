//
//  HHScrollSement.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/22.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

class HHScrollSement: HHBaseSegMent {
    
    var contentSC:UIScrollView = UIScrollView()
    var fixWidth:CGFloat =  12.0
    override func setUp(){
        addSubview(contentSC)
        if self.titleArr.count == 0
        {
            self.titleArr = ["item1","item2"]
        }
    }
    
    override func layoutSubviews() {
        self.contentSC.frame = CGRectMake(0, 0, self.width(), self.height())
        
        //let k_width = self.width() / CGFloat(self.titleArr.count)
        var offSetX:CGFloat = 0.0
        
        for ( var i = 0; i < btnArr.count; i++) {
            let button:UIButton = btnArr[i] as! UIButton
            button .sizeToFit()
            
            let btnSize:CGSize = button.frame.size
            
            button.frame = CGRectMake( offSetX ,0,btnSize.width + fixWidth,self.height())
            offSetX += button.width()
        }
        if hasBootLine {
            contentSC.addSubview(self.lineView)
            bringSubviewToFront(self.lineView)
            self.lineView.backgroundColor = seletedColor
            let button:UIButton = btnArr[selectedIndex] as! UIButton
            
            self.lineView.frame = CGRectMake(button.left(),self.height()-2,button.width(),2)
        }else{
            self.lineView .removeFromSuperview()
        }
        
        contentSC.contentSize = CGSizeMake(offSetX, 0)
    }//DEF_MainColor
    
    override func layoutUI(){
        super.layoutUI()
        self .addSubview(contentSC)
        for button in self.btnArr {
            self.contentSC .addSubview(button as! UIView)
        }
    }
}
