//
//  Person.m
//  20_自定义对象归档和解档_02
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (instancetype)personWithDict:(NSDictionary *)dict{
    Person* person = [[Person alloc] init];
    person.age = dict[@"age"];
    person.name = dict[@"name"];
    return person;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

//实现归档方法
- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.age forKey:@"age"];
}

//实现解档方法
- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeObjectForKey:@"age"];
    }
    return self;
}
@end
