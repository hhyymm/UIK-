//
//  BaseActionSheet.swift
//  UI控件集合Swift
//
//  Created by 阳模何 on 16/3/1.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

typealias BaseActionSheetCallBack = (index:Int)->Void
class BaseActionSheet: UIView {
    let bottomSpace:CGFloat = 1//上下间隙
    var titleArr:[String]! = [String](){
        didSet{
            layOutUI()
        }
    }
    var btnArr:[UIButton] = [UIButton]()
    
    var allHeight:CGFloat = 0
    
    var callBack:BaseActionSheetCallBack?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        fatalError("cann't initWithFrame")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layOutUI(){
        for view in self.subviews{
            view.removeFromSuperview()
        }
        btnArr.removeAll()
        //        var fixSpace:CGFloat = 0
        for var i:Int = 0 ; i<titleArr.count ; i++ {
            let button = UIButton(type: .Custom)
            button.backgroundColor = UIColor.whiteColor()
            button .setTitleColor(UIColor.blackColor(), forState: .Normal)
            button .setTitle(titleArr[i], forState: .Normal)
            button .addTarget(self, action: Selector("acctionSheetIndex:"), forControlEvents: .TouchUpInside)
            self .addSubview(button)
            button.tag = i
            btnArr.append(button)
            /*
            if i == btnArr.count - 1{
            fixSpace = 6.0
            }
            button.frame = CGRectMake(0, bottomSpace+CGFloat(41 * i) + fixSpace, self.frame.width, 40)
            button.autoresizingMask = [.FlexibleLeftMargin,.FlexibleRightMargin,.FlexibleTopMargin,.FlexibleHeight]
            */
        }
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.backgroundColor = UIColor.colorWithHex(0xEAEAEA, alpha: 1.0)
    }
    func acctionSheetIndex(sender:UIButton){
        if (self.callBack != nil) {
            self.callBack!(index: sender.tag)
        }
        self.dismiss()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var fixSpace:CGFloat = 0
        for var i:Int = 0 ; i < btnArr.count ; i++ {
            let button = btnArr[i]
            if i == btnArr.count - 1{
                fixSpace = 6.0
            }
            button.frame = CGRectMake(0,bottomSpace + CGFloat(41 * i) + fixSpace, self.frame.width, 40)
        }
    }
    
    deinit{
        
    }
    
    class func showWithTitleArr(titleArr:[String],var view:UIView?,callBack:BaseActionSheetCallBack?)->Void{
        
        if (view == nil) {
            view = UIApplication.sharedApplication().keyWindow
        }
        let viewHeight = view?.height()
        
        let me = BaseActionSheet()
        me.titleArr = titleArr
        me.callBack = callBack
        me.allHeight = CGFloat(titleArr.count * 40) + CGFloat(me.bottomSpace*2) + 6
        
        me.bounds = CGRectMake(0, 0, view!.width(),me.allHeight)
        
        let contentFrame = CGRectMake(0, 0, view!.width(), view!.height())
        let contentView = BaseActionSheetContentView(frame: contentFrame, contentView: me) {[unowned me] (contetView:UIView) -> Void in
            
            me.dismiss()
            
            UIView.animateWithDuration(0.2, animations: {() -> Void in
                me.frame = CGRectMake(0, viewHeight!, view!.width(), me.allHeight)
                contetView.alpha = 0.3
                }) { (finished:Bool) -> Void in
                    contetView.removeFromSuperview()
                    me.removeFromSuperview()
            }
        }
        contentView.alpha = 0.3
        view!.addSubview(contentView)
        
        me.frame = CGRectMake(0, viewHeight! , view!.width(), me.allHeight)
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            me.frame = CGRectMake(0, viewHeight! - me.allHeight, view!.width(), me.allHeight)
            contentView.alpha = 1.0
            }) { (finished:Bool) -> Void in
                
        }
    }
    
    func dismiss(){
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            var rect = self.frame
            rect.origin = CGPoint(x: rect.origin.x,y: rect.origin.y + rect.height)
            self.frame = rect
            
            }) { (finished:Bool) -> Void in
                
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let ctf = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(ctf, UIColor.colorWithHex(0xEAEAEA, alpha: 1.0).CGColor)
        CGContextSetLineWidth(ctf, DEF_SINGLE_LINE_WIDTH)
        for var i:Int = 0 ; i < btnArr.count + 1; i++ {
            let Y:CGFloat = bottomSpace + CGFloat(40 * i) + DEF_SINGLE_LINE_ADJUST_OFFSET
            CGContextMoveToPoint(ctf, 0, Y)
            CGContextAddLineToPoint(ctf, self.width(), Y)
        }
        CGContextStrokePath(ctf)
    }
}

typealias DisMissAction = (view:UIView)->Void
class BaseActionSheetContentView :UIView{
    
    var disMiss:DisMissAction?
    var contentView:UIView?
    init(frame:CGRect,contentView:UIView?,disMissAction:DisMissAction?) {
        super.init(frame: frame)
        self.contentView = contentView
        self.disMiss = disMissAction
        self.addSubview(self.contentView!)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.backgroundColor = UIColor.colorWithHex(0x000000, alpha: 0.3)
    }
    
    //MARK: - User Interaction
    @objc func tapped(tap:UITapGestureRecognizer){
        let point = tap .locationInView(self.contentView)
        var found:Bool = false
        if !found && CGRectContainsPoint(contentView!.bounds, point){
            found = true
        }
        if !found && self.disMiss != nil {
            self.disMiss!(view: self)
        }
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        var found:Bool = false
        var subview:UIView?
        for view in self.subviews{
            if view.frame .contains(point){
                subview = view
                found = true
                break //return view
            }
        }
        
        if found && self.disMiss != nil {
            //            self.disMiss!(view: self)
            let view = super.hitTest(point, withEvent: event)
            return view
            //            if subview!.respondsToSelector(Selector("disMiss")){
            //                subview?.performSelector(Selector("disMiss"))
            //            }
        }
        self.disMiss!(view: self)
        return self
    }
}