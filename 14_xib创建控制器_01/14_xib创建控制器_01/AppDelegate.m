//
//  AppDelegate.m
//  14_xib创建控制器_01
//
//  Created by lilin on 2020/7/5.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (@available(iOS 13.0,*)) {
        NSLog(@"IOS 13以上系统");
        
    }else{ //IOS 13以下系统版本走以下代码
        //1、由XIB创建Controller
//        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        MyViewController* rootViewController = [MyViewController alloc];
//        self.window.rootViewController = [rootViewController initWithNibName:NSStringFromClass([MyViewController class]) bundle:nil];
//        [self.window makeKeyAndVisible];
        
        //2、由StoryBoard创建Controller
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController* rootViewController = [sb instantiateViewControllerWithIdentifier:@"SBViewController"];
        self.window.rootViewController = rootViewController;
        [self.window makeKeyAndVisible];
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
