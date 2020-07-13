//
//  SourceViewController.m
//  15_源控制器跳转目标控制器_01
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "SourceViewController.h"
#import "DestinationViewController.h"
@interface SourceViewController ()

@end

@implementation SourceViewController

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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DestinationViewController* dv = [[DestinationViewController alloc] init];
    dv.view.backgroundColor = [UIColor redColor];
    dv.navigationItem.title = @"目标控制器";
    dv.dataText = @"99 ios";
    [self.navigationController pushViewController:dv animated:true];
}

@end
