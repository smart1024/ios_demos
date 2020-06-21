//
//  ClassB.h
//  06_浅复制和深复制_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"

NS_ASSUME_NONNULL_BEGIN

//为了实现ClassB类对象的复制，需要遵守NSCopy协议，同时实现copyWithZone:方法
@interface ClassB : NSObject<NSCopying>
@property (nonatomic,copy) NSString* name;
@property (nonatomic,strong) ClassA* customClass;
@property (nonatomic,weak) id delegate;
@property (nonatomic,assign) int number;
@end

NS_ASSUME_NONNULL_END
