//
//  main.m
//  06_浅复制和深复制_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"
#import "ClassB.h"
/**
 1、基本数据类型复制就是都会在内存创建一个副本
 2、对象类型复制：浅复制和深复制
 所以深浅复制是针对对象类型而言
 浅复制：内存中不会创建一个副本，仅仅将新指针指向原对象
 深复制:内存中会分配内存创建新的对象副本
 3、属性添加copy修饰，会执行深复制 同时需要遵守NSCopying协议.
    属性为strong或weak，会执行浅复制（只复制指针地址）
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //NSString copy为深复制，strong和weak均为浅复制
        NSMutableString* string = [[NSMutableString alloc] initWithFormat:@"www.99ios.com"];
        ClassA* classA = [[ClassA alloc] init];
        classA.name = string;
        
        //修改string，name不发生变化
        [string appendString:@"+"];
        
        NSLog(@"原字符串值：%@,内存地址：%p",string,string);
        
        NSLog(@"复制字符串值：%@，内存地址：%p",classA.name,classA.name);
        
        //NSString对象复制：不可变非容器类对象的复制
        
        NSLog(@"========================NSString 对象复制=====================");
        NSString* str = @"九九学院";
        
        //NSString copy为深复制
        NSString* str1 = [str copy]; // 会返回copyWithZone方法的返回结果
        
        NSString* str2 = [str mutableCopy]; //会返回mutableCopyWithZone方法返回的结果
        
        NSLog(@"对象类型:%@",[NSString class]);
        
        NSLog(@"原对象指向的存储地址：%p",str);
        
        NSLog(@"使用copy方法得到的对象存储地址:%p",str1);
        
        NSLog(@"使用mutable copy方法得到的对象存储地址:%p",str2);
        
        NSLog(@"结论：NSString类使用copy为浅复制,mutablecopy为深复制");
        
        NSLog(@"====================NSMutableString对象复制=============================");
        
        NSMutableString* mStr =  [NSMutableString stringWithFormat:@"九九学院"];
        //NSString copy为深复制
        NSMutableString* mStr1 = [mStr copy]; // 会返回copyWithZone方法的返回结果
        
        NSMutableString* mStr2 = [mStr mutableCopy];//会返回mutableCopyWithZone方法返回的结果
        
        NSLog(@"对象类型:%@",[NSMutableString class]);
        
        NSLog(@"原对象指向的存储地址：%p",mStr);
        
        NSLog(@"使用copy方法得到的对象存储地址:%p",mStr1);
        
        NSLog(@"使用mutable copy方法得到的对象存储地址:%p",mStr2);
        
        NSLog(@"结论：NSMutableString类使用copy、mutablecopy都为深复制");
        
        /**
         NSArray对象复制：容器类不可变对象复制：
         结论：NSArray类使用copy为浅复制，mutableCopy为深复制，容器内对象不论copy或mutableCopy都是浅复制
         */
        
        NSLog(@"====================NSArray对象复制==============================");
        NSString* str3 =@"九九学院";
        NSArray* array = [NSArray arrayWithObjects:str3, nil];
        
        NSArray* array1 = [array copy];
        NSArray* array2 = [array mutableCopy];
        NSLog(@"对象类型是:%@",[NSArray class]);
        
        NSLog(@"原对象指向的存储地址：%p",array);
        
        NSLog(@"使用copy方法得到的对象存储地址:%p",array1);
        
        NSLog(@"使用mutable copy方法得到的对象存储地址:%p",array2);
        
        NSLog(@"结论：NSArray类使用copy为浅复制、mutablecopy为深复制");
        
        NSLog(@"---------------------NSArray内容深浅复制情况-----------------");
        
        NSLog(@"原容器内对象存储地址为：%p",array[0]);
        
        NSLog(@"使用copy得到的容器内对象存储地址为：%p",array1[0]);
        
        NSLog(@"使用mutableCopy得到的容器内对象存储地址为：%p",array2[0]);
        
        NSLog(@"结论:NSArray类不论使用copy或mutableCopy内容对象都是浅复制");
        
        /**
        NSMutableArray对象复制：容器类可变对象复制：
        结论：NSMutableArray类使用copy、mutableCopy都为深复制，容器内对象不论copy或mutableCopy都是浅复制
        */
        NSLog(@"====================NSMutableArray对象复制==========================");
        NSMutableString* str4 = [NSMutableString stringWithFormat:@"九九学院"];
        NSMutableArray* mArray = [NSMutableArray arrayWithObjects:str4, nil];
        
        NSArray* mArray1 = [mArray copy];
        NSArray* mArray2 = [mArray mutableCopy];
        NSLog(@"对象类型是:%@",[NSMutableArray class]);
        
        NSLog(@"原对象指向的存储地址：%p",mArray);
        
        NSLog(@"使用copy方法得到的对象存储地址:%p",mArray1);
        
        NSLog(@"使用mutable copy方法得到的对象存储地址:%p",mArray2);
        
        NSLog(@"结论：NSMutableArray类使用copy、mutablecopy都为深复制");
        
        NSLog(@"---------------------NSMutableArray内容深浅复制情况-----------------");
        
        NSLog(@"原容器内对象存储地址为：%p",mArray[0]);
        
        NSLog(@"使用copy得到的容器内对象存储地址为：%p",mArray1[0]);
        
        NSLog(@"使用mutableCopy得到的容器内对象存储地址为：%p",mArray2[0]);
        
        NSLog(@"结论:NSMutableArray类不论使用copy或mutableCopy内容对象都是浅复制");
        
        
        /**
        NSDictionary对象复制：容器类可变对象复制：
        结论：NSDictionary类使用copy为浅复制、mutableCopy为深复制，容器内对象不论copy或mutableCopy都是浅复制
        */
        NSLog(@"====================NSDictionary对象复制==========================");
        
        NSString* webSite = @"www.99ios.com";
        NSDictionary* dict = @{
            @"wenSite":webSite
        };
        
        NSDictionary* dict1 = [dict copy];
        NSDictionary* dict2 = [dict mutableCopy];
        
        NSLog(@"对象类型是:%@",[NSDictionary class]);
        
        NSLog(@"原对象指向的存储地址：%p",dict);
        
        NSLog(@"使用copy方法得到的对象存储地址:%p",dict1);
        
        NSLog(@"使用mutable copy方法得到的对象存储地址:%p",dict2);
        
        NSLog(@"结论：NSMutableArray类使用copy为浅复制、mutablecopy为深复制");
        
        NSLog(@"---------------------NSDictionary内容深浅复制情况-----------------");
        
        NSLog(@"原容器内对象存储地址为：%p",dict[@"webSite"]);
        
        NSLog(@"使用copy得到的容器内对象存储地址为：%p",dict1[@"webSite"]);
        
        NSLog(@"使用mutableCopy得到的容器内对象存储地址为：%p",dict2[@"webSite"]);
        
        NSLog(@"结论:NSDictionary类不论使用copy或mutableCopy内容对象都是浅复制");
        
        /**
        NSMutableDictionary对象复制：容器类可变对象复制：
        结论：NSMutableDictionary类使用copy为浅复制、mutableCopy为深复制，容器内对象不论copy或mutableCopy都是浅复制
        */
        NSLog(@"====================NSMutableDictionary对象复制==========================");
        
        NSString* webSite1 = @"www.99ios.com";
        NSMutableDictionary* mDict = [NSMutableDictionary dictionary];
        [mDict setObject:webSite1 forKey:@"webSite"];
        
        NSMutableDictionary* mDict1 = [mDict copy];
        NSMutableDictionary* mDict2 = [mDict mutableCopy];
        
        NSLog(@"对象类型是:%@",[NSMutableDictionary class]);
        
        NSLog(@"原对象指向的存储地址：%p",mDict);
        
        NSLog(@"使用copy方法得到的对象存储地址:%p",mDict1);
        
        NSLog(@"使用mutable copy方法得到的对象存储地址:%p",mDict2);
        
        NSLog(@"结论：NSMutableDictionary类使用copy、mutablecopy都为深复制");
        
        NSLog(@"---------------------NSMutableDictionary内容深浅复制情况-----------------");
        
        NSLog(@"原容器内对象存储地址为：%p",mDict[@"webSite"]);
        
        NSLog(@"使用copy得到的容器内对象存储地址为：%p",mDict1[@"webSite"]);
        
        NSLog(@"使用mutableCopy得到的容器内对象存储地址为：%p",mDict2[@"webSite"]);
        
        NSLog(@"结论:NSMutableDictionary类不论使用copy或mutableCopy内容对象都是浅复制");
        
        /**
         自定对象的复制：
         1、遵守NSCopying协议，实现copyWithZone:方法
         2、对于自定义对象的复制特性(深浅复制)，取决于copyWithZone:方法
         3、对于类中定义的属性也要综合考虑其定义中的内存管理特性(strong/weak/copy/assign)
         */
        
        NSLog(@"===============自定义对象深浅复制代码验证==================");
        
        ClassA* a = [[ClassA alloc] init];
        
        ClassB* b = [[ClassB alloc] init];
        
        b.name = @"ABC";
        b.customClass = a;
        b.delegate = a;
        b.number = 100;
        
        ClassB* b1 = [b copy];
        
        NSLog(@"对象类：【 %@ 】原对象内存地址：【 %p 】，复制对象内存地址：【 %p 】",[ClassB class],b,b1);
        
        NSLog(@"【原对象】：copy属性-【 %p 】，strong属性-【 %p 】，weak属性-【 %p 】，assign属性-【 %d 】",b.name,b.customClass,b.delegate,b.number);
        
        
        NSLog(@"【复制对象】：copy属性-【 %p 】，strong属性-【 %p 】，weak属性-【 %p 】，assign属性-【 %d 】",b1.name,b1.customClass,b1.delegate,b1.number);
        
        
    }
    return 0;
}
