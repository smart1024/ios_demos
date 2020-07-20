//
//  Person.m
//  20_归档多个自定义对象_03
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Person.h"

@implementation Person

+(Person*)personWithDictionary:(NSDictionary *)dictionary{
    Person* person = [[Person alloc] init];
    person.name = dictionary[@"name"];
    person.age = dictionary[@"age"];
    return person;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeObjectForKey:@"age"];
    }
    return self;
}


- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.age forKey:@"age"];
}
@end
