//
//  Magician.m
//  oc数据类型
//
//  Created by lilin on 2020/6/7.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "Magician.h"

@implementation Magician
-(void)specialMagicAttack{
    self.magicPoint -= 50;
    NSLog(@"specialMagicAttack!");
}
-(void)mixAttack{
    [super normalAttack];
    [super magicAttack];
}
@end
