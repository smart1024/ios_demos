//
//  ClassB.m
//  内存管理
//
//  Created by lilin on 2020/6/14.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB
-(void)printWebSite{
    [super printWebSite]; //先调用父类的方法
    NSLog(@"ClassB中打印website的值：%@",[NSString stringWithFormat:@"http://%@",self.website]);
}
@end
