//
//  ViewController.m
//  11_Cell高度设置_02
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

/**
 Cell高度设置：很多情况单元格d高度需要根据显示内容动态调整
 有以下方法：
 1、修改tabelview.rowHeight属性（适用于高度固定情况）
 2、代理方法中修改：tableView:heightForRowAtIndexPath:，根据IndexPath给每个单元格设置高度
 3、self-sizing
    1>要求ios8以上
    2>要求自动布局定义单元格
 4、适用代码计算Cell高度，通用性强，需提前根据显示内容计算单元格高度，确定要编写很多代码，使用不方便
 5、适用第三方库UITabelView+FDTemplateLayoutCell计算单元格高度
 */

/**
 演示self-sizing：动态调整Cell高度
 1、要求ios8以上
 2、要求自动布局定义单元格
 */
#import "MyTableViewCell.h"
#import "MYModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *rowDataArray;
@end

@implementation ViewController
- (NSMutableArray *)rowDataArray {
    if (_rowDataArray == nil) {
        _rowDataArray = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            MYModel *model = [MYModel myCellModel];
            [_rowDataArray addObject:model];
        }
    }
    return _rowDataArray;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        //设置代理和数据源
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //分割线与屏幕等宽
        _tableView.separatorInset = UIEdgeInsetsMake(1, 0, 1, 0);
        //分割线颜色
        _tableView.separatorColor = [UIColor blackColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        //设置高度防止row重叠
//        _tableView.rowHeight = 155;
        
        //auto-size动态调整self-sizing
        _tableView.estimatedRowHeight = 155;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark->delegate/dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rowDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [MyTableViewCell cellWithTableView:tableView];
    MYModel * cellData = [MYModel myCellModel];
    cell.cellData = cellData;
    return cell;
}


@end
