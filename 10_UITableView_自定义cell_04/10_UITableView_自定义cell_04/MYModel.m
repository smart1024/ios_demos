//
//  MyModel.m
//  8.2.10
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYModel.h"
@implementation MYModel
+(instancetype)myCellModel {
    MYModel *cellModel = [[MYModel alloc]init];
    cellModel.userName = @"99iOS";
    cellModel.profileImageName = @"99logo";
    cellModel.iconName = @"99logo";
    cellModel.source = @"来自99的iPhone 7 Plus";
    cellModel.content = @"苹果iOS开发进阶之路";
    return cellModel;
}

@end
