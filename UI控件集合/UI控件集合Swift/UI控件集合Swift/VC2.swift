//
//  VC2.swift
//  UI控件集合Swift
//
//  Created by 阳模何 on 16/3/11.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

//import Cocoa
import UIKit

class VC2: UIViewController,PopUpViewDelegate{
    @IBAction func testActionSheet(sender: AnyObject) {
        let actionSheet = BaseActionSheet(frame: CGRectMake(0,0,KScreenWidth,60))
        actionSheet.titleArr = ["拍照","从相册选择","取消"]
//        actionSheet.
//        PopUpView.showWithContentView(actionSheet, delegate: self)
        let titleArr = ["拍照","从相册选择","取消"]
        BaseActionSheet.showWithTitleArr(titleArr, view: self.view) { (index) -> Void in
            print(index)
        }
        
    }
    
    func popViewDidDismiss(popView: PopUpView) {
        
    }

}
