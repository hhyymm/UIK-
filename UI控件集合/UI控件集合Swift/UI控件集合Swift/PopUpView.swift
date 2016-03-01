//
//  PopUpView.swift
//  UI控件集合Swift
//
//  Created by 阳模何 on 16/3/1.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//
/**
*  @author HYM, 16-03-01 10:15:06
*  更新 swift 2.0
*  V2.3 更新转屏操作
*  V2.3.1 位置调整
*/

import UIKit
import AddressBook
extension UIView {
    func alightToView(view:UIView){
        self.translatesAutoresizingMaskIntoConstraints = false

        self.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        let leading = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0)
        let trailing = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0)
        self.addConstraints([top,bottom,leading,trailing])
    }
}


public enum PopUpViewAnimation :Int {
    case None = 0
    case TransForm
    case ShowFromBottom
    case ShowFromLeft
    case ShowFromRight
    case ShowBegainTop
}

protocol PopUpViewDelegate :NSObjectProtocol{
    func popViewDidDismiss(popView:PopUpView)->Void
}

class PopUpView:UIView,UIGestureRecognizerDelegate{
    var _animation:PopUpViewAnimation = .None
    var delegate:PopUpViewDelegate?
    var customFrame:Bool = false /*< 自定义contentView 的frame  (位置)*/
    var offset:UIEdgeInsets = UIEdgeInsetsZero // 目测用CGPoint 就可以了
    var isFullScreen:Bool = false /*< 是否全屏 */
    
    var canDisMiss:Bool = true
    
    var boxFrame:CGRect?
    
    private var contentView:UIView?
    
    static let sharedInstance = PopUpView()
    override private init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func dealWithXibView(view:UIView,size:CGSize)->UIView{
//        let width = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: size.width)
//        let height = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: size.height)
//        view .addConstraints([width,height])
        let fixView = UIView()
        fixView.backgroundColor = UIColor.clearColor()
        fixView .addSubview(view)
        fixView.frame = CGRectMake(0, 0, size.width, size.height)
        view.translatesAutoresizingMaskIntoConstraints = true
        view.frame = CGRectMake(0, 0, size.width, size.height)
        view.autoresizingMask = [.FlexibleLeftMargin,.FlexibleRightMargin,.FlexibleTopMargin,.FlexibleBottomMargin]
        fixView .setNeedsLayout()
        fixView .layoutIfNeeded()
        return fixView
    }
    
    
    internal class func showWithContentView(cView:UIView,delegate:PopUpViewDelegate)->PopUpView{
        let popUpView:PopUpView = PopUpView.sharedInstance
        popUpView .showWithContentView(cView, animation: .ShowFromBottom)
        popUpView.delegate = delegate
        return popUpView
    }

    
    
    internal class func showWithContentView(cView:UIView , animation:PopUpViewAnimation ,delegate:PopUpViewDelegate)->PopUpView{
        let popUpView:PopUpView = PopUpView.sharedInstance
        popUpView .showWithContentView(cView, animation: animation)
        popUpView.delegate = delegate
        return popUpView
    }
    
    private func showWithContentView(cView:UIView , animation:PopUpViewAnimation,delegate:PopUpViewDelegate)->Void{
        let popUpView:PopUpView = PopUpView.sharedInstance
        popUpView .showWithContentView(cView, animation: animation, delegate: delegate)
        popUpView.delegate = delegate
    }

    private func showWithContentView(cView:UIView , animation:PopUpViewAnimation)->Void{
        self.backgroundColor = UIColor.colorWithHex(0x000000, alpha: 0.2)
        for theView in self.subviews{
            theView.removeFromSuperview()
        }
        _animation = animation
        self.contentView = cView
        
        var window = UIApplication.sharedApplication().keyWindow
        if (window == nil){
            window = UIApplication.sharedApplication().windows.first
        }
        let topView:UIView = (window?.subviews.first )!
        let topViewBounds = topView.bounds
        
        if (!customFrame)
        {
            contentView!.center = window!.center// topView.center;
        }
        else
        {
        //        _contentView.frame = _boxFrame;
        //_contentView 自定义位置
        }

        self.addSubview(contentView!)
        
        self.frame = topViewBounds
        self.setNeedsDisplay()
        
        window?.addSubview(self)
        let tap :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("tapped:"))
        tap.delegate = self
        self.addGestureRecognizer(tap)
        
        self.userInteractionEnabled = true
        self.alpha = 0.0
        
        let _screenWidth:CGFloat  = CGRectGetWidth (self.frame);
        let _screenHeight:CGFloat = CGRectGetHeight(self.frame);

        switch _animation {
        case .TransForm:
            self.alpha = 0.0
            self.contentView!.transform = CGAffineTransformMakeScale(0.1, 0.1)
            UIView.animateWithDuration(0.2, animations: {[unowned self] () -> Void in
                self.alpha = 1.0
                self.contentView!.transform = CGAffineTransformMakeScale(1.05, 1.05);
                }, completion: { (finished:Bool) -> Void in
                    UIView.animateWithDuration(0.2, animations: {[unowned self] () -> Void in
                        self.alpha = 1.0
                        self.contentView!.transform = CGAffineTransformMakeScale(1, 1)
                        }, completion: { (finished:Bool) -> Void in
                            
                    })

            })
            break
        case .ShowFromBottom:
            self.contentView?.center = CGPointMake(_screenWidth/2 - offset.left+offset.right , _screenHeight - offset.bottom + offset.top)
            
            UIView.animateWithDuration(0.2, animations: {[unowned self] () -> Void in
                self.alpha = 1.0
                self.contentView!.center = CGPointMake(_screenWidth/2 - self.offset.left + self.offset.right , _screenHeight - self.contentView!.frame.size.height/2.0 - self.offset.bottom + self.offset.top);

                }, completion: { (finished:Bool) -> Void in
                    
            })
            break
        default:
            self.alpha = 1.0
            break
        }
    }
    //MARK: - User Interaction
    @objc func tapped(tap:UITapGestureRecognizer){
        let point = tap .locationInView(self.contentView)
        var found:Bool = false
        if !found && CGRectContainsPoint(contentView!.bounds, point){
            found = true
        }
        if !found && canDisMiss{
            self.dismiss()
        }
    }

    func dismiss()->Void{
        let _screenWidth:CGFloat  = CGRectGetWidth (self.frame);
        let _screenHeight:CGFloat = CGRectGetHeight(self.frame);
        
        switch _animation {
        case .TransForm:
            UIView.animateWithDuration(0.2, animations: { () -> Void in

                self.alpha = 0.1
                self.contentView!.transform = CGAffineTransformMakeScale(0.1, 0.1)

                }, completion: { (finished:Bool) -> Void in
                    self.contentView!.removeFromSuperview()
                    
                    self.removeFromSuperview()
                    if(self.delegate != nil && self.delegate!.respondsToSelector(Selector("popViewDidDismiss:"))){
                        self.delegate?.popViewDidDismiss(self)
                    }

            })
            break

        case .ShowFromBottom:
            self.contentView?.center = CGPointMake(_screenWidth/2 - offset.left+offset.right , _screenHeight - offset.bottom + offset.top)
            
            UIView.animateWithDuration(0.2, animations: {[unowned self] () -> Void in
                self.alpha = 0.1
                self.contentView!.center = CGPointMake(_screenWidth/2 - self.offset.left + self.offset.right , _screenHeight + self.contentView!.frame.size.height/2)
                
                }, completion: { (finished:Bool) -> Void in
                    self.contentView!.removeFromSuperview()
                    
                    self.removeFromSuperview()
                    if(self.delegate != nil && self.delegate!.respondsToSelector(Selector("popViewDidDismiss:"))){
                        self.delegate?.popViewDidDismiss(self)
                    }
            })
            break

        default:
            self.alpha = 1.0
            self.contentView!.removeFromSuperview()
            self.removeFromSuperview()
            if(self.delegate != nil && self.delegate!.respondsToSelector(Selector("popViewDidDismiss:"))){
                self.delegate?.popViewDidDismiss(self)
            }

            break
        }
        /**
        *  @author HYM, 15-02-26 19:02:35
        *
        *  重置
        */
        _animation = .None
        self.customFrame = false
        self.offset = UIEdgeInsetsZero
        self.isFullScreen = false
        self.boxFrame = CGRectZero
    }
    
    deinit{
        self.contentView = nil
        self.delegate = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = (UIApplication.sharedApplication().keyWindow?.bounds)!
        let _screenWidth  = CGRectGetWidth (self.frame);
        let _screenHeight = CGRectGetHeight(self.frame);
        switch (_animation) {
        case .TransForm:
            self.contentView!.center = CGPointMake(_screenWidth/2 - self.offset.left + self.offset.right , _screenHeight/2.0  - self.offset.bottom + self.offset.top);
        case .ShowFromBottom:
            self.contentView!.center = CGPointMake(_screenWidth/2 - self.offset.left + self.offset.right , _screenHeight - contentView!.frame.size.height/2.0 - self.offset.bottom + self.offset.top);
        default:
            self.alpha = 1.0
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
