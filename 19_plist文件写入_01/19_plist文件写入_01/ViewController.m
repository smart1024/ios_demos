//
//  ViewController.m
//  19_plist文件写入_01
//
//  Created by lilin on 2020/7/19.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setValue:@"99ios" forKey:@"webName"];
    NSLog(@"dict=%@",dict);
    
    //获取Document文件夹路径
    NSArray* documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* docPath = [documentArr objectAtIndex:0];
    
    NSLog(@"docPath=%@",docPath);
    //拼接plist完整路径
    NSString* plistPath = [docPath stringByAppendingPathComponent:@"dict.plist"];
    
    NSLog(@"plistPath=%@",plistPath);
    
    //字典或数组的writeToFile方法，写入文件
    [dict writeToFile:plistPath atomically:YES];
    
    NSString* arrPlistPath = [docPath stringByAppendingPathComponent:@"array.plist"];

    NSMutableArray* array = [NSMutableArray array];
    [array addObject:@"哈哈"];
    [array addObject:@"你好"];
    
    [array writeToFile:arrPlistPath atomically:YES];
    
}


@end
