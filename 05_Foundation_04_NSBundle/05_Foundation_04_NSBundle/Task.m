//
//  Task.m
//  05_Foundation_04_NSBundle
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Task.h"

@implementation Task

//2、设置Block的回调时机

- (void)beginTaskWithCallbackBlock:(void (^)(void))callbackBlock{
    NSLog(@"任务开始，3秒后调用block中的代码！现在时间是:%@",[NSDate date]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callbackBlock();
    });
}

@end
