//
//  MYClass.m
//  对象
//
//  Created by lilin on 2020/6/14.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MYClass.h"

//在实现外部定义静态变量staticValue2
static int staticValue2 = 100;

@implementation MYClass

//定义内部全局变量，但不能在接口和协议中定义变量
int gNum = 0;

-(NSString*)name{ //对name属性进行懒加载
    if (_name==nil) {
        _name=@"ios99";
    }
    return _name;
}

-(void)printLocalVariable{
    int localVar =0;
    NSLog(@"localVar value :%d",localVar);
    localVar++;
//    [self printGloableVariable];
}

-(void)printGloableVariable{
    NSLog(@"gloabal value: %d",gNum);
    gNum++;
}

//方法内定义的静态变量 默认情况下静态变量初始值为0，并且此静态变量只能在方法内部使用，多次打印静态变量的值是累加的
-(void)printStaticVariable{
    static int staticValue;
    NSLog(@"staticVar Value:%d",staticValue);
    staticValue++;
}

-(void)testStaticValue1{
    NSLog(@"在方法1中打印静态变量的当前值：%d",staticValue2);
    staticValue2++;
}

-(void)testStaticValue2{
    NSLog(@"在方法2中打印静态变量的当前值：%d",staticValue2);
    staticValue2++;
}
@end
