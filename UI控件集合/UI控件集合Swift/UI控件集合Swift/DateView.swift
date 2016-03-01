//
//  DateView.swift
//  UI控件集合Swift
//
//  Created by 阳模何 on 16/3/1.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//
//项目textField 边界颜色
//项目主绿色
let DEF_MainGreen_Color:UIColor = RGBA(104, g: 180, b: 63 ,a: 1.0)


import UIKit
typealias DateViewAction = (currentDate:NSDate?,commit:Bool)->Void
class DateView: UIView {

    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var commitBtn: UIButton!
    @IBOutlet weak var cancleBtn: UIButton!
    var dateViewAction:DateViewAction?
    var dateViewChangeAction:DateViewAction?

    @IBOutlet weak var topView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fatalError("使用loadFromNib加载")
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    func setup() ->Void
    {
        if (self.topView != nil){
            self.topView.backgroundColor = DEF_MainGreen_Color
        }
    }
    
    @IBAction func cancleAction(sender: AnyObject) {
        if dateViewAction != nil {
            self.dateViewAction!(currentDate: dataPicker.date, commit: false)
        }
    }
    @IBAction func commitAction(sender: AnyObject) {
        if dateViewAction != nil {
            self.dateViewAction!(currentDate: dataPicker.date, commit: true)
        }
    }
    @IBAction func DateChanged(sender: AnyObject) {
        print(dataPicker.date)
        if dateViewChangeAction != nil {
            self.dateViewChangeAction!(currentDate: dataPicker.date, commit: false)
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
