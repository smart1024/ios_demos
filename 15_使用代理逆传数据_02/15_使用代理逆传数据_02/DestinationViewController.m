//
//  DestinationViewController.m
//  15_使用代理逆传数据_02
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

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"順传数据为：%@",self.dataText);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //如果方法定义了
    if ([self.delegate respondsToSelector:@selector(destinationViewController:return2SrcVCWithData:)]) {
        [self.delegate destinationViewController:self return2SrcVCWithData:@"九九学院"];
    }
    [self.navigationController popViewControllerAnimated:true];
}

@end
