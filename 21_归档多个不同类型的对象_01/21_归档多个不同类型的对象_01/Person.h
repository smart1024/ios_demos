//
//  Person.h
//  21_归档多个不同类型的对象_01
//
//  Created by lilin on 2020/7/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSCoding>
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) int age;
@end

NS_ASSUME_NONNULL_END
