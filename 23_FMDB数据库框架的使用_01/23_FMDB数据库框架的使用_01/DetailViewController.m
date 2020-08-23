//
//  DetailViewController.m
//  23_FMDB数据库框架的使用_01
//
//  Created by lilin on 2020/8/23.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "DetailViewController.h"
#import "FMDBService.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(editItemSelect)];
    self.navigationItem.rightBarButtonItem = editItem;
    
    self.idTextField.text = self.dict[@"id"];
    self.nameTextField.text = self.dict[@"name"];
    self.sexTextField.text = self.dict[@"sex"];
    self.ageTextField.text = self.dict[@"age"];
    
    //主键不可编辑
    self.idTextField.userInteractionEnabled = NO;
    
    //注册通知，用来逆传
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upadteData:) name:@"update" object:nil];
}

#pragma mark - editItemSelect
- (void)editItemSelect {
    NSDictionary *tmpDict = @{@"id" : self.idTextField.text, @"name": self.nameTextField.text, @"sex" : self.sexTextField.text, @"age" : self.ageTextField.text};
    
    FMDBService *fmdbService = [[FMDBService alloc] init];
    [fmdbService updateDataWithDictionary:tmpDict];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"update" object:tmpDict];
}
@end
