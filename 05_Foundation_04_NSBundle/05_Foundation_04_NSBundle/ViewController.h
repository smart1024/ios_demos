//
//  ViewController.h
//  05_Foundation_04_NSBundle
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//定义一个Block属性，无参数、不返回值
@property(copy) void (^blockProperty)(void);

@property(copy,nonatomic) void (^blockPropertyWithInput)(int);//Block有参数，无返回值
@end

