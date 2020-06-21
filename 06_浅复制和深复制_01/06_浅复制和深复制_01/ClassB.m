//
//  ClassB.m
//  06_浅复制和深复制_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ClassB.h"
@implementation ClassB

//当需要浅复制时候：直接返回要复制的对象即可
//-(id)copyWithZone:(NSZone *)zone{
//    return self;
//}

/**
 深复制
 */
-(id)copyWithZone:(NSZone *)zone{
    ClassB* copyObject = [[[self class] allocWithZone:zone] init];

    //NSString copy为浅复制，mutableCopy为深复制
    copyObject.name = [self.name mutableCopy];
    //strong、weak为浅复制，直接返回即可
    copyObject.customClass = self.customClass;

    //weak为浅复制，直接返回即可
    copyObject.delegate = self.delegate;

    //基本数据类型直接返回即可
    copyObject.number = self.number;

    return copyObject;
}
@end
