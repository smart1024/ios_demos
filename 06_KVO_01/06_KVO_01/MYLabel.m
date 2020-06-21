//
//  MYLabel.m
//  06_KVO_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MYLabel.h"

@implementation MYLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//重写viewData属性的setter方法
- (void)setViewData:(Person *)viewData{
    _viewData = viewData;
    self.text = viewData.name;
}

//KVO：数据模型发生变化时调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSString* newText = change[@"new"];
    self.text = newText;
}

@end
