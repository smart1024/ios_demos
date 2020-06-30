//
//  ViewController.m
//  09_UIScrollView_01
//
//  Created by lilin on 2020/6/30.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建ImageView对象
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
   
    //创建一个与屏幕等宽高德滚动视图
    UIScrollView* myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //设置滚动区域大小为图片大小
    myScrollView.contentSize = imageView.bounds.size;
    
    myScrollView.backgroundColor = [UIColor redColor];
    
    myScrollView.contentOffset = CGPointMake(0, 0);
    
    myScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [myScrollView addSubview:imageView];
    
    [self.view addSubview:myScrollView];
}


@end
