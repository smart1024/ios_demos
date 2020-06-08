//
//  MyClass.h
//  oc数据类型
//
//  Created by lilin on 2020/6/7.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
NS_ASSUME_NONNULL_BEGIN
//.h中声明的属性为公有属性，可在整个工程中使用
//在.m中声明的属性为私有属性，只能在类的内部使用
@interface MyClass : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) int age;
@property (nonatomic,strong) Player* player;
@property (nonatomic,weak) id delegate;
@end

NS_ASSUME_NONNULL_END
