//
//  TableViewController.m
//  23_FMDB数据库框架的使用_01
//
//  Created by lilin on 2020/8/23.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "TableViewController.h"
#import "FMDBService.h"
#import "AddDataViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"
@interface TableViewController ()
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation TableViewController

- (NSArray *)dataList{
    if (_dataList == nil) {
        FMDBService *fmdbService = [[FMDBService alloc] init];
        _dataList = [fmdbService selectData];
    }
    return _dataList;
}

- (void)viewWillAppear:(BOOL)animated{ //view即将展示重新加载数据
    self.dataList = nil;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItemSelect)];
    self.navigationItem.rightBarButtonItem = addItem;
}

//打开添加数据界面
-(void)addItemSelect{
    AddDataViewController* addViewController = [[AddDataViewController alloc] initWithNibName:@"AddDataViewController" bundle:nil];
    [self.navigationController pushViewController:addViewController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 145;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    NSDictionary* dict = self.dataList[indexPath.row];
    cell.idLabel.text = dict[@"id"];
    cell.nameLabel.text = dict[@"name"];
    cell.sexLabel.text = dict[@"sex"];
    cell.ageLabel.text = dict[@"age"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.dict = self.dataList[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        FMDBService *fmdbService = [[FMDBService alloc] init];
        [fmdbService deleteDataWithDictionary:self.dataList[indexPath.row]];
        self.dataList = nil;
        [self.tableView reloadData];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
