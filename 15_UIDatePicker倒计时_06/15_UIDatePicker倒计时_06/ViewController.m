//
//  ViewController.m
//  15_UIDatePicker倒计时_06
//
//  Created by lilin on 2020/7/15.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,assign)NSInteger remainingTime;
@property(nonatomic,strong)UIButton *starButton;
@property(nonatomic,strong)UILabel *showTimeLabel;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation ViewController

BOOL starFlag = YES;


- (UIDatePicker *)datePicker {
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 200)];
        _datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    }
    return _datePicker;
}

- (UILabel *)showTimeLabel {
    if (_showTimeLabel == nil) {
        _showTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        _showTimeLabel.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 350);
        _showTimeLabel.textAlignment = NSTextAlignmentCenter;
        _showTimeLabel.backgroundColor = [UIColor yellowColor];
    }
    return _showTimeLabel;
}

- (UIButton *)starButton {
    if (_starButton == nil) {
        _starButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        _starButton.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 280);
        [_starButton setTitle:@"开始" forState:UIControlStateNormal];
        [_starButton addTarget:self action:@selector(clickStarButton) forControlEvents:UIControlEventTouchUpInside];
        _starButton.backgroundColor = [UIColor redColor];
        _starButton.layer.masksToBounds = YES;
        _starButton.layer.cornerRadius = 30;
    }
    return _starButton;
}

- (void)clickStarButton {
    if (starFlag == YES) {
        self.remainingTime = self.datePicker.countDownDuration;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(starButtonStateTimer) userInfo:nil repeats:YES];
        [self.datePicker removeFromSuperview];
        [self.view addSubview:self.showTimeLabel];
        self.showTimeLabel.text = @"";
        [self.starButton setTitle:@"重置" forState:UIControlStateNormal];
        self.starButton.backgroundColor = [UIColor blueColor];
        starFlag = NO;
    }else {
        [self stateChange];
    }
}

- (void)stateChange {
        [self.timer invalidate];
        [self.starButton setTitle:@"开始" forState:UIControlStateNormal];
        [self.view addSubview:self.datePicker];
        [self.showTimeLabel removeFromSuperview];
        self.starButton.backgroundColor = [UIColor redColor];
        starFlag = YES;
}

- (void)starButtonStateTimer {
    if (self.remainingTime > 0) {
        self.showTimeLabel.text = [NSString stringWithFormat:@"%ld",self.remainingTime];
        self.remainingTime = self.remainingTime - 1;
    }else {
        [self stateChange];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.datePicker];
    [self.view addSubview:self.starButton];
}


@end
