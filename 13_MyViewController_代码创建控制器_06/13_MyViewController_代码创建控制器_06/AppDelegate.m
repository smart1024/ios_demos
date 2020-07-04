//
//  AppDelegate.m
//  13_MyViewController_代码创建控制器_06
//
//  Created by lilin on 2020/7/4.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    @available(iOS 13.0, *)
    if (@available(iOS 13.0,*)) {
        NSLog(@"IOS 13以上系统");
    }else{
        MyViewController* rootViewController = [[MyViewController alloc] init];
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = rootViewController;
        self.window.backgroundColor = [UIColor whiteColor];
        //设置widnow为主window并且可见
        [self.window makeKeyAndVisible];
        NSLog(@"低于IOS 13的系统");
        NSLog(@"%s",__func__);
    }
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
