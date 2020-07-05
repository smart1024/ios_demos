//
//  ViewController.m
//  14_使用StoryBoard切换控制器
//
//  Created by lilin on 2020/7/5.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

/**
 两控制器间的连线称为segue，可以为每条segue设置名称，以在代码中使用
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//storyboard建立连线后，发生跳转会调用此方法,传递数据也采用此方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //将目标控制器全屏显示
    UIViewController* newVC = segue.destinationViewController;
    newVC.modalPresentationStyle = UIModalPresentationFullScreen;
    NSLog(@"源控制器为：%@",NSStringFromClass([segue.sourceViewController class]));
    NSLog(@"目标控制器为：%@",NSStringFromClass([segue.destinationViewController class]));
    NSLog(@"segue.identifier==%@",segue.identifier);
}

@end
