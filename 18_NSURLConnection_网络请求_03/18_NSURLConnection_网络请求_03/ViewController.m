//
//  ViewController.m
//  18_NSURLConnection_网络请求_03
//
//  Created by lilin on 2020/7/18.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
@property (nonatomic,strong)NSMutableData* myData;
@end

@implementation ViewController

- (NSMutableData *)myData{
    if (_myData == nil) {
        _myData = [[NSMutableData alloc] init];
    }
    return _myData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:@"http://v.juhe.cn/weixin/query?"];
    //封装请求，这里的request是可变的，重要数据会在保密后接在url上
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    //设置请求方式
    [request setHTTPMethod:@"POST"];
    
    NSData* data = [@"key=836d1b30b88ba5d8e73430143e2392c5" dataUsingEncoding:NSUTF8StringEncoding];
    
    //设置请求体
    [request setHTTPBody:data];
    
    //发送请求
    NSURLResponse* response = nil;
    NSError* error = nil;
    
    //1、发送同步请求
//    NSData* content = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//
//    NSError *newError = nil;
//
//    NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingMutableContainers error:&newError];
//    NSDictionary *dict = dictionary[@"result"];
//    NSArray *arr = dict[@"list"];
//    NSDictionary *dic = arr[2];
//    NSLog(@"%@",dic[@"title"]);
    
    
    //2、使用代理访问网络
    [NSURLConnection connectionWithRequest:request delegate:self];
}


//连接失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    //  获取到对应错误信息。
    if(error) {
        NSLog(@"%@", [error localizedDescription]);
    }
}

//收到服务器响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"收到服务器响应");
}

//加载到数据可以多次拼接获取的数据 (self.myData是NSMutableData类型属性，是保存多次接收的数据的一个容器)
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"收到数据");
    [self.myData appendData:data];
}

//加载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSError *error = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:self.myData options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
     if(error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    NSDictionary *dict = dictionary[@"result"];
    NSArray *arr = dict[@"list"];
    NSDictionary *dic = arr[2];
    NSLog(@"%@",dic[@"title"]);
}

@end
