//
//  ViewController.m
//  13_UIPanGestureRecognizer_拖动手势_04
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
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    //imageView默认是不能响应事件的
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"99logo"];
    [self.view addSubview:imageView];
    
//    添加拖拽手势
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [imageView addGestureRecognizer:panGesture];
}

-(void)pan:(UIPanGestureRecognizer*) gesture{
    NSLog(@"%s",__func__);
    //求imageView在父View中的移动变化量
    CGPoint translation = [gesture translationInView:self.view];
    
    gesture.view.center = CGPointMake(gesture.view.center.x+translation.x, gesture.view.center.y+translation.y);
    
    //移动完成后设置相对s父控件偏移量为0
    [gesture setTranslation:CGPointZero inView:self.view];
}


@end
