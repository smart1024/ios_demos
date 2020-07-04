//
//  ViewController.m
//  13_UISwipeGestureRecognizer_滑动手势_03
//
//  Created by lilin on 2020/7/4.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray* imageList;
@property (nonatomic,assign) NSInteger imageIndex;
@property (nonatomic,strong) UIImageView* imageView;
@end

@implementation ViewController

- (NSMutableArray *)imageList{
    if (_imageList == nil) {
        _imageList = [NSMutableArray array];
        for (int i=0; i < 4; i++) {
            NSString* imageName = [NSString stringWithFormat:@"%d",i];
            UIImage* image = [UIImage imageNamed:imageName];
            [_imageList addObject:image];
        }
    }
    return _imageList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UIImageView
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 150, 150)];
    imageView.image = self.imageList[0];
    imageView.userInteractionEnabled = true;
    self.imageView = imageView;
    self.imageIndex = 0;
    
    [self.view addSubview:imageView];
    
    //添加手势
    UISwipeGestureRecognizer* swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    UISwipeGestureRecognizer* swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [imageView addGestureRecognizer:swipeLeftGesture];
    
    [imageView addGestureRecognizer:swipeRightGesture];
}

//处理滑动事件
-(void)swipe:(UISwipeGestureRecognizer*) gesture{
    NSLog(@"%s",__func__);
    long totalCount = self.imageList.count;
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (self.imageIndex >= totalCount -1) return;
        self.imageView.image = self.imageList[++self.imageIndex];
    }else{
        if (self.imageIndex <= 0) return;
        self.imageView.image = self.imageList[--self.imageIndex];
    }
}

@end
