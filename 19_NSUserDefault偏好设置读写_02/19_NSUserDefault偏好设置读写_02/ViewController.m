//
//  ViewController.m
//  19_NSUserDefault偏好设置读写_02
//
//  Created by lilin on 2020/7/19.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    //写入数据
    [defaults setObject:[NSDate date] forKey:@"LastLoginTime"];
    [defaults setBool:NO forKey:@"IsFirstLogin"];
    [defaults setValue:@"99ios" forKey:@"UserName"];
    
    //同步数据保存本地
    [defaults synchronize];
    
    NSString* libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"libPath = %@",libPath);
    
    //读取偏好设置数据
    NSDate* lastLoginTime = [defaults objectForKey:@"LastLoginTime"];
    BOOL isFirstLogin = [defaults boolForKey:@"IsFirstLogin"];
    NSString* userName = [defaults valueForKey:@"UserName"];
    
    NSLog(@"%@--%d--%@", lastLoginTime, isFirstLogin, userName);
    
    
    //删除数据
    [defaults removeObjectForKey:@"LastLoginTime"];
}


@end
