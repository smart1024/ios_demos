//
//  MYView.m
//  05_Foundation_Protocol_协议
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MYView.h"

@implementation MYView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(myView:clickMYButtonShowAlert:)]) {
        [self.delegate myView:self clickMYButtonShowAlert:@"视图被点击了"];
    }
}

@end
