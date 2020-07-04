//
//  ViewController.m
//  13_UIGestureRecognizer_点击手势_01
//
//  Created by lilin on 2020/7/4.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    //单击(单手指)
    //target:消息发给谁，这里是ViewControler，view是
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    //单击
    singleTap.numberOfTapsRequired = 1;
    
    //单点触摸
    singleTap.numberOfTouchesRequired = 1;
    
    //给View添加手势
    [view addGestureRecognizer:singleTap];
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 150, 150)];
    
    view1.backgroundColor = [UIColor greenColor];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired = 1;
    doubleTap.numberOfTouchesRequired = 2;
    
    [self.view addSubview:view1];
    //view为手势receiver，target是指发给谁self代表view controler
    [view1 addGestureRecognizer:doubleTap];
}

-(void)singleTap:(UITapGestureRecognizer*) singleTap{
    NSLog(@"%s",__func__);
}

-(void)doubleTap:(UITapGestureRecognizer*)doubleTap{
    NSLog(@"%s",__func__);
}
@end
