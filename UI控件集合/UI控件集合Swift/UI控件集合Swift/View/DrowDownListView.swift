//
//  DrowDownListView.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/22.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

protocol DrowDownListViewDelegate :NSObjectProtocol{
    func dropDownListView(sender :DrowDownListView ,withIndex index:NSInteger , str:NSString);
}

//typealias CountDownBlock = (id:AnyObject, countDown:NSInteger)->Void
private let sharedDrowDownListView = DrowDownListView()

class DrowDownListView : UIView ,UITableViewDelegate,UITableViewDataSource {
    
    weak internal var delegate: DrowDownListViewDelegate?
    var selectedindex:NSInteger = 0
    
//    static let sharedInstance = DrowDownListView()
//    private init() {
//    } //This prevents others from using the default '()' initializer for this class.
    lazy private var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.setCornerRadius(4.0, color: UIColor.clearColor(), cWidth: 0.0)
        tableView.layer.masksToBounds = true
        tableView.separatorStyle = .None
        tableView.separatorColor = UIColor.grayColor()
        tableView.userInteractionEnabled = true
        tableView.allowsSelection = true
        tableView .registerClass(DrowDownListViewCell.classForCoder())
        return tableView
    }()
    private var dataSourceArray:NSMutableArray = NSMutableArray()
    private var btnSender:UIView!

    class var sharedInstance: DrowDownListView {
        
        return sharedDrowDownListView
    }
    
    
    func setUp()
    {
        self.backgroundColor = UIColor(white: 0.000, alpha: 0.000)
        self.userInteractionEnabled = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.setCornerRadius(4.0, color: UIColor.clearColor(), cWidth: 0.0)
        self.tableView.layer.masksToBounds = true
        self.tableView.separatorStyle = .None
        self.tableView.separatorColor = UIColor.grayColor()
        self.tableView.userInteractionEnabled = true
        self.tableView.allowsSelection = true
        //self.tableView .registerClass(DrowDownListViewCell.classForCoder())
        
    }
    
    func showFromView(view:UIView ,height:CGFloat ,dataSource:NSArray ,theDelegate:DrowDownListViewDelegate){
        
        self.backgroundColor = UIColor(white: 0.000, alpha: 0.000)
        self.userInteractionEnabled = true
        
        self.btnSender = view
        self.delegate = theDelegate
        
        let keyWindow = UIApplication.sharedApplication().keyWindow
        self.frame = (keyWindow?.bounds)!
        keyWindow?.addSubview(self)
        self .addSubview(self.tableView)
        
        let btnFrame:CGRect = self .convertRect(self.btnSender.frame, fromView: self.btnSender.superview)
        self.tableView.frame = CGRectMake(btnFrame.origin.x, btnFrame.origin.y+btnFrame.size.height, btnFrame.size.width, 0);
        
        let hei:CGFloat = keyWindow!.height() - self.tableView.top()
        self.dataSourceArray .removeAllObjects()
        self.dataSourceArray .addObjectsFromArray(dataSource as [AnyObject])
        self.tableView.reloadData()
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            if (height>hei) {
                self.tableView.frame = CGRectMake(btnFrame.origin.x, btnFrame.origin.y+btnFrame.size.height, btnFrame.size.width, hei - 20)
            }else{
                self.tableView.frame = CGRectMake(btnFrame.origin.x, btnFrame.origin.y+btnFrame.size.height, btnFrame.size.width, height);
            }
        })
    }
    
    func dismiss()->Void{
        
        let btnFrame = self .convertRect(self.btnSender.frame, fromView: self.btnSender.superview)
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.tableView.frame = CGRectMake(btnFrame.origin.x, btnFrame.origin.y+btnFrame.size.height, btnFrame.size.width, 0);

        } ,completion:{ (finish:Bool) -> Void in
            
            self .removeFromSuperview()
        })
    }
    
    
    
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:DrowDownListViewCell = tableView.dequeueReusableCellWithIdentifier("DrowDownListViewCell", forIndexPath: indexPath) as! DrowDownListViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let theCell:DrowDownListViewCell = cell as! DrowDownListViewCell
        theCell .setCornerRadius(5.0, color: UIColor.clearColor(), cWidth: 0.0)
        theCell.titleStr = dataSourceArray.objectAtIndex(indexPath.row) as! String
        if self.selectedindex == indexPath.row {
            theCell.setSelected(true, animated: true)
        }
    }
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.dismiss()
        self.selectedindex = indexPath.row
        if (self.delegate != nil) {
            self.delegate?.dropDownListView(self, withIndex: self.selectedindex, str: self.dataSourceArray[indexPath.row] as! NSString)
        }
    }
  
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let point2:CGPoint = self.convertPoint(point, toView: self.tableView)
        if CGRectContainsPoint(tableView.bounds, point2)
        {
            return self.tableView
        }else{
            self.dismiss()
        }
        return self
    }
}

//MARK: - DrowDownListViewCell
class DrowDownListViewCell:UITableViewCell {
    var titleStr:String! = ""{
        didSet{
            setNeedsDisplay()
        }
    }
    
//    override var selected: Bool {
//        didSet{
//            if selected {
//                self.color = UIColor.colorWithHex(0x439AFF, alpha: 1.0)
//            }else{
//                self.color = UIColor.blackColor()
//            }
//            setNeedsDisplay()
//        }
//    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
        if selected {
            self.color = UIColor.colorWithHex(0x439AFF, alpha: 1.0)
        }else{
            self.color = UIColor.blackColor()
        }
        setNeedsDisplay()
    }
    
    var color:UIColor! = UIColor.blackColor()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        self.clearsContextBeforeDrawing = true
        for view:UIView in self.subviews {
            view .removeFromSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        
    //    [super drawRect:rect];
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
    
    
        CGContextSetLineWidth(context, 0.5);
        CGContextSetStrokeColorWithColor(context, UIColor(white: 0.635, alpha: 1.0).CGColor)
        CGContextMoveToPoint(context, 0, CGRectGetHeight(rect)-0.5)
        CGContextAddLineToPoint(context, CGRectGetWidth(rect), CGRectGetHeight(rect)-0.5)
        CGContextStrokePath(context)
        
        UIColor.blackColor().setStroke()
        let style:NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.Center
        style.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        let size:CGSize = (self.titleStr as NSString) .sizeWithAttributes([NSForegroundColorAttributeName:UIColor.blackColor(),NSFontAttributeName:UIFont.systemFontOfSize(18.0),NSParagraphStyleAttributeName:style])
        let frame = CGRectMake(0, (CGRectGetHeight(rect) - size.height)/2.0, CGRectGetWidth(rect), size.height)
        (self.titleStr as NSString).drawInRect(frame, withAttributes: [NSForegroundColorAttributeName:color,NSFontAttributeName:UIFont.systemFontOfSize(18.0),NSParagraphStyleAttributeName:style])
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
