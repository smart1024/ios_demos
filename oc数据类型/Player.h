//
//  Player.h
//  oc数据类型
//
//  Created by lilin on 2020/6/7.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject
@property (nonatomic,assign) int healthPoint;
@property (nonatomic,assign) int magicPoint;
+(Player *)player;
-(void)normalAttack;
-(void)magicAttack;
@end

NS_ASSUME_NONNULL_END
