//
//  HHBaseSegMent.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/19.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit
let DEF_HHBaseSegMent_Tag = 1000

protocol HHBaseSegmentDelegate :NSObjectProtocol{
    func segMent(segment:HHBaseSegMent ,didSelectIndex index:NSInteger)
}

@IBDesignable
class HHBaseSegMent: UIView {
    
    @IBInspectable internal var seletedColor:UIColor?
        {
        didSet{
//            setNeedsDisplay()
            self.setUp()
        }
    }
    @IBInspectable internal var unSeletedColor:UIColor?{
        didSet{
//            setNeedsDisplay()
            self.setUp()
        }
    }

    @IBInspectable internal var hasBootLine:Bool = true {
        didSet{
            if hasBootLine {
                self.addSubview(self.lineView)
            }else{
                self.lineView .removeFromSuperview()
            }
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable internal var bottomLineFull:Bool = false {
        didSet{
            self.setNeedsLayout()
        }
    }

    weak internal var delegate: HHBaseSegmentDelegate?
    // 标题数组
    var titleArr:[String] = [] {
        didSet{
            layoutUI()
        }
    }
    
    deinit{
        self.delegate = nil
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.backgroundColor = UIColor.whiteColor()
    }
    
    //
    var selectedIndex:NSInteger! = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    // 底部边线
    lazy var lineView :UIView = {
        let lineView_:UIView = UIView()
        return lineView_
    }()
    
    // 按钮数组
    var btnArr:NSMutableArray = NSMutableArray()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    func setUp(){
        if self.titleArr.count == 0
        {
            self.titleArr = ["item1","item2"]
        }
    }
    // 代码指定初始化
    class func segMentWithTitleArr(titleArr:[String]! , frame:CGRect)->HHBaseSegMent
    {
        let segment = HHBaseSegMent(frame: frame)
        segment.titleArr = titleArr
        return segment
    }
    
    override func layoutSubviews() {
        let k_width = self.width() / CGFloat(self.titleArr.count)
        
        for ( var i = 0; i < btnArr.count; i++) {
            let button:UIButton = btnArr[i] as! UIButton
            button.frame = CGRectMake( k_width * CGFloat(i) ,0,k_width,self.height())
        }
        if hasBootLine {
            
            insertSubview(lineView, atIndex: 0)
            
            self.lineView.backgroundColor = seletedColor
            self.lineView.frame = CGRectMake(k_width*CGFloat(selectedIndex),self.height()-2,k_width,2)
            
            var lineHeight:CGFloat = 2.0
            
            if self.bottomLineFull {
                lineHeight = self.height()
            }
            self.lineView.frame = CGRectMake(k_width*CGFloat(selectedIndex), self.height() - lineHeight ,k_width, lineHeight)
            
        }else{
            self.lineView .removeFromSuperview()
        }
    }//DEF_MainColor
    
    //
    func layoutUI(){
        for subview :UIView in self.subviews{
            subview .removeFromSuperview()
        }
        self.btnArr .removeAllObjects()
    
        for (var i = 0; i < self.titleArr.count ; i++) {
            let button:UIButton = UIButton(type: UIButtonType.Custom)
            button.backgroundColor = UIColor.clearColor()
            button.setTitle(self.titleArr[i], forState: .Normal)
            button.setTitleColor(unSeletedColor, forState: .Normal)
            button.setTitleColor(seletedColor,   forState: .Selected)
            button.titleLabel?.font = UIFont.systemFontOfSize(15)
            button .addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
            button.tag = i + DEF_HHBaseSegMent_Tag
            if (i == selectedIndex) {
                button.selected = true
                button.backgroundColor = UIColor.clearColor()
                lineView.backgroundColor = seletedColor
            }
            if self.bottomLineFull {
                button .setTitleColor(UIColor.whiteColor(), forState: .Selected)
            }
            self .addSubview(button)
            self.btnArr .addObject(button)
        }
    }
    
    //上方button切换
    func buttonClick(sender : UIButton ) -> Void {
        let temBtn:UIButton = btnArr[selectedIndex] as! UIButton
        if (sender == temBtn) {
            return
        }
//        sender.backgroundColor = UIColor.clearColor()
        UIView.animateWithDuration(0.20) { () -> Void in
            temBtn.selected = false
//            temBtn.backgroundColor = UIColor.clearColor()
            sender.selected = true
            if self.bottomLineFull {
                sender .setTitleColor(UIColor.whiteColor(), forState: .Selected)
            }
            var lineHeight:CGFloat = 2.0
            
            if self.bottomLineFull {
                lineHeight = self.height()
            }
            self.lineView.frame = CGRectMake(sender.left(), sender.bottom() - lineHeight ,sender.width(), lineHeight)
            
        }
        self.selectedIndex = sender.tag - DEF_HHBaseSegMent_Tag
        if ( self.delegate != nil /*&& self.delegate!.respondsToSelector(Selector("segMent:didSelectIdex:"))*/) {
            self.delegate?.segMent(self, didSelectIndex: self.selectedIndex)
        }
    }
    
    
    func setTheIndex(index:NSInteger , animation:Bool)//设置当前显示的index
    {
        if index < btnArr.count {
            let temBtn:UIButton = self.btnArr[selectedIndex] as! UIButton
            self.selectedIndex = index
            let selectBtn:UIButton = self.btnArr[index] as! UIButton
            if animation{
                UIView.animateWithDuration(0.3) { () -> Void in
                    temBtn.selected = false
                    temBtn.backgroundColor = UIColor.clearColor()
                    
                    selectBtn.selected = true
                    selectBtn.backgroundColor = self.seletedColor
                    if self.bottomLineFull {
                        selectBtn .setTitleColor(UIColor.whiteColor(), forState: .Selected)
                    }
                    var lineHeight:CGFloat = 2.0
                    
                    if self.bottomLineFull {
                        lineHeight = self.height()
                    }
                    self.lineView.frame = CGRectMake(selectBtn.left(), selectBtn.bottom() - lineHeight ,selectBtn.width(), lineHeight)

                }
            }else{
                temBtn.selected = false
                temBtn.backgroundColor = UIColor.clearColor()
                
                selectBtn.selected = true
                //selectBtn.backgroundColor = self.seletedColor
                if self.bottomLineFull {
                    selectBtn .setTitleColor(UIColor.whiteColor(), forState: .Selected)
                }
                var lineHeight:CGFloat = 2.0
                
                if self.bottomLineFull {
                    lineHeight = self.height()
                }
                self.lineView.frame = CGRectMake(selectBtn.left(), selectBtn.bottom() - lineHeight ,selectBtn.width(), lineHeight)
            }
        }

    }
    
    override func drawRect(rect: CGRect) {
        
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()!
        
        self.seletedColor?.set()
//        RGBA(114, g: 143, b: 142, a: 1.0).set()
        
        let path:CGMutablePathRef = CGPathCreateMutable()
        CGContextSetLineWidth(ctx, DEF_SINGLE_LINE_WIDTH)
        CGPathMoveToPoint(path, nil, 0, self.height()-DEF_SINGLE_LINE_ADJUST_OFFSET);
        CGPathAddLineToPoint(path, nil, self.width(), self.height()-DEF_SINGLE_LINE_ADJUST_OFFSET)
        CGContextAddPath(ctx, path)
    
        CGContextStrokePath(ctx)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}