//
//  Player.m
//  oc数据类型
//
//  Created by lilin on 2020/6/7.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Player.h"

@implementation Player
+(Player*)player{
    Player* player = [[Player alloc] init];
    player.healthPoint = 100;
    player.magicPoint = 100;
    return player;
}

-(void)normalAttack{
    //普通攻击
}

-(void)magicAttack{
    //
    self.magicPoint -= 10;
}
@end
