//
//  main.m
//  内存管理
//
//  Created by lilin on 2020/6/8.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"
#import "MYClass.h"
#import "ClassB.h"
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
        
        //方法的普通调用
        NSString* str1 = [NSString stringWithFormat:@"九九学院"]; //类方法调用
        NSString* str2 = [NSString stringWithFormat:@"www.99ios.com"]; //类方法调用
        str1 = [str1 stringByAppendingString:str2]; //实例方法调用
        NSLog(@"str1 = %@",str1);
        //嵌套调用：避免大量局部变量存储临时结果
        NSString* str = [NSString stringWithFormat:@"九九学院"];
        str = [str stringByAppendingString:[NSString stringWithFormat:@"www.99ios.com"]];
        NSLog(@"str = %@",str);
        
        //调用父类方法：子类可以直接调用父类的方法
        ClassA* a = [[ClassA alloc] init];
        //copy方法最终调用 copyWithZone方法
        [a copy];
        
        //点语法
        MYClass* myClass = [[MYClass alloc] init]; //实例化对象
        myClass.name = @"MYClass"; //使用点语法赋值
        
        NSLog(@"class name is %@",myClass.name); //使用点语法赋值
        
        //消息处理机制：ocx消息是运行时才和方法绑定
        //消息机制的关键在于编译器为类和对象生成的结构
        /**
         实例对象的结构：
          1、指向父类的指针 isa
          2、类的方法列表
         
         当向某个对象发送消息时：
            1.首先根据isa指针能找到对象对应类的方法列表，继而找到具体方法实现
            当在本类方法列表中找不到时，会从该类的父类的指针去找父类的方法列表，知道NSObject根类
            2.将对象以及参数传递给找到方法实现
            3、执行方法体中代码，获取返回值
         */
        
        //方法的重写
        ClassA* clazzA = [[ClassA alloc] init];
        clazzA.website = @"www.99ios.com";
        
        [clazzA printWebSite];
        
        ClassB* clazzB = [[ClassB alloc] init];
        clazzB.website = @"www.99ios.com";
        [clazzB printWebSite];
    }
    return 0;
}
