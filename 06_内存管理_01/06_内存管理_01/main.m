//
//  main.m
//  06_内存管理_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 MRC(Manual Reference Counting):手动引用计数器
 ARC(Automatic Reference Counting):自动引用计数
 */
//TARGETS ->build phase ->compile resource -> 为main.m添加-fno-objc-arc编译标识
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject* obj1 = [[NSObject alloc] init];
        //retainCount:获取当前引用计数
        NSLog(@"obj1 当期引用计数：%lu",[obj1 retainCount]);
        //retain:引用计数+1
        NSObject* obj2 = [obj1 retain];
        NSLog(@"obj1 当期引用计数：%lu",[obj1 retainCount]);
        
        [obj2 release];
        
        NSLog(@"obj1 当期引用计数：%lu",[obj1 retainCount]);
        
        [obj1 release];

    }
    return 0;
}
