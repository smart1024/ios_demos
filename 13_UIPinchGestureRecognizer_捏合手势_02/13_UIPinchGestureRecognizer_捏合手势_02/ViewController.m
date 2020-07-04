//
//  ViewController.m
//  13_UIPinchGestureRecognizer_捏合手势_02
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
    //使用这种方法创建出来的imageView大小和传入图片尺寸一样
//    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"99logo"]];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 150, 150)];
    imageView.image = [UIImage imageNamed:@"99logo"];
    imageView.layer.borderColor = [UIColor blackColor].CGColor;
    imageView.layer.borderWidth = 1;
    imageView.userInteractionEnabled = true;

    [self.view addSubview:imageView];
    
    //添加捏合手势
    UIPinchGestureRecognizer* pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    [imageView addGestureRecognizer:pinchGesture];
    
    //添加旋转手势
    UIRotationGestureRecognizer* rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGesture:)];
    
    [imageView addGestureRecognizer:rotationGesture];
}

-(void)pinchGesture:(UIPinchGestureRecognizer*) gesture{
    NSLog(@"%s",__func__);
    NSLog(@"%s, 缩放比例: %f",__func__,gesture.scale);
    CGFloat scale = gesture.scale;
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform, scale, scale);
    //一定要把scale的值重置为1，否则会影响缩放效果，即缩放比例会在上一次基础上进行缩小/放大
    gesture.scale = 1;
}

-(void)rotationGesture:(UIRotationGestureRecognizer*) gesture{
    NSLog(@"%s, rotation:%f, velocity:%f",__func__,gesture.rotation,gesture.velocity);
    CGFloat rotation = gesture.rotation;
    gesture.view.transform = CGAffineTransformRotate(gesture.view.transform, rotation);
    
    //一定要把rotation的值重置为0，否则会影响旋转效果
    gesture.rotation = 0;
}
@end
