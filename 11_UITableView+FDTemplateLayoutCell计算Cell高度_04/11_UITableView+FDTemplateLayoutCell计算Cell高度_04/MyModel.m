//
//  MyModel.m
//  11_UITableView+FDTemplateLayoutCell计算Cell高度_04
//
//  Created by lilin on 2020/7/3.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel
+ (instancetype)myCellModel{
    MyModel *cellModel= [[MyModel alloc]init];
    int random = arc4random_uniform(2);
    if (random == 1) {
        cellModel.content = @"使用 UITableView+FDTemplateLayoutCell 无疑是解决单元格高度计算问题的最佳实践之一，既有 iOS8 self-sizing 功能简单的 API，又可以达到 iOS7 流畅的滑动效果，还保持了最低支持 iOS6。";
    }else{
        cellModel.content = @"www.99iOS.com";
    }
    return cellModel;
}
@end
