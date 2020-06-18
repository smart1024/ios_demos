//
//  ClassA.m
//  对象
//
//  Created by lilin on 2020/6/14.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA
-(void)printExternVar{
    //extern声明表示使用外部的全局变量
    extern int gNum;
    NSLog(@"gloable value (ClassA):%d",gNum);
    gNum++;
}
@end
