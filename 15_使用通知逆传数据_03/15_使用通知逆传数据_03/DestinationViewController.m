//
//  DestinationViewController.m
//  15_使用通知逆传数据_03
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
//    [NSNotificationCenter defaultCenter] postNotificationName:@"destinationVCReturn" object:nil userInfo:<#(nullable NSDictionary *)#>
    [[NSNotificationCenter defaultCenter] postNotificationName:@"destinationVCReturn" object:@"九九学院"];
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
