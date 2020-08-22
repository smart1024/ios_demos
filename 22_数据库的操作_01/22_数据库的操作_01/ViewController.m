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
    [self closeDb];
}

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

-(void)closeDb{
    if (NULL != _db) {
        sqlite3_close(_db);
        NSLog(@"数据库已关闭");
    }else{
        NSLog(@"数据库不存在");
    }
}
@end
