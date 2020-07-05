//
//  SubViewController.m
//  14_控制器嵌套_04
//
//  Created by lilin on 2020/7/5.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.view.frame = CGRectMake(0, size.height*0.5, size.width, size.height*0.5);
    self.view.backgroundColor = [UIColor greenColor];
    
    //添加图片
    UIImageView* iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"99logo"]];
    iconImage.frame = CGRectMake(128, 50, 128, 128);
    [self.view addSubview:iconImage];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
