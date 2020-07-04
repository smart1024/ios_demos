//
//  ViewController.m
//  13_UILongPressGestureRecognizer_长按手势_05
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
    //
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 50, 150, 150)];
    imageView.image = [UIImage imageNamed:@"99logo"];
    imageView.userInteractionEnabled = true;
    [self.view addSubview:imageView];
    
    //添加长按手势
    UILongPressGestureRecognizer* longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    [imageView addGestureRecognizer:longPressGesture];
    
}

//响应长按事件
-(void)longPress:(UILongPressGestureRecognizer*) gesture{
    NSLog(@"%s",__func__);
    if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按开始");
    }else if(gesture.state == UIGestureRecognizerStateEnded){
        NSLog(@"长按结束");
    }else{
        NSLog(@"长按中");
    }
}

@end
