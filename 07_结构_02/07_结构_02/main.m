//
//  main.m
//  07_结构_02
//
//  Created by lilin on 2020/6/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 结构类型的定义：
 struct 结构体名称{
    成员变量类型 成员变量名称;
    成员变量类型 成员变量名称;
    成员变量类型 成员变量名称;
    ...;
 };

 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //定义Date结构体存储日期
        struct Date{
            int day;
            int month;
            int year;
        };
        
        //声明结构体变量
        struct Date today;
        
        //结构体变量的赋值或初始化
        //1、点语法赋值
        today.day = 2;
        today.month = 9;
        today.year = 2016;
        
        //2、大括号赋值，必须按顺序，逗号隔开
        struct Date tomorrow = {3,9,2016};
        
        //访问结构体
        NSLog(@"今天是:%d年%d月%d日",today.year,today.month,today.day);
        NSLog(@"明天是:%d年%d月%d日",tomorrow.year,tomorrow.month,tomorrow.day);
    }
    
    /**
     结构体嵌套：结构体中成员为结构体类型
     */
    
    struct MyCGPoint{
        CGFloat x;
        CGFloat y;
    };
    
    typedef struct MyCGPoint MyCGPoint;
    
    struct MyCGSize{
        CGFloat width;
        CGFloat height;
    };
    
    typedef struct MyCGSize MyCGSize;
    
    
    struct MyCGRect{
        MyCGPoint origin;
        MyCGSize size;
    };
    
    typedef struct MyCGRect MyCGRect;
    
    //结构体嵌套初始化
    //1、通用初始化方法
    MyCGPoint point ={0,0};
    MyCGSize  size={100,100};
    MyCGRect frame = {point,size};
    
    //2、快速初始化方法，系统框架中提供函数快速创建结构体
    CGPoint point1 = CGPointMake(0, 0);
    CGSize size1 = CGSizeMake(100, 100);
    CGRect frame1 = {point1,size1};
    
    //使用系统提供函数快速创建结构体
    CGRect frame2 = CGRectMake(0, 0, 100, 100);
    
    //修改
    frame.size.width = 200;
    frame1.size.width = 200;
    
    NSLog(@"frame.size.with=%f",frame.size.width);
    NSLog(@"frame1.size.with=%f",frame1.size.width);
    NSLog(@"frame2.size.with=%f",frame2.size.width);

    return 0;
}
