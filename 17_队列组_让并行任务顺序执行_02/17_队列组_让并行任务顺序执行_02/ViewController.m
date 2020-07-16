//
//  ViewController.m
//  17_队列组_让并行任务顺序执行_02
//
//  Created by lilin on 2020/7/16.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *task1ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *task2ImageView;
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)startTask:(id)sender {
    NSLog(@"0--%@", [NSThread currentThread]);
    //创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    //创建并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //创建队列组中的第一个异步任务
    dispatch_group_async(group, queue, ^{
        NSLog(@"1.1--%@", [NSThread currentThread]);
        
        //下载图片
        NSString *urlStr = @"http://qiniu.99ios.com/99logo.png";
        
        NSURL* url = [NSURL URLWithString:urlStr];
        
        NSData* data = [NSData dataWithContentsOfURL:url];
        
        UIImage* image = [UIImage imageWithData:data];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.task1ImageView.image = image;
        });
        
    });
    
    //创建队列组第二个异步任务
    dispatch_group_async(group, queue, ^{
        NSLog(@"2.1--%@", [NSThread currentThread]);
        NSString *urlStr = @"http://qiniu.99ios.com/99logo.png";
        NSURL* url = [NSURL URLWithString:urlStr];
        NSData* data = [NSData dataWithContentsOfURL:url];
        UIImage* image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.task2ImageView.image = image;
        });
    });
    
    //等待队列组中任务完成后执行的动作
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"3--%@", [NSThread currentThread]);
        self.taskLabel.text = @"下载完成";
    });
}

@end
