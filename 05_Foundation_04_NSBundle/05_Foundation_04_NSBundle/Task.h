//
//  Task.h
//  05_Foundation_04_NSBundle
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject
//1、定义带Block参数的方法
-(void)beginTaskWithCallbackBlock:(void (^)(void)) callbackBlock;

@end

NS_ASSUME_NONNULL_END
