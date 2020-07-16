//
//  ViewController.m
//  17_线程间通信_任务嵌套实现_01
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

- (IBAction)downLoadImageView:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"0------%@",[NSThread currentThread]);
    
    dispatch_async(queue, ^{
        NSString *urlString = @"http://qiniu.99ios.com/99logo.png";
        
        NSURL* url = [NSURL URLWithString:urlString];
        
        NSData* data = [NSData dataWithContentsOfURL:url];
        
        UIImage* image = [UIImage imageWithData:data];
        
        //异步任务，并行队列
        NSLog(@"1---%@", [NSThread currentThread]);
        
        //到主线程更新UI,耗时操作
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            NSLog(@"2---%@", [NSThread currentThread]);
        });
        
    });
    
    NSLog(@"3---%@", [NSThread currentThread]);
}

@end
