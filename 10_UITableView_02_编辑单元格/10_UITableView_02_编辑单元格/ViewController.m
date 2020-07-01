//
//  ViewController.m
//  10_UITableView_02_编辑单元格
//
//  Created by lilin on 2020/7/1.
//  Copyright © 2020 lilin. All rights reserved.
//

/**
 TableRowAction
 列表单元格操作对象
 */
#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) int rowNum;
@end

@implementation ViewController

- (UITableView *)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.separatorInset = UIEdgeInsetsMake(1, 0, 1, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rowNum = 10;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.rowNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellID = @"cellID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"99ios";
    cell.detailTextLabel.text = @"苹果iOS开发进阶之路";
    cell.imageView.image = [UIImage imageNamed:@"image"];
    return cell;
}




//过时item的滑动操作按钮写法

//- (nullable NSArray <UITableViewRowAction *>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UIContextualAction *action1 = [UIContextualAction alloc;
//    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"移动" handler:nil];
//    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        //NumberGroup *numberGroup = self.dataList[indexPath.section];
//        NSLog(@"需要删除的单元格在第: %ld 行",(long)indexPath.row);
//        // [numberGroup.groupNumbers removeObjectAtIndex:indexPath.row];
//        [tableView reloadData];
//    }];
//    NSArray *actionArray = @[action1,action2,action3];
//    //NSArray *actionArray = @[action3];
//    return actionArray;
//}

//左侧显示滑动操作按钮
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView
leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIContextualAction * deleteAction =  [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"左侧滑动---删除");
        completionHandler(YES);
    }];
    
    UIContextualAction * signAction =  [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"编辑" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"左侧滑动---编辑");
        completionHandler(YES);
    }];
    
    NSArray<UIContextualAction *> * arrayTemp = @[deleteAction,signAction];
    UISwipeActionsConfiguration * swipeConfiguration = [UISwipeActionsConfiguration configurationWithActions: arrayTemp];
    //完全滑动时,是否执行第一个操作
    //swipeConfiguration.performsFirstActionWithFullSwipe = YES;
    return swipeConfiguration;
}

/**
 右侧显示滑动操作按钮
 */
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIContextualAction * deleteAction =  [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"右侧滑动---删除");
        [tableView reloadData];
        completionHandler(YES);
    }];
    
    UIContextualAction * signAction =  [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"编辑" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"右侧滑动---编辑");
        completionHandler(YES);
    }];
    
    NSArray<UIContextualAction *> * arrayTemp = @[deleteAction,signAction];
    UISwipeActionsConfiguration * swipeConfiguration = [UISwipeActionsConfiguration configurationWithActions: arrayTemp];
    //完全滑动时,是否执行第一个操作
    //swipeConfiguration.performsFirstActionWithFullSwipe = YES;
    return swipeConfiguration;
}

@end
