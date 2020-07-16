//
//  ViewController.m
//  17_GCD实现延迟执行_03
//
//  Created by lilin on 2020/7/16.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GCD延迟执行的代码，在主队列中执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"延迟2.0秒后打印出来的日志！");
    });
    
    [self performSelector:@selector(printLog) withObject:nil afterDelay:3.0];
}

-(void) printLog{
    NSLog(@"延迟3.0秒后打印出来的日志！");
}

@end
