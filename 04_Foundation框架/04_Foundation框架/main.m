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
    }
    return 0;
}
