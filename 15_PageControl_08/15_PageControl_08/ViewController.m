//
//  ViewController.m
//  15_PageControl_08
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"
@interface ViewController ()
@property (nonatomic,strong) MyScrollView* myScrollView;
@property (nonatomic,strong) UIPageControl* pageControl;
@property (nonatomic,assign) int currentImageIndex;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (MyScrollView *)myScrollView{
    if (_myScrollView == nil) {
        //获取到图片的宽度
        UIImage *image = [UIImage imageNamed:@"99logo_00"];
        CGFloat imageWidth = image.size.width;
        CGFloat imageHeight = image.size.height;
        CGFloat imageWHRatio = imageWidth/imageHeight;
        //把图片添加到scrollView中，关键在于设置位置（平铺式的布局）
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        //根据图片的实际宽度计算显示出来后图片的高度（不失真）
        CGFloat imageViewHeight = screenWidth / imageWHRatio;
        _myScrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 20, screenWidth, imageViewHeight)];
    }
    return _myScrollView;
}

- (UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.frame = CGRectMake(0, 215, [UIScreen mainScreen].bounds.size.width, 37);
        _pageControl.numberOfPages = 4;
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        [_pageControl addTarget:self action:@selector(clickPageControl) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (void) clickPageControl {
    //根据点击的pageControl的值，来更新scrollview的contentoffset
    CGFloat x = [UIScreen mainScreen].bounds.size.width * self.pageControl.currentPage;
    [self.myScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    //更新一下currentImageIndex的值
    self.currentImageIndex = (int)self.pageControl.currentPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.myScrollView];
    
    [self.view addSubview:self.pageControl];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(changeImage) userInfo:nil repeats:true];
    self.currentImageIndex = 0;
}

-(void)changeImage{
    self.pageControl.currentPage = self.currentImageIndex;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = screenWidth*self.currentImageIndex++;
    [self.myScrollView setContentOffset:CGPointMake(x, 0) animated:true];
    
    if (self.currentImageIndex == 4) {
        self.currentImageIndex = 0;
    }
}

@end
