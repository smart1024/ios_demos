//
//  ViewController.m
//  16_UIPickerView基本使用_01
//
//  Created by lilin on 2020/7/15.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) UIPickerView* pickerView;
@property (nonatomic,strong) NSArray* dataArray;
@property (nonatomic,strong) UILabel* label;
@end

@implementation ViewController

-(UIPickerView *)pickerView{
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 400)];
        _pickerView.layer.masksToBounds = YES;
        _pickerView.layer.borderWidth = 1;
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
    }
    return _pickerView;
}

- (NSArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray = @[@"北京",@"天津",@"南京",@"上海",@"唐山",@"重庆"];
    }
    return _dataArray;
}

- (UILabel *)label{
    if (_label ==nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pickerView.bounds)+100, [UIScreen mainScreen].bounds.size.width, 30)];
        _label.backgroundColor = [UIColor yellowColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = self.dataArray[0];
    }
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pickerView];
    [self.view addSubview:self.label];
}

//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//每列行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}

//每行显示内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.dataArray[row];
}

//选中后更新UIlabel的内容
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.label.text = self.dataArray[row];
}

@end
