//
//  MyModel.m
//  11_代码动态计算Cell高度_03
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MyModel.h"
#import "NSString+Extent.h"

@implementation MyModel
+ (instancetype)myCellModel{
    MyModel *cellModel = [[MyModel alloc]init];
    cellModel.userName = @"99iOS";
    cellModel.profileImageName = @"99logo";
    cellModel.iconName = @"99logo";
    cellModel.source = @"来自99iOS的iPhone 7";
    //创建随机数，根据不同的内容显示不同高度的cell
    int random = arc4random_uniform(2);
    if (random == 1) {
        cellModel.content = @"一个国家的人权状况好不好，本国人民最有发言权。中国政府始终坚持以人民为中心，坚持在发展中促进和保护人权，坚持走中国特色的人权发展道路，取得了举世瞩目的人权成就。在960万平方公里的土地上，没有战乱、没有流离失所、没有恐惧，14亿多中国人民过着安宁、自由、幸福的生活。这是最大的人权工程，最好的人权实践，也是中国对世界人权事业的巨大贡献。";
    }else{
        cellModel.content = @"苹果iOS开发进阶之路";
    }
    
    
    //计算单元格高度
    CGFloat contentLabelHeight = [cellModel.content heightWithText:cellModel.content FontSize:[UIFont systemFontOfSize:17.0] LabelWidth:[UIScreen mainScreen].bounds.size.width-20];
    
    cellModel.cellLabelHeight = 10+100+10+contentLabelHeight+10;
    
    return cellModel;
}
@end
