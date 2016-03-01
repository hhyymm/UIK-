//
//  ThirdLoginView.swift
//  ChaiMiYouYan
//
//  Created by Avon Xu on 16/2/3.
//  Copyright © 2016年 Avon Xu. All rights reserved.
//

import UIKit
public enum ShareBtnType : Int {
    
    case QQ = 0

    case weixin
    
    case sina

}

typealias ShareAction = (index:ShareBtnType)->Void
//typealias ThirdLoginAction(index:int) ->vo

class ShareView: UIView {

//    @IBOutlet var view: UIView!
    @IBOutlet weak var qqBtn: UIButton!// tag = 0
    @IBOutlet weak var weixinBtn: UIButton!//tag = 1
    @IBOutlet weak var sinaBtn: UIButton!////tag = 2
    
    var thirdLoginAction:ShareAction!
    
    
    @IBAction func action(sender: UIButton) {
        switch sender.tag
        {
        case 0:
         if (thirdLoginAction != nil)
            {
            thirdLoginAction(index: .QQ)
            }
            
        case 1:
            if (thirdLoginAction != nil)
            {
                thirdLoginAction(index: .weixin)
            }
            
        case 2:
            if (thirdLoginAction != nil)
            {
                thirdLoginAction(index: .sina)
            }


           
            
        default:
            break
        
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//         NSBundle .mainBundle() .loadNibNamed( getName(self.classForCoder), owner: self, options: nil)
//           self .addViewConstraints(self.view)

        
        
    }
    
    
    func setup() ->Void
    {
        //self.qqBtn .setCutRoundedButton(self.qqBtn.width()/2, color: UIColor .lightGrayColor())
        //self.weixinBtn .setCutRoundedButton(self.weixinBtn.width()/2, color: UIColor .lightGrayColor())
        //self.sinaBtn .setCutRoundedButton(self.sinaBtn.width()/2, color: UIColor .lightGrayColor())
        

    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
