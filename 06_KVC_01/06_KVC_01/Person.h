//
//  Person.h
//  06_KVC_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic,copy,readonly) NSString* idNum; //只读属性

@property (nonatomic,copy) NSString* idNumber;
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) int age;
@property (nonatomic,strong) Dog* dog;
@end

NS_ASSUME_NONNULL_END
