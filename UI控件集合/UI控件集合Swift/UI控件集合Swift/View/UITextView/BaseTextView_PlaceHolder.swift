//
//  BaseTextView_PlaceHolder.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/19.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
class BaseTextView_PlaceHolder: BaseTextView {
    
    @IBInspectable var placeHolder:String!{
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var placeHolderTextColor:UIColor?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    //MARK: -  Text view overrides
    override var text: String!{
        didSet{
            setNeedsDisplay()
        }
    }
    override var attributedText: NSAttributedString!{
        didSet{
            setNeedsDisplay()
        }
    }

    //- (void)setContentInset:(UIEdgeInsets)contentInset {
    //    [super setContentInset:contentInset];
    //    [self setNeedsDisplay];
    //}
    override var font: UIFont?{
        didSet{
            setNeedsDisplay()
        }
    }
    override var textAlignment: NSTextAlignment{ // default is NSLeftTextAlignment
        didSet{
            setNeedsDisplay()
        }
    }

    //MARK: - Notifications
    func didReceiveTextDidChangeNotification(notification:NSNotification){
        setNeedsDisplay()
    }
    
    //MARK: -Life cycle
    func setup(){
        NSNotificationCenter.defaultCenter() .addObserver(self, selector: Selector("didReceiveTextDidChangeNotification:"), name: UITextViewTextDidChangeNotification, object: self)
    
        placeHolderTextColor = UIColor.lightGrayColor()
    
        self.autoresizingMask = .FlexibleWidth;
        self.scrollIndicatorInsets = UIEdgeInsetsMake(10.0, 0.0, 10.0, 8.0)
        self.contentInset = UIEdgeInsetsZero
        self.scrollEnabled = true
        self.scrollsToTop = false
        self.userInteractionEnabled = true
        self.font = UIFont.systemFontOfSize(16.0)
        self.textColor = UIColor.blackColor()
        self.keyboardAppearance = UIKeyboardAppearance.Default
        self.keyboardType = UIKeyboardType.Default
        self.returnKeyType = UIReturnKeyType.Default
        self.textAlignment = NSTextAlignment.Left
        self.clearsContextBeforeDrawing = true
        self.textContainerInset=UIEdgeInsetsMake(7, 7, 7, 7)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?){
        super.init(frame: frame, textContainer: textContainer)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    deinit{
        placeHolder = nil
        placeHolderTextColor = nil
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidChangeNotification, object: self)
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        if ((self.text.characters.count == 0) && (self.placeHolder != nil)) {
            
            let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()

            paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
            paragraphStyle.alignment = self.textAlignment

            let attributes:[String :AnyObject] = [NSFontAttributeName:self.font!,NSForegroundColorAttributeName : self.placeHolderTextColor!,NSParagraphStyleAttributeName :paragraphStyle]
            
            var placeHolderRect = (self.placeHolder as NSString).boundingRectWithSize(CGSizeMake(rect.size.width, CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil)
            
            placeHolderRect.origin = CGPointMake(10.0, 7.0)
            
            self.placeHolderTextColor?.set()
        
            (self.placeHolder as NSString).drawInRect(placeHolderRect, withAttributes: attributes)
//            (self.placeHolder as NSString).drawAtPoint(placeHolderRect.origin, withAttributes: attributes)
        }
    }

}
