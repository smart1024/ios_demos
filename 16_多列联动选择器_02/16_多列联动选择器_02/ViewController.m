//
//  ViewController.m
//  16_多列联动选择器_02
//
//  Created by lilin on 2020/7/15.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) NSArray *provinceArray;
@property (nonatomic, strong) NSString *selectedProvince;
@end

@implementation ViewController

- (NSDictionary *)dictionary{
    if (_dictionary == nil) {
        _dictionary = @{@"江苏":@[@"南京",@"徐州",@"镇江",@"无锡",@"常州"],@"河北":@[@"石家庄",@"保定",@"承德",@"沧州",@"秦皇岛"]};
    }
    return _dictionary;
}

-(UIPickerView *)pickerView{
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 193, 375, 216)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.provinceArray = [[self.dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.selectedProvince = self.provinceArray[0];
    [self.view addSubview:self.pickerView];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.provinceArray.count;
    }
    return [self.dictionary[self.selectedProvince] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.provinceArray[row];
    }
    return self.dictionary[self.selectedProvince][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) { //切换省份，更新第二列数据
        self.selectedProvince = self.provinceArray[row];
        [self.pickerView reloadComponent:1];
        //默认选择第一项
        [self.pickerView selectRow:0 inComponent:1 animated:true];
    }
    
}

@end
