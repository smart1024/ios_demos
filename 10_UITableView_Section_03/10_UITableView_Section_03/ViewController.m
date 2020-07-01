//
//  ViewController.m
//  10_UITableView_Section_03
//
//  Created by lilin on 2020/7/1.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (UITableView *)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //分割线与屏幕等宽
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //分割线颜色
        _tableView.separatorColor = [UIColor blackColor];
        
        //索引栏颜色
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        
        //索引栏文字颜色
        _tableView.sectionIndexColor = [UIColor redColor];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"cellID";
    //重用机制
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.textLabel.text = @"99ios";
        cell.detailTextLabel.text = @"苹果ios开发进阶之路";
        cell.imageView.image = [UIImage imageNamed:@"image"];
        cell.accessoryType = UITableViewCellAccessoryNone; //默认None
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


//tableview头布局文字 section多少个遍历几次
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString* message = [NSString stringWithFormat:@"这是第%ld个Section头部视图",section];
//    return message;
//}
//tableview脚布局文字 section多少个遍历几次
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    NSString* message = [NSString stringWithFormat:@"这是第%ld个Section底部视图",section];
//    return message;
//}

//头布局为自定义view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)]; //高度没起作用？
    headerView.backgroundColor = [UIColor orangeColor];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];//高度没起作用？
    footerView.backgroundColor = [UIColor greenColor];
    return footerView;
}

/**
 sectionIndexTitlesForTableView:创建内容索引
 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"S0",@"S1",@"S2",@"S3"];
}

@end
