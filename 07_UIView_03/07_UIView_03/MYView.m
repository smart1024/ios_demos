//
//  MYView.m
//  07_UIView_03
//
//  Created by lilin on 2020/6/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MYView.h"

@interface MYView ()
@property (nonatomic,strong) UIView* subView;
@end

@implementation MYView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//添加子视图，并进行懒加载
- (UIView *)subView{
    if (_subView==nil) {
        UIView* view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 0, 50, 50);
        view.backgroundColor = [UIColor blackColor];
        [self addSubview:view];
        _subView = view;
    }
    return _subView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"%s",__func__);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        self.alpha = 0.8;
        self.userInteractionEnabled = YES;
        self.multipleTouchEnabled = YES;
        //控制子视图不能超出父视图范围
        self.clipsToBounds = YES;
        
        //添加子视图
        [self subView];
        
        //添加手势
        UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction)];
        [self addGestureRecognizer:longPress];
    }
    return self;
}

//对视图外观做自定义位置需要重写此方法
- (void)drawRect:(CGRect)rect{
    NSLog(@"%s",__func__);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect myFrame = self.bounds;
    
    //添加边框
    CGContextSetLineWidth(context, 10);
    
    CGRectInset(myFrame, 5,5);
    
    [[UIColor greenColor] set];
    
    UIRectFrame(myFrame);
}

//如果需要对子视图重新布局，实现此方法
//- (void)layoutSubviews{
//
//}

-(void)longPressAction{
    NSLog(@"长按视图了");
}

//响应用户交互事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s 接收到触摸事件",__func__);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s event:%@",__func__,event);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}
@end
