//
//  Student.m
//  20_归档多个自定义对象_03
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)encodeWithCoder:(NSCoder *)coder{
    [super encodeWithCoder:coder];
    [coder encodeObject:self.score forKey:@"score"];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        self.score = [coder decodeObjectForKey:@"score"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
