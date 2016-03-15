//
//  ViewController.swift
//  UI控件集合Swift
//
//  Created by 阳模何 on 16/2/26.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PopUpViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showPup(sender: AnyObject) {
        if ( a%2 == 0 ){

        let shareView:ShareView = ShareView.loadFromNib() as! ShareView
        shareView.backgroundColor = UIColor.lightGrayColor()
        PopUpView.sharedInstance.boxFrame = CGRectMake(0, 0, KScreenWidth, 100)
        let fixView = PopUpView.dealWithXibView(shareView, size: CGSizeMake(KScreenWidth, 140))
        PopUpView.showWithContentView(fixView, delegate: self)
        }else{
            let titleArr = ["男","女","取消"]
            BaseActionSheet.showWithTitleArr(titleArr, view: self.view, callBack: {(index) -> Void in
                print(titleArr[index])
                switch titleArr[index] {
                case titleArr[index]:
                     break
                default :
                    break
                }
            })
        }
    }
    var a:Int = 0
    @IBAction func show2(sender: AnyObject) {
        
        if ( a%2 == 0 ){
            let sexView:SexView = SexView.loadFromNib() as! SexView
            
            sexView.sexViewAction = {(index:SexViewBtnType) in
                print(index)
                PopUpView.sharedInstance.dismiss()
            }
            let fixView = PopUpView.dealWithXibView(sexView, size: CGSizeMake(300, 140))
            PopUpView.showWithContentView(fixView, animation:PopUpViewAnimation.ShowFromBottom, delegate: self)
        }else{
            let dateView:DateView = DateView.loadFromNib() as! DateView
            
            dateView.dateViewAction = {(currentDate:NSDate?,commit:Bool)->Void in
                print(currentDate)
                if commit {
                    
                }
                PopUpView.sharedInstance.dismiss()
            }
            let fixView = PopUpView.dealWithXibView(dateView, size: CGSizeMake(KScreenWidth, 216+44))
            PopUpView.showWithContentView(fixView, animation:PopUpViewAnimation.ShowFromBottom, delegate: self)

        }
        a++
    }
    func popViewDidDismiss(popView: PopUpView) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

