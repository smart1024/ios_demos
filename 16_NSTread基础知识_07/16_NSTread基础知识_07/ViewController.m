//
//  ViewController.m
//  16_NSTread基础知识_07
//
//  Created by lilin on 2020/7/15.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end

@implementation ViewController

-(NSString *) generateString1{
    //阻塞主进程
    [NSThread sleepForTimeInterval:3.0];
    NSString *string = @"hello world!";
    return string;
}
-(NSString *) generateString2{
    //阻塞主进程
    [NSThread sleepForTimeInterval:3.0];
    NSString *string = @"www.99iOS.com!";
    return string;
}
-(NSString *) generateString3{
    //阻塞主进程
    [NSThread sleepForTimeInterval:3.0];
    NSString *string = @"2017!";
    return string;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)showContent:(id)sender {
    NSLog(@"\n Start Time:%@, \n Current Thread: %@, \n Main Thread: %@",[NSDate date],[NSThread currentThread],[NSThread mainThread]);
    self.label1.text = [self generateString1];
    self.label2.text = [self generateString2];
    self.label3.text = [self generateString3];
    NSLog(@"\n End Time:%@, \n Current Thread: %@, \n Main Thread: %@", [NSDate date], [NSThread currentThread], [NSThread mainThread]);
}


@end
