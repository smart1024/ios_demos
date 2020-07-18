//
//  ViewController.m
//  18_Plist简单使用_06
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
    //读取Plist文件
    NSString* path = [[NSBundle mainBundle] pathForResource:@"website" ofType:@"plist"];
    NSLog(@"path = %@",path);
    NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"dict=%@",dict);
}


@end
