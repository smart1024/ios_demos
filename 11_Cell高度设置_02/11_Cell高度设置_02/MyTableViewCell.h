//
//  MyTableViewCell.h
//  11_Cell高度设置_02
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

@property (nonatomic,strong) MYModel *cellData;

+(instancetype) cellWithTableView:(UITableView *)tableview;
@end

NS_ASSUME_NONNULL_END
