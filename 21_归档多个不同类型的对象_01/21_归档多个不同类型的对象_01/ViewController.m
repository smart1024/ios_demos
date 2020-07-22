//
//  ViewController.m
//  21_归档多个不同类型的对象_01
//
//  Created by lilin on 2020/7/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "ArchiveService.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ArchiveService writeMultiTypesObjectsToArchiveFile];
    [ArchiveService readSMultiTypesObjectsFromArchiveFile];
}


@end
