//
//  ViewController.m
//  14_使用代码切换控制器_02
//
//  Created by lilin on 2020/7/5.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIViewController* controller = [[UIViewController alloc] init];
    //ios13之前是默认全屏显示，ios13以后默认不是全屏
    
    /**
     Controller的展示风格：
     UIModalPresentationFullScreen
     UIModalPresentationPopover
     UIModalPresentationFormSheet
     UIModalPresentationCustom
    */
    
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    
    controller.view.backgroundColor = [UIColor redColor];
    [self presentViewController:controller animated:true completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:true completion:nil];
        });
    }];
}


@end
