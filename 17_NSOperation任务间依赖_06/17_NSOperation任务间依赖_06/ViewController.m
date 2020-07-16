//
//  ViewController.m
//  17_NSOperation任务间依赖_06
//
//  Created by lilin on 2020/7/16.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)downloadTwoImage:(id)sender {
    NSBlockOperation* task1 = [NSBlockOperation blockOperationWithBlock:^{
        //下载网络图片
        NSString *urlStr = @"http://qiniu.99ios.com/99logo.png";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        NSOperationQueue* queue = [NSOperationQueue mainQueue];
        
        [queue addOperationWithBlock:^{
            self.imageView1.image = image;
            NSLog(@"图片1设置成功");
        }];
        
    }];
    
    NSBlockOperation* task2 = [NSBlockOperation blockOperationWithBlock:^{
        //下载网络图片
        NSString *urlStr = @"http://qiniu.99ios.com/99logo.png";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        NSOperationQueue* queue = [NSOperationQueue mainQueue];
        
        [queue addOperationWithBlock:^{
            self.imageView2.image = image;
            NSLog(@"图片2设置成功");
        }];
    }];
    
    NSBlockOperation *task3 = [NSBlockOperation blockOperationWithBlock:^{
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.label.text = @"下载完成";
            NSLog(@"下载完成设置成功");
        }];
    }];
    
    //设置任务间依赖关系因此顺序为 1->2->3先后执行
    [task3 addDependency:task1];
    [task3 addDependency:task2];
    [task2  addDependency:task1];
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    [queue addOperation:task1];
    [queue addOperation:task2];
    [queue addOperation:task3];
}

@end
