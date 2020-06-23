//
//  NibView.m
//  08_XIB_自定义UIView_01
//
//  Created by lilin on 2020/6/23.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "NibView.h"

@implementation NibView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (NibView *)initFromNib{
    NSLog(@"%s",__func__);
    //加载xib文件，返回一个数组，取最后一个对象
    return [[[NSBundle mainBundle] loadNibNamed:@"NibView" owner:self options:nil] lastObject];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    //
    NSLog(@"%s",__func__);
    self = [super initWithCoder:coder];
    if (self) {
//        这里可以添加一些视图定制代码
    }
    return self;
}

//定制代码也可以写在awakeFromNib中
- (void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%s",__func__);
    self.subView.backgroundColor = [UIColor blackColor];
    self.alpha = 0.5;
}

@end
