//
//  ViewController.m
//  17_NSOperation基本使用_03
//
//  Created by lilin on 2020/7/16.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self executeInCurrentThread];
    
//    [self excuteInQueue];
//    [self addTaskInOperation];
    
//    [self addTaskInQueue];
    
    [self addCompletionBlock];
}

//1、无队列执行任务
-(void)executeInCurrentThread{
    NSBlockOperation* task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation* task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    
    //直接调用NSOPeration类的start方法，会在当前线程中串行执行任务
    [task1 start];
    [task2 start];
}

/**
 2、在队列中执行任务
 结果：系统创建5个线程同时执行任务执行并且顺序不确定，
 */
-(void)excuteInQueue{
    NSBlockOperation* task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation* task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation* task3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task3-----%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation* task4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task4-----%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation* task5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task5-----%@", [NSThread currentThread]);
    }];
    
    //创建队列
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    //设置队列属性,最大并发操作数量
    queue.maxConcurrentOperationCount = 5;
    
    //添加任务到队列
    [queue addOperation:task1];
    [queue addOperation:task2];
    [queue addOperation:task3];
    [queue addOperation:task4];
    [queue addOperation:task5];
}

/**
 3、在任务中添加新任务
 结论：新增的任务添加到队列也是并行执行的，不存在先后、从属关系
 */
-(void)addTaskInOperation{
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    
    //task1中添加task
    [task1 addExecutionBlock:^{
        NSLog(@"task1 add task-----%@", [NSThread currentThread]);
    }];
    
    //task2中添加task
    [task2 addExecutionBlock:^{
        NSLog(@"task2 add task----%@",[NSThread currentThread]);
    }];
    
    //创建队列
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
//    queue.maxConcurrentOperationCount = 2;
    
    [queue addOperation:task1];
    [queue addOperation:task2];
}

/**
 4、在队列中直接添加新任务：也是并行执行同3
 */

-(void)addTaskInQueue{
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    //task1中添加task
    [task1 addExecutionBlock:^{
        NSLog(@"task1 add task-----%@", [NSThread currentThread]);
    }];
    //task2中添加task
    [task2 addExecutionBlock:^{
        NSLog(@"task2 add task-----%@", [NSThread currentThread]);
    }];
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    [queue addOperation:task1];
    [queue addOperation:task2];
    
    //在队列中添加任务
    [queue addOperationWithBlock:^{
        NSLog(@"queue task-----%@", [NSThread currentThread]);
    }];
}

/**
 5、在任务中创建completionBlock:在任务执行完后，才执行completionBlock任务
 */
-(void) addCompletionBlock {
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    //task1中添加task
    [task1 addExecutionBlock:^{
        NSLog(@"task1 add task-----%@", [NSThread currentThread]);
    }];
    
    //task1执行完毕后，才执行
    task1.completionBlock = ^{
        NSLog(@"task1 end!!! %@", [NSThread currentThread]);
    };
    
    //task2中添加task
    [task2 addExecutionBlock:^{
        NSLog(@"task2 add task-----%@", [NSThread currentThread]);
    }];
    
    task2.completionBlock = ^{
        NSLog(@"task2 end!!! %@", [NSThread currentThread]);
    };
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
    [queue addOperation:task1];
    [queue addOperation:task2];
    
}
@end
