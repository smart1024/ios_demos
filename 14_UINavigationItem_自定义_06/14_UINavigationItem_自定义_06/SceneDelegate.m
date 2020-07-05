#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    if (@available(iOS 13,*)) {
        self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*) scene];
        UIViewController* vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor grayColor];
        vc.navigationItem.title = @"99IOS";
        vc.navigationItem.prompt = @"苹果iOS开发进阶之路";
        
        UINavigationController* nv = [[UINavigationController alloc] initWithRootViewController:vc];
        
        UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil ];
        
        UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"write_comment"] style:UIBarButtonItemStylePlain target:self action:nil];
        
        //注意是ViewController.navigationItem
        vc.navigationItem.leftBarButtonItem = leftBarButtonItem;
        vc.navigationItem.rightBarButtonItem = rightBarButtonItem;
        
        //设置navigationItem的颜色
        nv.navigationBar.tintColor = [UIColor redColor];
        
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
