//
//  ViewController.m
//  14_控制器嵌套_04
//
//  Created by lilin on 2020/7/5.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"
@interface ViewController ()
@property (nonatomic,strong) SubViewController* subVC;
@end

@implementation ViewController

- (SubViewController *)subVC{
    if (_subVC == nil) {
       _subVC = [[SubViewController alloc] init];
        //将子控制器view添加到父控制器的view
        [self.view addSubview:_subVC.view];
       
    }
    return _subVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

//由打印输出可知，同一个控制器只会添加一次
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"添加前子控制器个数:%ld",self.childViewControllers.count);
    NSLog(@"%s",__func__);
    [self addChildViewController:self.subVC];
    
    NSLog(@"添加后子控制器个数:%ld",self.childViewControllers.count);
}

@end
