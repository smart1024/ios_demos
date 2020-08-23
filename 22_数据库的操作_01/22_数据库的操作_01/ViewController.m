//
//  ViewController.m
//  22_数据库的操作_01
//
//  Created by lilin on 2020/8/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
@interface ViewController ()
@property (nonatomic,assign) sqlite3* db;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self openDatabaseWithName:@"99ios.sqlite"];
    
    [self createTable];
    
    //插入一条记录
    [self insertContact:@"ios" address:@"武汉东新区" phone:@"110"];
    
    //查询一次
    [self printAllContact];
    
    //更新记录
    [self updatePhone:@"119" forContactWithName:@"ios"];
    
    //查询记录
    [self printAllContact];
    
    //删除记录name为ios的记录
    [self deleteAllContactWithName:@"ios"];
    
    [self dropTable];
    
    [self closeDb];
}

#pragma 创建数据库
- (BOOL)openDatabaseWithName:(NSString *)databaseName {
    NSString* docsDir = nil;
    NSArray* dirPath = nil;
    
    //获取文档目录路径
    dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPath objectAtIndex:0];
    
    //拼接数据库路径
    NSString* dataBasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:databaseName]];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    //将数据库路径字符串转为c字符数组
    const char* dbPath = [dataBasePath UTF8String];
    
    if (![fileManager fileExistsAtPath:dataBasePath]) { //如果Document文件夹不存在数据库就创建
        if (sqlite3_open(dbPath, &_db) == SQLITE_OK) {
            NSLog( @"数据库 创建 并打开成功：%@", dataBasePath);
            return YES;
        }else{
            NSLog( @"数据库 创建 并打开失败：%@", dataBasePath);
            return NO;
        }
    } else { //存在数据库就打开
        NSLog(@"数据库已创建: %@", dataBasePath);
        if (sqlite3_open(dbPath, &_db) == SQLITE_OK) {
            NSLog( @"数据库 打开成功：%@", dataBasePath);
            return YES;
        } else {
            NSLog( @"数据库 打开失败：%@", dataBasePath);
            return NO;
        }
    }
}

//创建数据库表
-(BOOL)createTable{
    if(NULL == _db){
        NSLog(@"创建或打开数据库失败");
        return NO;
    }
    
    char* errMsg = NULL;
    
    //拼接sql语句
    const char* sql = "create table if not exists contacts (id integer primary key autoincrement,name text,address text,phone text)";
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) != SQLITE_OK) {
        NSLog( @"创建'联系人'表失败");
        return NO;
    }
    NSLog( @"创建'联系人'表成功");
    return YES;
}

//插入记录
- (BOOL)insertContact:(NSString *)name address:(NSString *)address phone:(NSString *)phone {
    if (NULL == _db) {
        NSLog(@"数据库没打开或者数据库不存在，添加联系人失败");
        return NO;
    }
    
    char* errMsg = NULL;
    
    //拼接sql语句 values字符串需要单引号
    NSString* sqlString =[NSString stringWithFormat:@"insert into contacts (name,address,phone) values('%@','%@','%@');",name,address,phone];
    
    const char* sql = [sqlString UTF8String];
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) == SQLITE_OK) {
        NSLog( @"添加联系人成功");
        return YES;
    } else {
        NSLog( @"添加联系人失败");
        return YES;
    }
}

//查询记录
- (void)printAllContact {
    if (NULL == _db) {
        NSLog(@"数据库不存在或未打开");
        return;
    }
    //拼接sql
     const char* sql = "select * from contacts";
    
    sqlite3_stmt* stmt = NULL;
    
    //sqlite3_prepare_v2 执行语句前编译sql
    if (sqlite3_prepare_v2(_db, sql, -1, &stmt, nil) == SQLITE_OK) { //表示查询成功
        //sqlite3_step查询一条记录
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            char* name = (char*)sqlite3_column_text(stmt, 1);
            NSString* nameString = [[NSString alloc] initWithUTF8String:name];
            
            char* address = (char*)sqlite3_column_text(stmt, 2);
            NSString* addressString = [[NSString alloc] initWithUTF8String:address];
            
            char* phone = (char*)sqlite3_column_text(stmt, 3);
            NSString* phoneString = [[NSString alloc] initWithUTF8String:phone];
            
            NSLog(@"name: %@, address: %@, phone: %@", nameString, addressString, phoneString);
        }
    }
    
    //sqlites_prepare_v2需要成对出现，否则会内存泄漏
    sqlite3_finalize(stmt);
}

//更新表中记录
- (BOOL)updatePhone:(NSString *)phone forContactWithName:(NSString *)name {
    if (NULL == _db) {
        NSLog(@"数据库不存在，更新联系人失败");
        return NO;
    }
    char *errMsg = NULL;
    NSString* sqlString = [NSString stringWithFormat:@"update contacts set phone = '%@' where name = '%@'",phone,name];
    
    const char* sql = [sqlString UTF8String];
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) ==SQLITE_OK) {
        NSLog( @"更新联系人成功");
        return YES;
    } else {
        NSLog( @"更新联系人失败");
        return YES;
    }
    
}


//删除表中一条记录
- (BOOL)deleteAllContactWithName:(NSString *)name {
    if (NULL == _db) {
        NSLog(@"数据库不存在，删除联系人失败");
        return NO;
    }
    char *errMsg = NULL;
    
    NSString* sqlString = [NSString stringWithFormat:@"delete from contacts where name = '%@'",name];
    const char* sql = [sqlString UTF8String];
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) == SQLITE_OK) { //sql执行成功
        NSLog( @"删除联系人成功");
        return YES;
    } else {
        NSLog( @"删除联系人失败");
        return NO;
    }
}


//删除数据库表
- (BOOL)dropTable {
    if (NULL == _db) {
        NSLog(@"数据库不存在或数据库未打开");
        return NO;
    }
    char* errMsg = NULL;
    
    const char* sql = "drop table contacts";
    
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) == SQLITE_OK) {
        NSLog( @"删除'联系人'表成功");
        return YES;
    }else{
        NSLog( @"删除'联系人'表失败");
        return NO;
    }
}

-(void)closeDb{
    if (NULL != _db) {
        sqlite3_close(_db);
        NSLog(@"数据库已关闭");
    }else{
        NSLog(@"数据库不存在");
    }
}
@end
