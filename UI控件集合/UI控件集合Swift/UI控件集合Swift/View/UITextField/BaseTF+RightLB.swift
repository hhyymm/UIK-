//
//  BaseTF_rightLB.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/24.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit
@IBDesignable
class BaseTF_RightLB: UITextField {
    
    @IBInspectable var rightText:String = ""{
        didSet{
            self.rightLB.text = rightText
            setNeedsLayout()
        }
    }
    
    var rightLB:UILabel = UILabel()
    var lineView:UIView = UIView()

    var rightWidth:CGFloat{
        get{
            self.rightLB .sizeToFit()
            let size = self.rightLB .frame.size
            return size.width + 4 * 2 + 3 * 2
        }
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
        self.setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() ->Void
    {
//        self.textBegain_OrgainX = 10;
        self.addSubview(self.lineView)
        self.addSubview(self.rightLB)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let rect = CGRectMake(bounds.width - rightWidth + 3*2, 0, rightWidth - 3*2, bounds.height)
        self.rightLB.frame = rect
        self.lineView.frame = CGRectMake(self.rightLB.left()-2.0, 5, 0.5, self.height() - 10)
        self.lineView.backgroundColor = DEF_TextField_Color

//        setNeedsDisplay()
    }
    //MARK: - 左边视图
    //MARK: - 右边视图
    override func rightViewRectForBounds(bounds: CGRect) -> CGRect {
        let width = self.rightWidth
        return CGRectMake(bounds.width - width, 0, width, bounds.height)
        
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        var textRect = super.textRectForBounds(bounds)
        textRect.size.width -= self.rightWidth
        return textRect
        
    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        var rect = super.placeholderRectForBounds(bounds)
        rect.size.width -= self.rightWidth
        return rect
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        var rect = super.editingRectForBounds(bounds)
        rect.size.width -= self.rightWidth
        return rect
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
    }
}
