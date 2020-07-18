//
//  ViewController.m
//  18_NSURLSession使用_04
//
//  Created by lilin on 2020/7/18.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://v.juhe.cn/weixin/query?"];
    //创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"key=836d1b30b88ba5d8e73430143e2392c5" dataUsingEncoding:NSUTF8StringEncoding];
    
    //创建NSURLSession对象
    NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    //创建任务
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //请求成功
        NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //获取所需数据
        NSDictionary *dict = dictionary[@"result"];
        NSArray *arr = dict[@"list"];
        NSDictionary *dic = arr[0];
        NSLog(@"%@",dic[@"title"]);
    }];
    
    [task resume];
    
    //下载一张图片
    NSURLSession* downloadSession = [NSURLSession sharedSession];
    NSURL *downUrl = [NSURL URLWithString:@"http://qiniu.99ios.com/99ios/1479730067100.png"] ;
    NSURLSessionDownloadTask* downLoadTask = [downloadSession downloadTaskWithURL:downUrl completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //location是沙盒中tmp文件夹下的一个临时url,文件下载后会存到这个位置,由于tmp中的文件随时可能被删除,所以我们需要自己需要把下载的文件挪到需要的地方
      NSString* path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
    
        //打印文件存储路径
        NSLog(@"path = %@",path);
        //剪切文件
        [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:path] error:nil];
    }];
    
    [downLoadTask resume];
}

// 关闭session的g回调
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error{
    
}

//与证书相关的方法
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    
}

//后台任务完成后调用的方法
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session{
    NSLog(@"URLSessionDidFinishEventsForBackgroundURLSession");
}

@end
