#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
    
    //首页
    UIViewController* homeVc = [[UIViewController alloc] init];
    homeVc.title = @"微信";
    homeVc.view.backgroundColor = [UIColor whiteColor];
    UINavigationController* homeNav = [[UINavigationController alloc] initWithRootViewController:homeVc];

    UITabBarItem* item0 = [[UITabBarItem alloc] initWithTitle:homeVc.title image:[UIImage imageNamed:@"tabbar_mainframe"] selectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    homeNav.tabBarItem = item0;
    
    //通讯录
    UIViewController* contactVc = [[UIViewController alloc] init];
    contactVc.title = @"通讯录";
    contactVc.view.backgroundColor = [UIColor whiteColor];
    UINavigationController* contactNav = [[UINavigationController alloc] initWithRootViewController:contactVc];
    
    UITabBarItem* item1 = [[UITabBarItem alloc] initWithTitle:contactVc.title image:[UIImage imageNamed:@"tabbar_contacts"] selectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    contactNav.tabBarItem = item1;
    
    //发现
    UIViewController* discoverVc = [[UIViewController alloc] init];
    discoverVc.title = @"发现";
    discoverVc.view.backgroundColor = [UIColor whiteColor];
    UINavigationController* discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverVc];
    UITabBarItem* item2 = [[UITabBarItem alloc] initWithTitle:contactVc.title image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    discoverNav.tabBarItem = item2;
    
    //我的
    UIViewController* meVc = [[UIViewController alloc] init];
    meVc.title = @"我的";
    meVc.view.backgroundColor = [UIColor whiteColor];
    UINavigationController* meNav = [[UINavigationController alloc] initWithRootViewController:meVc];
    
    UITabBarItem* item3 = [[UITabBarItem alloc] initWithTitle:contactVc.title image:[UIImage imageNamed:@"tabbar_me"] selectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    meNav.tabBarItem = item3;
    
    UITabBarController* tabBarVc = [[UITabBarController alloc] init];
    tabBarVc.tabBar.backgroundImage = [UIImage imageNamed:@"tabbarBkg"];
    //设置选中时文字和icon颜色
//    tabBarVc.tabBar.tintColor = [UIColor colorWithRed:3/255.0 green:185/255.0 blue:34/255.0 alpha:1.0];
    tabBarVc.tabBar.tintColor = [UIColor blueColor];
    tabBarVc.viewControllers = @[homeNav,contactNav,discoverNav,meNav];
    
    //按图片原始色值显示
    for (UITabBarItem* item in tabBarVc.tabBar.items) {
        UIImage* image = item.selectedImage;
        item.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    self.window.rootViewController = tabBarVc;
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
