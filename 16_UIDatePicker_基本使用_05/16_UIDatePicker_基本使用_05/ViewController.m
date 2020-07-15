//
//  ViewController.m
//  16_UIDatePicker_基本使用_05
//
//  Created by lilin on 2020/7/15.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIDatePicker* datePicker;
@property (nonatomic,strong) UIButton* button;
@end

@implementation ViewController

-(UIDatePicker *)datePicker{
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 220, [UIScreen mainScreen].bounds.size.width, 300)];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    }
    return _datePicker;
}

- (UIButton *)button{
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(0, 0, 50, 30);
        _button.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 600);
        [_button setTitle:@"确定" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.datePicker];
    [self.view addSubview:self.button];
}

-(void)clickButton{
    //获取控件显示的日期
    NSDate* selected = [self.datePicker date];
    //创建日期格式器
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm +0800"];
    
    //格式化选中日期
    NSString* destDateString = [dateFormatter stringFromDate:selected];
    
    NSString *message = [NSString stringWithFormat:@"您选择的日期和时间是: %@",destDateString];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"日期和时间" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
