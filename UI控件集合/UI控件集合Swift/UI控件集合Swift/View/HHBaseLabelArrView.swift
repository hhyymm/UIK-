//
//  HHBaseLabelArrView.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/24.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

public struct HHBaseLabelInfo {
    public var title: String
    public var titleColor: UIColor?
    public var maxWidth: CGFloat
    public init(){
        self.title = ""
        self.titleColor = UIColor.darkGrayColor()
        self.maxWidth = 0
    }
    public init(title: String, titleColor: UIColor? ,maxWidth:CGFloat){
        self.title = title
        if titleColor != nil {
            self.titleColor = titleColor
        }
        self.maxWidth = maxWidth
    }
}

class HHBaseLabelArrView: UIView {
    
    var itemArr:[HHBaseLabelInfo] = [HHBaseLabelInfo](){
        didSet{
            layoutUI()
        }
    }
    
    var itemWidthArr:[NSNumber] = [NSNumber]()
    
    internal var maxWidth:CGFloat = 0
//    // 标题数组
//    var titleArr:[String] = [] {
//        didSet{
//            layoutUI()
//        }
//    }
//    var titleColorArr:[UIColor] = [] {
//        didSet{
//            layoutUI()
//        }
//    }
//    
//    var fixWidth:CGFloat =  2.0

//    override func didMoveToSuperview() {
//        super.didMoveToSuperview()
//        self.backgroundColor = UIColor.whiteColor()
//    }
    
    
    // 按钮数组
    var labelArr:NSMutableArray = NSMutableArray()
    
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
        if self.itemArr.count == 0
        {
            self.itemArr = [HHBaseLabelInfo(title: "测试", titleColor: UIColor.darkGrayColor(), maxWidth: 80)]
        }
    }
    // 代码指定初始化
    class func labelsWithItemArr(itemArr:[HHBaseLabelInfo]! , frame:CGRect)->HHBaseLabelArrView
    {
        let segment = HHBaseLabelArrView(frame: frame)
        segment.itemArr = itemArr
        return segment
    }
    
    override func layoutSubviews() {
        
        var offSetX:CGFloat = 0.0
        itemWidthArr .removeAll()
        for ( var i = 0; i < labelArr.count; i++) {
            
            let info:HHBaseLabelInfo = itemArr[i]
            
            let label:UILabel = labelArr[i] as! UILabel
            /*label .sizeToFit()
            let size:CGSize = label.frame.size
            */
            label.frame = CGRectMake( offSetX ,0,info.maxWidth,self.height())

            itemWidthArr.append(NSNumber(float:Float(label.width())))
            offSetX += label.width()
        }
        self.maxWidth = offSetX + 0.0
    }
    
    //
    func layoutUI(){
        for subview :UIView in self.subviews{
            subview .removeFromSuperview()
        }
        self.labelArr.removeAllObjects()
        
        for (var i = 0; i < self.itemArr.count ; i++) {
            let info:HHBaseLabelInfo = itemArr[i]
            let label:UILabel = UILabel()
            label.textAlignment = .Center
            label.backgroundColor = UIColor.clearColor()
            label.textColor = info.titleColor
            label.text = info.title
            label.font = UIFont.systemFontOfSize(15)
            self .addSubview(label)
            self.labelArr .addObject(label)
        }
    }
    
//    override func drawRect(rect: CGRect) {
//        
//        let ctx:CGContextRef = UIGraphicsGetCurrentContext()!
//        
//        self.seletedColor?.set()
//        //        RGBA(114, g: 143, b: 142, a: 1.0).set()
//        
//        let path:CGMutablePathRef = CGPathCreateMutable()
//        CGContextSetLineWidth(ctx, DEF_SINGLE_LINE_WIDTH)
//        CGPathMoveToPoint(path, nil, 0, self.height()-DEF_SINGLE_LINE_ADJUST_OFFSET);
//        CGPathAddLineToPoint(path, nil, self.width(), self.height()-DEF_SINGLE_LINE_ADJUST_OFFSET)
//        CGContextAddPath(ctx, path)
//        
//        CGContextStrokePath(ctx)
//    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */


}
