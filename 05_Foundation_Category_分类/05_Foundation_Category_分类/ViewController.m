//
//  ViewController.m
//  05_Foundation_Category_分类
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+DefaultImage.h"
/**
 1、为什么要引入分类？
 新建一个子类，然后在子类中实现新的功能，但是会增加很多类，增加维护工作量，因此引入分类
 2、分类(Category):在原有系统类中定义新方法
 3、不要用分类去重写已经存在的方法
 4、通过使用分类添加的方法，不仅针对该类，对于其子类也有效。例如给UIView添加的分类，UIImageView和UIButton等子类也可以使用
 5、类+分类名称必须唯一
 
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView = [UIImageView imageViewWithDefaultImage];
    NSLog(@"%@",imageView.image);
}


@end
