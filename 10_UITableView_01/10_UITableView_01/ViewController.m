//
//  ViewController.m
//  10_UITableView_01
//
//  Created by lilin on 2020/7/1.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

/**
 懒加载tableView
 */
- (UITableView *)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self; //设置数据源对象
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

/**
 返回单元格20个单元格
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

/**
 这个方法会被调用20次
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"cell";
    
    //出列以tableViewCell
    UITableViewCell* cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) { //如果复用队列没有cell返回
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //随机获取数据
    NSString* text = [NSString stringWithFormat:@"%d",arc4random_uniform(1000000)];
    cell.textLabel.text = text;
    return cell;
}

//通知代理是否开启点击item高亮
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//通知代理哪行高亮显示
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"调用tableView:didHighliteRowAtIndexPath:方法");
    NSLog(@"高亮section = %ld,row = %ld",indexPath.section,indexPath.row);
}

//通知代理哪行取消高亮显示
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"取消高亮section = %ld,row = %ld",indexPath.section,indexPath.row);
}

//返回将要响应行索引
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tableView:WillSelectRowAtIndexPath:%@",indexPath);
    return indexPath;
}

//将要取消选中行索引
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tableView:WillDeselectRowAtIndexPath:%@",indexPath);
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tableView:didSelectRowAtIndexPath:%@",indexPath);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tableView:didDeselectRowAtIndexPath:%@",indexPath);
}
@end
