//
//  Dog.h
//  06_KVC_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject
@property (nonatomic,copy) NSString* dogName;
@property (nonatomic,copy) NSNumber* dogAge;
@end

NS_ASSUME_NONNULL_END
