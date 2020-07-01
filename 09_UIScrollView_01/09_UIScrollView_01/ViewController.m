//
//  ViewController.m
//  09_UIScrollView_01
//
//  Created by lilin on 2020/6/30.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (UIImageView *)imageView{
    if (_imageView==nil) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    }
    return _imageView;
}

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
    
    myScrollView.minimumZoomScale = 0.3;
    
    myScrollView.maximumZoomScale = 3;
    
    [myScrollView addSubview:imageView];
    
    [self.view addSubview:myScrollView];
    
    myScrollView.delegate = self;
}

//scrollView滚动时不断调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"滚动时，调用scrollViewDidScroll:方法");
}

//scrollView即将开始滚动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
     NSLog(@"即将开始滚动时，调用scrollViewWillBeginDragging:方法");
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"停止滚动时，调用scrollViewWillEndDragging:方法");
    NSLog(@"velocity x=%f,y=%f",velocity.x,velocity.y);
    NSLog(@"targetContentOffset x=%f,y=%f",targetContentOffset->x,targetContentOffset->y);
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"图片即将开始缩放");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"图片缩放完成");
}

//设置监听缩放view
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

@end
