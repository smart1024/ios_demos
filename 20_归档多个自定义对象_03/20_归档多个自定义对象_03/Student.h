//
//  Student.h
//  20_归档多个自定义对象_03
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : Person<NSSecureCoding>
@property (nonatomic,strong) NSString *score;
@end

NS_ASSUME_NONNULL_END
