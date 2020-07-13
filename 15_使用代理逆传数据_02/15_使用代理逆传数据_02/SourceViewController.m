//
//  SourceViewController.m
//  15_使用代理逆传数据_02
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "SourceViewController.h"
#import "DestinationViewController.h"
@interface SourceViewController ()<DestinationViewControllerDelegate>

@end

@implementation SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DestinationViewController* desVc = [[DestinationViewController alloc] init];
    desVc.view.backgroundColor = [UIColor redColor];
    desVc.navigationItem.title = @"目标控制器";
    desVc.dataText = @"99ios.com";
    desVc.delegate = self;
    
    [self.navigationController pushViewController:desVc animated:true];
}

//回调方法
- (void)destinationViewController:(DestinationViewController *)destinationViewController return2SrcVCWithData:(NSString *)string{
    NSLog(@"目标控制器回传的字符串数据：%@",string);
}

@end
