//
//  ClassC.m
//  06_预编译指令
//
//  Created by lilin on 2020/6/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ClassC.h"

@implementation ClassC

-(void)print{
    
    //报错
//    NSLog(@"%@",self.classA.website); //@class是不能引入属性和方法的
    NSLog(@"%@",self.classB.name); //#import可以访问属性和方法
}
@end
