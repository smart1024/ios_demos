//
//  SourceViewController.m
//  15_使用通知逆传数据_03
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "SourceViewController.h"
#import "DestinationViewController.h"
@interface SourceViewController ()

@end

/**
 使用通知可实现一对多传递数据
 */
@implementation SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage:) name:@"destinationVCReturn" object:nil];
}

-(void)receiveMessage:(NSNotification*)notification{
    NSString* string = (NSString*)notification.object;
    NSLog(@"目标控制器回传的字符串数据(使用通知)：%@",string);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    DestinationViewController* desVc = [[DestinationViewController alloc] init];
    
    desVc.view.backgroundColor = [UIColor blueColor];
    
    desVc.navigationItem.title = @"目标控制器";
    
    [self.navigationController pushViewController:desVc animated:true];
}
@end
