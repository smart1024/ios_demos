//
//  ViewController.m
//  15_WKWebView加载本地文件_07
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
//webView加载监听实现代理
@interface ViewController ()<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic,strong) WKWebView* webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    //包装文件路径供webView加载
    NSURL* url = [NSURL fileURLWithPath:@"/Users/lilin/Desktop/李玲_Android开发.pdf"];
    //页面加载相关的代理
    self.webView.navigationDelegate = self;
    //界面显示相关的代理
    self.webView.UIDelegate = self;
    [self.webView loadFileURL:url allowingReadAccessToURL:url];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.webView];
}

//网页开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"%s",__func__);
}

//刚获取到网页内容
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"%s",__func__);
}

//加载完毕时调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"%s",__func__);
}


@end
