//
//  Person.h
//  07_NSLog_函数
//
//  Created by lilin on 2020/6/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* sex;
@property (nonatomic,assign) int age;
-(NSString *)description;
+(NSString *)description;
@end

NS_ASSUME_NONNULL_END
