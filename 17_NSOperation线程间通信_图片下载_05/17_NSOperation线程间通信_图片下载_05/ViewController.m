//
//  ViewController.m
//  17_NSOperation线程间通信_图片下载_05
//
//  Created by lilin on 2020/7/16.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)downloadImage:(id)sender {
    
    NSBlockOperation* downLoadTask = [NSBlockOperation blockOperationWithBlock:^{
        NSString *urlStr = @"http://qiniu.99ios.com/99logo.png";
        NSURL* url = [NSURL URLWithString:urlStr];
        NSData* data = [NSData dataWithContentsOfURL:url];
        UIImage* image = [UIImage imageWithData:data];
        //切换到主线程,主队列
        NSOperationQueue* queue = [NSOperationQueue mainQueue];
        
        //向主队列添加任务并执行赋值操作
        [queue addOperationWithBlock:^{
            self.imageView.image = image;
        }];
    }];
    
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
    //添加任务并执行
    [queue addOperation:downLoadTask];
}

@end
