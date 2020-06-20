//
//  ViewController.m
//  05_Foundation_04_NSBundle
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"myNewFile" ofType:@"txt"];
    
    NSLog(@"%@",filePath);
    
    //读取文件内容
    
    NSString* fileString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@",fileString);
    
    //为block赋值
    self.blockProperty = ^{
        NSLog(@"blockProperty被调用");
    };
    //调用block
    self.blockProperty();
    
    //blockPropertyWithInput:给Block赋值
    self.blockPropertyWithInput = ^(int i) {
        NSLog(@"Block Property with input被调用！输入的参数值是 %d",i);
    };
    
    self.blockPropertyWithInput(150);
    
    //1、无入参+无返回值 Block
    void (^blockWithoutInputAndOutput)(void) = ^(void){
        NSLog(@"欢迎访问 www.ios99.com");
    };
    
    blockWithoutInputAndOutput();
    
    //2、有入参+无返回值Block
    void (^blockWithInput)(int) = ^(int inputNum){
        NSLog(@"blockWithInput 被调用！输入参数为%d",inputNum);
    };
    blockWithInput(99);
    
    //3、有入参和有返回值Block
    int (^blockWithInputAndOutput)(int) = ^(int inputNum){
        NSLog(@"blockWithInputAndOutput 被调用！输入参数为%d",inputNum);
        return inputNum*inputNum;
    };
    
    int a = blockWithInputAndOutput(100);
    
    NSLog(@"blockWithInputAndOutput的返回值是 %d",a);
    
    //4、有多个入参
    double (^multiplyTwoValues)(double,double) = ^(double number1,double number2){
        return number1*number2;
    };
    
    double doubleNumber = multiplyTwoValues(5.0,5.6);
    
    NSLog(@"multiplyTwoValues:%f",doubleNumber);
    
    //5、无入参+有返回值
    int (^blockWithOutput)(void) = ^(void){
        NSLog(@"blockWithOutput 被调用");
        return 100;
    };
    
    int a1 = blockWithOutput();
    
    NSLog(@"blockWithOutput 的返回值：%d",a1);
    
    //操作Block外部变量:该变量必须在Block之前定义
    
    int i = 100;
    
    void (^beginBlock)(void)=^(void){
        //这时不能对i进行修改。xcode会提示错误
//        i = 101;
        NSLog(@"i 在Block中获取的值%d",i);
    };
    
    beginBlock();
    //i的值发生变化，再次打印值还是100；
    i = 200;
    
    //block只会捕捉一次i的值，i发生变化不影响已经捕捉的值
    beginBlock();
    
    NSLog(@"i 的当前值：%d",i);
    
    // 如果要修改Block之外变量必须加上__block关键字
    __block int i1 = 101;
    
    void (^withBlockWord)(void) = ^(void){
        NSLog(@"i1 在Block中获取的值：%d",i1);
        i1 = 500;
    };
    
    withBlockWord();
    i1 = 200;
    withBlockWord();
    NSLog(@"i1 的当前值：%d",i1);
    
    /**
     Block回调:
     1、定义带Block参数的方法
     2、设置调用Block调用时机
     3、调用带Block参数的方法，并传入被Block参数
     */
    
    Task* task = [[Task alloc] init];
    
    //3、定义Block中需要执行的代码
    [task beginTaskWithCallbackBlock:^{
        NSLog(@"block 中的代码被执行！现在的时间是：%@",[NSDate date]);
    }];
    
}


@end
