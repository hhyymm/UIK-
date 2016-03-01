//
//  BaseTF.swift
//  ChaiMiYouYan
//
//  Created by Avon Xu on 16/2/2.
//  Copyright © 2016年 Avon Xu. All rights reserved.
//

import UIKit

//let DEF_TextField_Text_Begain:CGFloat = 56
//textBegain_OrgainX
@IBDesignable
class BaseTF: UITextField {
    
    
    @IBInspectable var textBegain_OrgainX: CGFloat = 56
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self .setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self .setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setup() ->Void
    {
        self.textBegain_OrgainX = 10;
    }
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
        //if self.leftView! .isKindOfClass(UIImageView)
        //{
            //let imgV = self.rightView as! UIImageView
            //imgV.contentMode = .ScaleAspectFit
        //}
        //else
        //{
            //return super.rightViewRectForBounds(bounds);
        //}
        
        return CGRectMake(bounds.width - 36, 0, 16, bounds.height)
        
    }

    override func textRectForBounds(bounds: CGRect) -> CGRect {
        var textRect = super.textRectForBounds(bounds)
        textRect.origin.x   += textBegain_OrgainX
        textRect.size.width -= textBegain_OrgainX
        return textRect
        
        if (self.rightView != nil)
        {
            return CGRectMake(textBegain_OrgainX  , 0, bounds.size.width - textBegain_OrgainX - 36, bounds.size.height);
        }
        else
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX, bounds.size.height);
        }

    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        var textRect = super.textRectForBounds(bounds)
        textRect.origin.x   += textBegain_OrgainX
        textRect.size.width -= textBegain_OrgainX
        return textRect
        
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
        var textRect = super.textRectForBounds(bounds)
        textRect.origin.x   += textBegain_OrgainX
        textRect.size.width -= textBegain_OrgainX
        return textRect
        
        if (self.rightView != nil)
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX - 36, bounds.size.height);
        }
        else
        {
            return CGRectMake(textBegain_OrgainX, 0, bounds.size.width - textBegain_OrgainX, bounds.size.height);
        }
    }

    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
