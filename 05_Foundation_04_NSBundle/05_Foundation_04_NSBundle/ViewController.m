//
//  ViewController.m
//  05_Foundation_04_NSBundle
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"myNewFile" ofType:@"txt"];
    
    NSLog(@"%@",filePath);
    
    //读取文件内容
    
    NSString* fileString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@",fileString);
}


@end
