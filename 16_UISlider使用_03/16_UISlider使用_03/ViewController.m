//
//  ViewController.m
//  16_UISlider使用_03
//
//  Created by lilin on 2020/7/15.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UISlider* slider;
@property (nonatomic,strong) UIImageView* imageView;
@end

@implementation ViewController

-(UISlider *)slider{
    if (_slider==nil) {
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 400, [UIScreen mainScreen].bounds.size.width-40, 20)];
        _slider.value = self.imageView.alpha;
        //进度色
        _slider.minimumTrackTintColor = [UIColor redColor];
        //背景色
        _slider.maximumTrackTintColor = [UIColor blueColor];
        _slider.thumbTintColor = [UIColor grayColor];
        [_slider addTarget:self action:@selector(changeAlpha) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
        _imageView.image = [UIImage imageNamed:@"99logo"];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.slider];
    [self.view addSubview:self.imageView];
}

-(void)changeAlpha{
    NSLog(@"%f",self.slider.value);
    self.imageView.alpha = self.slider.value;
}

@end
