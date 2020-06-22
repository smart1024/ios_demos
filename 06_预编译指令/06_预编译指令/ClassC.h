//
//  ClassC.h
//  06_预编译指令
//
//  Created by lilin on 2020/6/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"
@class ClassA;
NS_ASSUME_NONNULL_BEGIN

@interface ClassC : NSObject
@property (nonatomic,strong) ClassA* classA;
@property (nonatomic,strong) ClassB* classB;
@end

NS_ASSUME_NONNULL_END
