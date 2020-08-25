//
//  ViewController.m
//  LeanCoreData
//
//  Created by lilin on 2020/8/24.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Person+CoreDataClass.h"

@interface ViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) IBOutlet UITableView* tableView;
@property (nonatomic,strong) UIAlertController* alert;
@property (nonatomic,strong) NSMutableArray<Person*>* personList;

@end

@implementation ViewController



#pragma mark - Getter
- (NSMutableArray<Person *> *)personList {
    if (nil == _personList) {
        _personList = [NSMutableArray<Person *> arrayWithCapacity:10];
    }
    return _personList;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.alert dismissViewControllerAnimated:YES completion:^{
        NSLog(@"%@", textField.text);
        // 1. 获取NSManagedObjectContext对象
        AppDelegate *appDelegate = (id)[UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        // 2. 创建Person实体描述
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person"
                                                  inManagedObjectContext:context];
        // 3. 创建一个Person实体
        Person *person = (id)[[NSManagedObject alloc] initWithEntity:entity
                                      insertIntoManagedObjectContext:context];
        person.name = textField.text;
        // 4. 添加Person实体到UITableView数据源
        [self.personList addObject:person];
        [self.tableView reloadData];
    }];
    self.alert = nil;
    return YES;
}

- (IBAction)onClickedAddButton:(id)sender {
    self.alert = [UIAlertController alertControllerWithTitle:@"添加名字" message:nil preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self) weakSelf = self;
    [self.alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.delegate = weakSelf;
    }];
    [self presentViewController:self.alert animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //1、获取NSManageObjectContext对象
    AppDelegate* appDelegate = (id)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = appDelegate.persistentContainer.viewContext;
    
    //2、生成一个Person查询对象
    NSFetchRequest* fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    //3、设置查询对象排序描述符，使查询结果按需排序
    NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
    NSArray* sortDescriptor = [NSArray arrayWithObject:sort];
    
    fetchRequest.sortDescriptors = sortDescriptor;
    
    //4、设置查询条件，返回true表示查询所有数据
    NSPredicate* predicate = [NSPredicate predicateWithValue:YES];
    fetchRequest.predicate = predicate;
    
    //5、执行查询语句，并更新tableView的显示
    NSArray* result = [context executeFetchRequest:fetchRequest error:nil];
    
    [self.personList addObjectsFromArray:result];
    
    //6、更新视图表
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu",self.personList.count);
    return self.personList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"TableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (cell==nil) { //如果复用队列没有cell返回
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.personList[indexPath.row].name;
    return cell;
}

@end
