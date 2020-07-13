//
//  DestinationViewController.m
//  15_使用block界面间回传数据_04
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "DestinationViewController.h"

@interface DestinationViewController ()

@end

@implementation DestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.block) {
        self.block(@"九九学院");
    }
    //返回上一个控制器
    [self.navigationController popViewControllerAnimated:true];
}
@end
