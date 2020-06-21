//
//  ViewController.m
//  06_KVO_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "MYLabel.h"
/**
 1、KVO(Key Value Observing):键值观察(观察者模式)
 2、MVVM设计模式中，需要双向绑定机制，数据模型发生变化，立即呈现到视图view上去，KVO可以实现数据模型和视图的联动机制
 3、KVO本质是一种观察者模式，容易实现视图View和数据模型的分离，当数据模型属性值发生改变，作为监听器的视图组件会触发特定方法，在该方法中获取模型变更，从而更新界面
 */
@interface ViewController () //扩展（extension）：定义类的私有属性和私有方法
@property (nonatomic,strong) Person* myPerson;
@property (nonatomic,strong) MYLabel* myLabel;

@end

@implementation ViewController

//myLabel 的getter方法,延迟加载myLabel属性
- (MYLabel *)myLabel{
    if (_myLabel == nil) {
        _myLabel = [[MYLabel alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
        _myLabel.backgroundColor = [UIColor redColor];
        _myLabel.textColor = [UIColor whiteColor];
    }
    return _myLabel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    将myLabel添加到view中
    [self.view addSubview:self.myLabel];
    
    //创建数据模型对象
    Person* p = [[Person alloc] init];
    self.myPerson = p;
    
    //添加观察者,观察name的变化
    [p addObserver:self.myLabel forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.myPerson.name = [NSString stringWithFormat:@"%d",arc4random_uniform(1000000)];
}

@end
