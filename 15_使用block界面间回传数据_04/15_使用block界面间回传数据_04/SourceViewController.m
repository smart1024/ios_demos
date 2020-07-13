//
//  SourceViewController.m
//  15_使用block界面间回传数据_04
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DestinationViewController* desVc = [[DestinationViewController alloc] init];
    desVc.view.backgroundColor = [UIColor greenColor];
    desVc.navigationItem.title = @"目标控制器";
    //给block属性赋值
    desVc.block = ^(NSString * _Nonnull dataText) {
        NSLog(@"目标控制器回传的字符串数据(使用Block)：%@",dataText);
    };
    [self.navigationController pushViewController:desVc animated:true];
}

@end
