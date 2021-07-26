//
//  ViewController.m
//  07_UIView_03
//
//  Created by lilin on 2020/6/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "MYView.h"
#import "objc/runtime.h"
/**
 1、视图UIView外观
 Frame:UIView在父视图坐标系中位置和大小
 Bounds:UIView自身的坐标系中位置和大小，Bounds.orign始终是(0,0)，bounds的核心作用设置视图大小
 Center:视图中心点在父视图坐标系中的位置，当需要修改视图对象位置，可以修改Center属性
 
 2、视图UIView的形变
    1>位移
    2>放大、缩小：
        两种方式修改bounds.size
        或transform属性,要用到CGAffineTransformScale()函数
    3>旋转
        修改transform属性要用到CGAffineTransformRotate()函数
    4>重置Transform属性
    使用CGAffineTransformIdentity命令，注意如果frame、center、bounds修改了，还需重置这三个属性，因此对视图形变操作之前，有必要保存视图原始状态一边恢复
 3.响应用户交互：手势和触摸事件
 4、contentMode：内容模式：决定边界变化和缩放操作作用f到视图上产生的效果，视图内容由layer图层缓存，视图大小发生变化，UIKit不强制重绘，而根据contentMode决定如何显示缓存,因此修改试图大小是，这种机制可提升性能
 
 调整控件尺寸是，优先考虑contentMode，因为视图发生行变时，可避免编写定制绘制代码，因为每个视图关联的图像由Core Animation来缓存，因此不需要编写代码就可以支持动画即不需要再次调用drawRect:,提高了性能
 contentMode使用场景:
    1、改变frame或bounds中的高度和宽度
    2、修改Transform属性
 
5、图片拉伸：类似.9png功能
 1、xcode Slicing功能
 2、UIImage resizableImageWithCapInsets:方法实现拉伸(可理解为Slicing代码实现版)
 开发中优先使用Slicing功能
    
 */
@interface ViewController ()
@property (nonatomic,strong) UIView* myView;
@end

@implementation ViewController

- (UIView *)myView{
    if (_myView==nil) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
        _myView.backgroundColor = [UIColor redColor];
    }
    return _myView;
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(jkviewDidLoad);
        
        Method originalMethod = class_getInstanceMethod(class,originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
        
        //judge the method named  swizzledMethod is already existed.
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        // if swizzledMethod is already existed.
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)jkviewDidLoad {
    NSLog(@"替换的方法");
//    [self jkviewDidLoad];
}

- (void)viewDidLoad11{
    NSLog(@"viewDidLoad11替换的方法");
//    [self viewDidLoad11];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoad11];
   //添加yellowView到控制器视图self.view
    UIView* yellowView = [[UIView alloc] init];
    yellowView.frame = CGRectMake(100, 100, 200, 200);
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    NSLog(@"yellowView.frame:%@",NSStringFromCGRect(yellowView.frame));
    
    NSLog(@"yellowView.bounds:%@",NSStringFromCGRect(yellowView.bounds));
    
    NSLog(@"yellowView.center:%@",NSStringFromCGPoint(yellowView.center));
    
    //添加redView到控制器视图self.view
    UIView* redView= [[UIView alloc] init];
    redView.frame = CGRectMake(0, 0, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    NSLog(@"redView.frame:%@",NSStringFromCGRect(redView.frame));
    
    NSLog(@"redView.bounds:%@",NSStringFromCGRect(redView.bounds));
    
    NSLog(@"redView.center:%@",NSStringFromCGPoint(redView.center));

    UIView* blueView = [[UIView alloc] init];
    blueView.frame = CGRectMake(0, 0, 100, 100);
    blueView.backgroundColor = [UIColor blueColor];
    [yellowView addSubview:blueView];
    
    NSLog(@"blueView.frame:%@",NSStringFromCGRect(blueView.frame));
    
    NSLog(@"blueView.bounds:%@",NSStringFromCGRect(blueView.bounds));
    
    NSLog(@"blueView.center:%@",NSStringFromCGPoint(blueView.center));
    
    
    [self.view addSubview:self.myView];
    
    //添加长按手势
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction)];
    
    [self.myView addGestureRecognizer:longPress];
    
    //添加点击手势
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [self.myView addGestureRecognizer:tap];
    
    //打印所有手势对象
    
    NSLog(@"myView gesture:%@",self.myView.gestureRecognizers);
    
    MYView* customView = [[MYView alloc] initWithFrame:CGRectMake(0, 150, 100, 100)];
    [self.view addSubview:customView];
}

-(void)longPressAction{
    NSLog(@"%s",__func__);
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"长按了" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        NSLog(@"长按alert点击ok了");
    }];
     
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)tapAction{
    NSLog(@"%s",__func__);
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        NSLog(@"点击alert点击ok了");
    }];
     
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//
- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
