//
//  main.m
//  对象
//
//  Created by lilin on 2020/6/14.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MYClass.h"
#import "ClassA.h"
#import "ClassB.h"
#import "MYConst.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MYClass* obj = [[MYClass alloc] init];
    
        NSLog(@"对象的内存地址：%p，对象name的属性值：%@",obj,obj.name);
        
        NSString* str = [NSString stringWithFormat:@"www.99ios.com"];
        if ([str isKindOfClass:[NSString class]]) {
            NSLog(@"str是NSString类型对象！");
        }
        
        //判断对象类型
        NSMutableString* mutableStr = [NSMutableString string];
        if ([mutableStr isKindOfClass:[NSString class]]) {
            NSLog(@"mutableStr是NSString类型对象");
        }
        
        //判断对象是否实现某方法
        MYClass* myClazz = [[MYClass alloc] init];
        
        if ([myClazz respondsToSelector:@selector(name)]) {
            NSLog(@"obj可以响应名称为name的消息！");
        }
        
        //判断字符串是否相等
        NSString* str1 = [NSString stringWithFormat:@"www.99ios.com"];
        NSString* str2 = @"九九学院";
        if ([str1 isEqual:str2]) {
            NSLog(@"str1等于str2");
        }else{
            NSLog(@"str1不等于str2");
        }
        
        if ([str1 isEqualToString:@"www.99ios.com"]) {
            NSLog(@"str1等于www.99ios.com");
        }
        
        //对象的赋值：深复制和浅复制
        NSString* str3 = [NSString stringWithFormat:@"www.99ios.com"];
        
        NSString *copyString = [str3 copy];
        
        NSLog(@"copy str3的值：%@",copyString);
        
        //局部变量:只属于某个方法
        
        MYClass* myClass = [[MYClass alloc] init];
        [myClass printLocalVariable];
        [myClass printLocalVariable];
        [myClass printLocalVariable];
        
        //内部全局变量
        [myClass printGloableVariable];
        [myClass printGloableVariable];
        [myClass printGloableVariable];
        
        //打印静态变量
        [myClass printStaticVariable];
        [myClass printStaticVariable];
        [myClass printStaticVariable];
        
        //ClassA中使用extern声明，可以访问MYClass中的全局变量
        ClassA* classA = [[ClassA alloc] init];
        [classA printExternVar];
        
        //ClassB中使用extern声明，访问MYClass中的全局变量
        ClassB* classB = [[ClassB alloc] init];
        [classB printExternVar];
        
        //同一个对象不同方法修改同一个静态变量时，该静态变量的值是累加的
        MYClass* object = [[MYClass alloc] init];
        
        [object testStaticValue1];
        
        [object testStaticValue2];
        
        [object testStaticValue1];
        
        [object testStaticValue2];
        
        NSLog(@"-----第一个MYClass对象中打印静态变量结果------");
        
        //不同对象修改同一个静态变量的值也是累加的
        MYClass* obj1 = [[MYClass alloc] init];
        [obj1 testStaticValue1];
        [obj1 testStaticValue2];
        [obj1 printStaticVariable];
        
        NSLog(@"-----第二个MYClass对象中打印静态变量结果------");
        
        MYClass* obj2 = [[MYClass alloc] init];
        [obj2 testStaticValue1];
        [obj2 testStaticValue2];
        [obj2 printStaticVariable];
        
        
        NSLog(@"-------const使用----------");
        NSLog(@"my const height:%d",height);
        NSLog(@"my const notification string:%@",launchSuccessNotification);
    }
    
    return 0;
}
