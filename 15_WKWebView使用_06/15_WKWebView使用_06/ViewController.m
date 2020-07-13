//
//  ViewController.m
//  15_WKWebView使用_06
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()
@property (nonatomic,strong) WKWebView* webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    CGRect mainBounds = [UIScreen mainScreen].bounds;
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, mainBounds.size.width, mainBounds.size.height-200)];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://99ios.com"]];
    
    [self.webView loadRequest:request];
    
    [self.view addSubview:self.webView];
}

//后退
- (IBAction)goBack:(id)sender {
    [self.webView goBack];
}

//刷新
- (IBAction)reload:(id)sender {
    [self.webView reload];
}

//前进
- (IBAction)goForward:(id)sender {
    [self.webView goForward];
}

@end
