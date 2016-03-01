//
//  SexView.swift
//  UI控件集合Swift
//
//  Created by 阳模何 on 16/3/1.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit
public enum SexViewBtnType : Int {
    
    case Boy = 0
    
    case Girl
    
    case None
    
}

typealias SexViewAction = (index:SexViewBtnType)->Void
class SexView: UIView {

    @IBOutlet weak var boyBtn: UIButton!
    @IBOutlet weak var girlBtn: UIButton!
    @IBOutlet weak var cancleBtn: UIButton!
    var sexViewAction:SexViewAction!
    @IBAction func action(sender: UIButton) {
        switch sender.tag
        {
        case 0:
            if (sexViewAction != nil)
            {
                sexViewAction(index: .Boy)
            }
            
        case 1:
            if (sexViewAction != nil)
            {
                sexViewAction(index: .Girl)
            }
            
        case 2:
            if (sexViewAction != nil)
            {
                sexViewAction(index: .None)
            }

            
        default:
            break
            
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup() 
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        //         NSBundle .mainBundle() .loadNibNamed( getName(self.classForCoder), owner: self, options: nil)
        //           self .addViewConstraints(self.view)
        
        
        
    }
    func setup() ->Void
    {
        self.setCornerRadius(4.0, color: UIColor.clearColor(), cWidth: 0.0)
    }

    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        return super.hitTest(point, withEvent: event)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
