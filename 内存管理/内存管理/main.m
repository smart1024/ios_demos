//
//  main.m
//  内存管理
//
//  Created by lilin on 2020/6/8.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"

/**
 速记法：
 strong：自定义对象、控制器对象、如果不指定也是strong
 weak：代理对象、IBOulet使用weak
 assign：基本数据类型，如int float和NSInteger、CGFloat等
 copy：NSString、NSArray、NSDictionary及其可变子类、Block块推荐使用copy
 */
//strong、weak直接指向string地址所以地址一样，copy会在内存拷贝一个副本，所以地址不同
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString* string =[[NSMutableString alloc] initWithFormat:@"normal"];
        ClassA* classA = [[ClassA alloc] init];
        classA.name = string;
        classA.strongName = string;
        classA.weakName = string;
        NSLog(@"string:%@ address: %p",string,string);
        
        NSLog(@"copy Property:%@ address: %p",classA.name,classA.name);
        
        NSLog(@"strong Property:%@ address: %p",classA.strongName,classA.strongName);
        
        NSLog(@"weak Property:%@ address: %p",classA.weakName, classA.weakName);
    }
    return 0;
}
