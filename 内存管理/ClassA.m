//
//  ClassA.m
//  内存管理
//
//  Created by lilin on 2020/6/8.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    ClassA* clazz = [[ClassA alloc] init];
    return clazz;
}

-(void) printWebSite{
    NSLog(@"ClassA 中打印website的值：%@",self.website);
}
@end
