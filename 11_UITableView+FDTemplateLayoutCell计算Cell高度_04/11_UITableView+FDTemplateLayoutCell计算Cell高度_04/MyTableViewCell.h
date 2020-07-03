//
//  MyTableViewCell.h
//  11_UITableView+FDTemplateLayoutCell计算Cell高度_04
//
//  Created by lilin on 2020/7/3.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property(nonatomic,strong) MyModel* cellData;
+(instancetype)cellWithTableView:(UITableView*) tableView;

@end

NS_ASSUME_NONNULL_END
