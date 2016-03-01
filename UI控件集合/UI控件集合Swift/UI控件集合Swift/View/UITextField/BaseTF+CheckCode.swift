//
//  BaseTF+CheckCode.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
class BaseTF_CheckCode: BaseTF_RoundLayar {
    
    //MARK: - 左边视图
    override func leftViewRectForBounds(bounds: CGRect) -> CGRect {
        if self.leftView! .isKindOfClass(UIImageView)
        {
            let imgV = self.leftView as! UIImageView
            imgV.contentMode = .ScaleAspectFit
        }
        else
        {
            return super.leftViewRectForBounds(bounds);
        }
        
        return CGRectMake(20, 0, 16, bounds.height)
        
    }
    
    //MARK: - 右边视图
    override func rightViewRectForBounds(bounds: CGRect) -> CGRect {
        
        
        if self.rightView! .isKindOfClass(UIButton)
        {
            let btn = self.rightView as! UIButton
            btn.contentMode = .ScaleAspectFit
            btn .sizeToFit()
            
            return CGRectMake(bounds.width - btn.width() - 20, 0, btn.width() + 20, bounds.height)

        } else {
            return super.rightViewRectForBounds(bounds);
        }
        
//        return CGRectMake(bounds.width - 36, 0, bounds.height, bounds.height)
        
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        if (self.rightView != nil)
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX - 36, bounds.size.height);
        }
        else
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX, bounds.size.height);
        }
        
    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        if (self.rightView != nil)
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX - 36, bounds.size.height);
        }
        else
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX, bounds.size.height);
        }
        
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        if (self.rightView != nil)
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX - 36, bounds.size.height);
        }
        else
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX, bounds.size.height);
        }
    }
    
}
