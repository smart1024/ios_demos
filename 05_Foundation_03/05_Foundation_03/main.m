//
//  main.m
//  05_Foundation_03
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //打印出指定网页内容 stringWithContentOfUrl
        NSURL* url = [NSURL URLWithString:@"http://www.99ios.com"];
        NSString* stringContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"the string content of 99ios.com %@",stringContent);
        
        NSLog(@"=============================================================");
        //使用NSData打印出网页内容 dataWithContentOfUrl
        NSData* dataContent = [NSData dataWithContentsOfURL:url];
        
        //返回的内容是以编码形式显示
        NSLog(@"the data content of 99ios.com %@",dataContent);
        
        /**
         1、Block就是封装了一组代码语句的对象，可任意时间执行
         2、本质上是可移植的匿名函数，可作为入参，可作为返回值
         3、Block可接受参数，也可有返回值
         */
        
        //定义一个可接受参数并具有返回值的Block
        ^(int inputNum){
            NSLog(@"printBlock Called!");
            return inputNum;
        };
        
        /**
         定义变量printBlock指向Block格式如下：
         返回值类型 (^block名)(参数类型,参数类型...) = ^(参数类型 参数名,参数类型 参数名...){
            //block体(封装的代码)
         };
         */
        int (^printBlock)(int) = ^(int inputNum){
            NSLog(@"print Block called!");
            return inputNum;
        };
        
        //Block调用和函数类似
        NSLog(@"printBlock 返回值为%d",printBlock(100));
        
        //把Block声明为属性
        
    }
    return 0;
}
