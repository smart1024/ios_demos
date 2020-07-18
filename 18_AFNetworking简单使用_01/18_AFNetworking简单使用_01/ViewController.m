//
//  ViewController.m
//  18_AFNetworking简单使用_01
//
//  Created by lilin on 2020/7/18.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    NSString* url = @"http://v.juhe.cn/weixin/query";
    NSDictionary* parameters = [NSDictionary dictionaryWithObject:@"836d1b30b88ba5d8e73430143e2392c5" forKey:@"key"];
    
    [manager POST:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%lld",uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //获取所需数据
        NSDictionary *dict = [responseObject objectForKey:@"result"];;
        NSArray *arr = dict[@"list"];
        NSDictionary *dic = arr[2];
        NSLog(@"%@",dic[@"title"]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
    
    [manager GET:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       NSDictionary* dict = [responseObject objectForKey:@"result"];
        NSArray *arr = dict[@"list"];
        NSDictionary *dic = arr[2];
        NSLog(@"%@",dic[@"title"]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
   
}


@end
