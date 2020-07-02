//
//  MyTableViewCell.h
//  8.2.10
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYModel.h"
@interface MYTableViewCell : UITableViewCell
@property(nonatomic,strong)MYModel *cellData;
+(instancetype) cellWithTableView:(UITableView *)tableview;
@end
