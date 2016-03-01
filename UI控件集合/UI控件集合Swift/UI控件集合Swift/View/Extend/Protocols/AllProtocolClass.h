//
//  AllProtocolClass.h
//  WanChouJinRong
//
//  Created by 阳模何 on 16/1/20.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <objc/objc.h>
@protocol ReachabilityNotic <NSObject>
- (void)addReachabilityNotic;
- (void)reachabilityChanged:(NSNotification* )note;
@end

//- (void)startRealTimeNetworkStatus
//{
//    // 开启网络状况的监听
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(reachabilityChanged:)
//                                                 name:kReachabilityChangedNotification
//                                               object:nil];
//    self.reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
//    [self.reachability startNotifier];
//}
//
//- (void)reachabilityChanged:(NSNotification* )note
//{
//    Reachability *curReach  = [note object];
//    NetworkStatus status    = [curReach currentReachabilityStatus];
//    
//    NSLog(@"网络状态值: %ld", (long)status);
//    
//    // 根据网络状态值，在这里做你想做的事
//    // ...
//}

#import <Foundation/Foundation.h>

@interface AllProtocolClass : NSObject

@end
