//
//  ViewController.m
//  11_UITableView+FDTemplateLayoutCell计算Cell高度_04
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *array;

@end

@implementation ViewController

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        //设置代理和数据源
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.editing = YES;
        //UITableView的顶部视图
        UIView *tableViewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
        tableViewHeader.backgroundColor = [UIColor greenColor];
        _tableView.tableHeaderView = tableViewHeader;
        //UITableView的底部视图
        UIView *tableViewFooter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        tableViewFooter.backgroundColor = [UIColor yellowColor];
        _tableView.tableFooterView = tableViewFooter;
        
        //注册单元格
        
        NSString* cellName = NSStringFromClass(MyTableViewCell.class);
        
        [_tableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}

- (NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            MyModel *cellModel =[MyModel myCellModel];
            [_array addObject:cellModel];
        }
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell* cell = [MyTableViewCell cellWithTableView:tableView];
    cell.cellData = self.array[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"cellId" configuration:^(MyTableViewCell* cell) {
        cell.cellData = self.array[indexPath.row];
    }];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    MyModel* model = self.array[sourceIndexPath.row];
    [self.array removeObjectAtIndex:sourceIndexPath.row];
    [self.array insertObject:model atIndex:destinationIndexPath.row];
}

@end
