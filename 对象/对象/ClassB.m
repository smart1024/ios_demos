//
//  ClassB.m
//  对象
//
//  Created by lilin on 2020/6/14.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB
-(void) printExternVar{
    //extern关键字声明表示使用外部的全局变量
    extern int gNum;
    NSLog(@"gloableVar value (ClassB):%d",gNum);
}
@end
