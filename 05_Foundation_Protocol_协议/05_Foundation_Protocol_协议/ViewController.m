//
//  ViewController.m
//  05_Foundation_Protocol_协议
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
/**
 协议解决什么问题？
 1、协议用来解决对象间通信问题
 2、协议提升该类的通用性，所有遵守协议的类，具体实现可各不相同
 
 1、协议(Protocol):多个类共享一个方法列表，在协议中列出的方法，在定义协议的类中没有具体实现，
 协议中的方法实现是在遵守协议的类中完成的
 2、遵守协议中定义的方法，在不同类中可有不同功能
 3、协议的种类：代理协议（委托别人办事）、数据源协议等
 4、协议实现步骤：
    1>添加协议，并设置协议中包含的方法，同时添加一个属性用于设置遵守协议的对象
    2>设置触发协议中方法的时机，如点击事件
    3>在遵守协议的类中，实现协议中方法的具体功能
 */
#import "MYView.h"

/**
 1、类的扩展一般写在.m文件中，不需要单独建立一个扩展文件
 类的扩展class extention：匿名分类（不要指定名字的分类）
 */
@interface ViewController ()<MyViewDelegate>
@property (nonatomic,strong) MYView* myView;
@end

@implementation ViewController

/**
 属性懒加载
 */
-(MYView*)myView{
    if (_myView==nil) {
        _myView = [[MYView alloc] init];
        _myView.frame = CGRectMake(0, 500, 320, 50);
        _myView.backgroundColor = [UIColor yellowColor];
        _myView.delegate = self;
    }
    return _myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myView];
}

- (void)myView:(MYView *)myView clickMYButtonShowAlert:(NSString *)message{
    NSLog(@"%s",__func__);
    NSLog(@"传递的消息是：%@",message);
}

@end
