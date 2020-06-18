//
//  MYConst.h
//  对象
//
//  Created by lilin on 2020/6/18.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 const和#define区别
 1、凡是涉及字符串常量的定义都建议用const，const性能比#define高，当多次使用该常量，内存中只会创建一个对象
 #define会在所有使用到的地方z用字符串替换，会创建多个字符串对象，所以效率低
 */
@interface MYConst : NSObject
/*高度*/
extern int const height;

/**启动成功通知*/
extern NSString* const launchSuccessNotification;
@end

NS_ASSUME_NONNULL_END
