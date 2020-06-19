//
//  main.m
//  04_Foundation框架
//
//  Created by lilin on 2020/6/19.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 1、框架是类、方法、函数、文档的按一定逻辑组织的集合
 2、Application kit框架用于macos桌面程序开发
 3、Cocoa：通常指Foundation框架、Application Kit框架、CoreData框架，针对macOS应用开发
 4、Cocoa Touch指Foundation框架、UIKit框架、CoreData框架，针对IOS移动设备
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"---------创建字符串对象----------");
        //stringWithFormat接收参数为NSString对象因此要@开头字符串
        NSString* string1 = [NSString stringWithFormat:@"www.99ios.com"];
        
        //stringWithUTF8参数为char*，字符串因此不需要@开头
        NSString* string2 = [NSString stringWithUTF8String:"九九学院"];
        
        NSLog(@"string1=%@",string1);
        NSLog(@"string2=%@",string2);
        
        NSLog(@"---------字符串比较----------");
        NSString* string3 =@"www.99ios.com";
        NSString* string4 =@"www.99ios.com";
        
        if ([string3 isEqualToString:string4]) {
            NSLog(@"string3与string4相等");
        }
        
        //判断字符串是否以给定字符串开头
        if ([string3 hasSuffix:@"com"]) {
            NSLog(@"string3以com结尾");
        }
        //判断字符串是否以给定字符串结尾
        if ([string3 hasPrefix:@"www"]) {
            NSLog(@"string3以www开头");
        }
        
        //从第4个字符开始截取到字符串末尾
        NSString* substring1 = [string4 substringFromIndex:4];
        
        //截取到第三个字符
        NSString* substring2 = [string4 substringToIndex:3];
        
        
        //NSRange底层是结构体，所以是基本数据类型，从第4位开始截取，长度为5
        NSRange range = NSMakeRange(4, 5);
        
        NSString* substring3 = [string4 substringWithRange:range];
        
        NSLog(@"substring1==%@",substring1);
        NSLog(@"substring2==%@",substring2);
        NSLog(@"substring3==%@",substring3);
        
        //求字符串长度
        NSLog(@"string4的长度为%ld",string4.length);
        
        //字符串转数字
        NSString* numberString =@"99";
        
        //NSInteger本质是long
        NSInteger number = [numberString integerValue];
        NSLog(@"number=%ld",number);
        
        NSLog(@"================可变字符串==========================");
        /*可变字符串*/
        //定义可变字符串并制定初始化初始长度
        
        //@“”是常量字符串
        NSMutableString* mString1 = [NSMutableString stringWithCapacity:100];
        NSMutableString* mString2 = [[NSMutableString alloc] initWithCapacity:100];
        NSMutableString* mString3 = [NSMutableString stringWithString:@"www.99ios.com"];
        
        //赋值
        [mString1 setString:@"www.99ios.com"];
        
        NSLog(@"%@",mString1);
        
        //拼接
        [mString1 appendString:@"九九学院"];
        
        NSLog(@"%@",mString1);
        
        //指定位置插入字符串
        [mString1 insertString:@"欢迎访问" atIndex:0];
        
        NSLog(@"%@",mString1);
        
        //字符串替换
        NSMutableString* mString4 = [NSMutableString stringWithString:@"www.99ios.com"];
        
        NSLog(@"原始值：%@",mString4);
        
        NSRange rang = NSMakeRange(4, 5);
        
        [mString4 replaceCharactersInRange:rang withString:@"apple"];
        
        //替换后
        NSLog(@"替换后：%@",mString4);
        
        //删除
        [mString4 deleteCharactersInRange:rang];
        
        NSLog(@"删除后%@",mString4);
        
        //连接两个字符串
        NSString* newString = [mString1 stringByAppendingString:mString2];
        NSLog(@"合并后的字符串：%@",newString);
        
        NSLog(@"=================End 字符串===============================");
        /**
         数组类：朱能保存对象类型，元素类型可以不同，不能直接保存基本数据类型
         1、NSArray：不可变数组（不可新增、不可修改）
         2、NSMutableArray：可变数组
         */
        
        //1、@[]方式创建数组
        NSArray* array1 = @[@123,@456,@789];
        //NSArray存储不同类型数据
        NSArray* array2 = @[@123,@456,@"789"];
        NSLog(@"array1==%@",array1);
        if ([array1[0] isKindOfClass:[NSNumber class]]) {
            NSLog(@"123是数字");
        }
        NSLog(@"array2==%@",array2);
        if ([array2[2] isKindOfClass:[NSString class]]) {
            NSLog(@"@789是字符串");
        }
        
        NSArray* array3 =@[@"tom",@"jerry",@"jobs"];
        NSLog(@"array3===%@",array3);
        
        //类方法
        NSArray* array4 = [NSArray arrayWithObjects:@"123",@456,@"789",nil];
        
        NSLog(@"array4===%@",array4);
        
        //实例方法 initWithObjects
        NSArray* array5 = [[NSArray alloc] initWithObjects:@"tom",@"jerry",@"jobs", nil];
        
        NSLog(@"array5==%@",array5);
        
        //数组的复制
        NSArray* copyArray = @[@123,@456,@789];
        
        //数组的复制将数组的地址赋值给新指针
        NSArray* copyArray1 = copyArray;
        
        //调用arrayWithArray方法属于深复制
        NSArray* copyArray2 = [NSArray arrayWithArray:copyArray];
        
        NSLog(@"原始数组地址：%p，指针复制数组地址：%p，深复制数组地址：%p",copyArray,copyArray1,copyArray2);
        
        //数组元素操作
        NSArray* array = @[@123,@456,@789];
        //根据下标访问数组中的元组
        
        NSNumber *num = array[0];
        NSLog(@"num:%@",num);
        
        id object = [array objectAtIndex:0];
        NSLog(@"object:%@",object);
        
        //获取某个对象的下标
        NSUInteger index = [array indexOfObject:@456];
        
        NSLog(@"对象456的下标为%lu",index);
        
        //判断某个对象是否在数组中
        if ([array containsObject:@123]) {
            NSLog(@"数组中包含123这个对象");
        }
        
        /**
         可变数组
         */
        //类方法array 初始化可变数组
        NSMutableArray* mArray1 = [NSMutableArray array];
        //类方法 arrayWithCapacity初始化数组
        NSMutableArray* mArray2 = [NSMutableArray arrayWithCapacity:100];
        
        //实例方法initWithCapacity
        NSMutableArray* mArray3 = [[NSMutableArray alloc] initWithCapacity:100];
        
        NSMutableArray* mArray = [NSMutableArray arrayWithObjects:@"九九学院",@"99ios", nil];
        NSLog(@"初始状态下，数组中第一个对象的值:%@",mArray[0]);
        
        mArray[0] = @"www.99ios.com";
        
        NSLog(@"更新后，数组中第一个对象的值：%@",mArray[0]);
    }
    return 0;
}
