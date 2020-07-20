//
//  Person.h
//  20_归档多个自定义对象_03
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSSecureCoding>

@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSNumber* age;

+(Person*)personWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
