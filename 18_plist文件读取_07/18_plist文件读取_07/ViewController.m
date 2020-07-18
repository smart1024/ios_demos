//
//  ViewController.m
//  18_plist文件读取_07
//
//  Created by lilin on 2020/7/18.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、读取plist返回数组
    NSString* path = [[NSBundle mainBundle] pathForResource:@"website" ofType:@"plist"];
    
    NSMutableArray* mArray = [NSMutableArray arrayWithContentsOfFile:path];
    
    NSLog(@"%@",mArray);
    
    //2、读取plist返回字典
    NSString* path1 = [[NSBundle mainBundle] pathForResource:@"website1" ofType:@"plist"];
    
    NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile:path1];
    
    //这种方法不行dict = nil，为什么？
//    NSDictionary* dict = [NSDictionary dictionaryWithContentsOfURL:[NSURL URLWithString:path1]];
    
    NSLog(@"dict==%@",dict);
    
}


@end
