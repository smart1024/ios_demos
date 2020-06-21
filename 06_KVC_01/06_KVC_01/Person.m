//
//  Person.m
//  06_KVC_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _idNum =@"1234567";
    }
    return self;
}

//person只定义了idNumber没定义id，所以需要转换
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.idNumber = (NSString*)value;
    }
}

@end
