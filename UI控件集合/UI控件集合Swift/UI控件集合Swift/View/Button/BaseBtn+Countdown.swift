//
//  CountdownBtn.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit
import Dispatch

typealias CountDownBlock = (id:AnyObject, countDown:NSInteger)->Void

extension BaseBtn {
    
    func startWithBegainBlock(begainBlock:CountDownBlock,endBlock:CountDownBlock,var timeout:NSInteger){
        
        let queue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        if ( _timer != nil)
        {
            dispatch_source_cancel(_timer);
        }
//        else{
//            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
//        }
        self._timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)

        dispatch_source_set_timer(_timer!,dispatch_walltime(nil, 0),1 * NSEC_PER_SEC, 0); //每秒执行
        dispatch_source_set_event_handler(_timer!) {[weak self] () -> Void in
            if (self != nil) {
                if timeout <= 0{
                    
                    dispatch_source_cancel(self!._timer!);
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        if (self != nil) {
                            endBlock(id: self!,countDown: 0);
                        }
                    })
                    
                } else {
                    //int minutes = timeout / 60;
                    print("\(timeout)")
                    let seconds = timeout % 61;
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        if (self != nil) {
                            begainBlock(id: self!,countDown: seconds);
                        }
                    });
                    timeout--;
                }
            }
        }
        dispatch_resume(_timer!);
    }
}
