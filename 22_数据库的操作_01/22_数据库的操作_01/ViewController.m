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
