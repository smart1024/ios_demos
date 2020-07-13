//
//  DestinationViewController.m
//  15_源控制器跳转目标控制器_01
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"源控制器传过来的数据: %@",self.dataText);
}

@end
