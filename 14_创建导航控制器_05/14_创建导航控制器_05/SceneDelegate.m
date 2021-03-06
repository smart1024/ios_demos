#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if (@available(iOS 13,*)) { //ios13以上才会走下面代码
        self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
        UIViewController* vc = [[UIViewController alloc] init];
//        vc.view.backgroundColor = [UIColor redColor];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.title = @"99IOS";
        UINavigationController* nv = [[UINavigationController alloc] initWithRootViewController:vc];
        //默认UIBarStyleDefault
//        nv.navigationBar.barStyle = UIBarStyleBlack;
        nv.navigationBar.barStyle = UIBarStyleDefault;
        //修改导航栏背景颜色
//        nv.navigationBar.barTintColor = [UIColor greenColor];
        
        //设置导航栏图标的颜色
       // nv.navigationBar.tintColor
        
        UIImage* backGroundImage =[UIImage imageNamed:@"background_normal"];
        
//        backGroundImage = [backGroundImage resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
        //
        [nv.navigationBar setBackgroundImage:backGroundImage forBarMetrics:UIBarMetricsDefault];
        
        self.window.rootViewController = nv;
        [self.window makeKeyAndVisible];
    }
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
