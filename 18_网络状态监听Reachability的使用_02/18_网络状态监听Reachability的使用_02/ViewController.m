//
//  ViewController.m
//  18_网络状态监听Reachability的使用_02
//
//  Created by lilin on 2020/7/18.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChange:) name:kReachabilityChangedNotification object:nil];
    //启动监测
    Reachability* reach = [Reachability reachabilityWithHostName:@"www.99ios.com"];
    [reach startNotifier];
}

-(void)networkChange:(NSNotification*)notification{
    Reachability* reach = (Reachability*) [notification object];
    NetworkStatus status = [reach currentReachabilityStatus];
    switch (status) {
        case ReachableViaWWAN:
            NSLog(@"正在使用3G/4G网络");
            break;
        case ReachableViaWiFi: //
            NSLog(@"正在使用WIFI");
            break;
        case NotReachable:
            NSLog(@"未知或无网络");
            break;
        default:
            break;
    }
    
}

@end
