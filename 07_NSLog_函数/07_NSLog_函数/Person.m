//
//  Person.m
//  07_NSLog_函数
//
//  Created by lilin on 2020/6/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)description{
    return [NSString stringWithFormat:@"<Person: name:%@,sex=%@,age=%d>",self.name,self.sex,self.age];
}

+(NSString *)description{
    return @"这是Person类";
}
@end
