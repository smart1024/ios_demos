//
//  ClassA.h
//  06_浅复制和深复制_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassA : NSObject

//依次使用copy,strong，weak
@property (nonatomic,copy) NSString* name;
@end

NS_ASSUME_NONNULL_END
