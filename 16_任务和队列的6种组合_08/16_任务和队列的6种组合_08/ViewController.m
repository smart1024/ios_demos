//
//  ViewController.m
//  16_任务和队列的6种组合_08
//
//  Created by lilin on 2020/7/15.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/**
 1、同步任务在当前线程中完成
 2、异步任务在新线程中完成，主队列除外
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、异步任务+并行队列：会开启多个新线程，并行执行
//    [self asyncTaskParallelQueue];
    
    //2、异步任务+串行队列：会开启一个新线程串行执行
//    [self asyncTaskSerialQueue];
    
    //3、异步任务+主队列：异步任务在主队列中也不会创建新的线程，因此会串行执行
//    [self asyncTaskMainQueue];
    
    //4、同步任务+并行队列：同步任务在当前线程中完成,因此会串行执行任务
//    [self syncTaskParallelQueue];
    
    //5、同步任务+串行队列:会串行执行
//    [self syncTaskSerialQueue];
    
    /**
    6、同步任务+主队列（死锁原因）：根本原因dispatch_sync会阻塞等待任务执行完才返回，阻塞了主线程，因此任务block无法抢占主线程资源
同步执行：比如这里的dispatch_sync，这个函数会把一个block加入到指定的队列中，而且会一直等到执行完blcok，这个函数才返回。因此在block执行完之前，调用dispatch_sync方法的线程是阻塞的。
     */
    [self syncTaskMainQueue];
}

/**
 1、异步任务+并行队列
 */
-(void)asyncTaskParallelQueue{
    /**
     1、并行队列和异步任务，最常见组合：任务会在不同线程中执行
     */
    //获取并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    
    //创建3个异步任务，并添加到队列中
    dispatch_async(queue, ^{
        for (int i =0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1---%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        for (int i =0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2---%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        for (int i =0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3---%@",[NSThread currentThread]);
    });
}

/**
 2、异步任务+串行队列:会在新开的一个线程中，顺序执行任务
 */
-(void)asyncTaskSerialQueue{
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("com.99ios", NULL);
    
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3----%@",[NSThread currentThread]);
    });
}

/**
 3、异步任务+主队列:主队列是特殊串行队列，即使是异步任务也不会创建新线程，因此也是先进先出原则执行
 */
-(void)asyncTaskMainQueue{
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3----%@",[NSThread currentThread]);
    });
}

/**
 4、同步任务+并行队列：同步任务在当前线程中完成,由于只有一个线程，因此执行效果也是串行执行
 */
-(void)syncTaskParallelQueue{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3----%@",[NSThread currentThread]);
    });
}

/**
 5、同步任务+串行队列:同步任务会在当前线程中执行，串行队列，因此串行执行
 */
-(void)syncTaskSerialQueue{
    dispatch_queue_t queue = dispatch_queue_create("com.99ios", NULL);
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3----%@",[NSThread currentThread]);
    });
}

/**
 同步任务+主队列:主队列也是串行队列，但是会死锁
 */
-(void)syncTaskMainQueue{
    dispatch_queue_t queue = dispatch_get_main_queue();
    //1
    dispatch_sync(queue, ^{ //block 1
        for (int i = 0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1----%@",[NSThread currentThread]);
    });
    //2
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2----%@",[NSThread currentThread]);
    });
    //3
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3----%@",[NSThread currentThread]);
    });
}
@end
