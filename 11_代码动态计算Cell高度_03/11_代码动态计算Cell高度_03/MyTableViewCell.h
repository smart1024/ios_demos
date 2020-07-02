//
//  MyTableViewCell.h
//  11_代码动态计算Cell高度_03
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property(nonatomic,strong)MyModel *cellData;
+(instancetype) cellWithTableView:(UITableView *)tableview;
@end

NS_ASSUME_NONNULL_END
