//
//  main.m
//  07_NSLog_函数
//
//  Created by lilin on 2020/6/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
/**
 NSLog函数：定义在NSObjectCRuntime.h中
 1、print和NSLog都可以格式化输出
    print输入的格式化字符串是char*类型，NSlogs需要的字符串是NSString类型
 NSLog常用占位符：
 %@：对象
 %d,%i：整数
 等等
 
 2、NSLog可打印字符串、字典、数组等Foundation框架中已定义对象，自定义类型也可以使用%@打印，
    NSLog打印时编译器会自动调用对象的description属性的getter方法，如果打印类对象，则调用类方法
 
 */
//#define NSLog(FORMAT,...) fprintf(stderr,"%s:%d\t %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__,[[NSString stringWithFormat:FORMAT,##__VA_ARGS__] UTF8String]);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* p = [[Person alloc] init];
        p.name =@"jack";
        p.sex = @"man";
        p.age = 18;
        
        //底层调用p.description
        NSLog(@"%@",p);
        NSLog(@"%@",p.description);
        
        //类方法+description
        NSLog(@"%@",[[p class] description]);
        NSLog(@"%@",[Person description]);

    }
    return 0;
}
