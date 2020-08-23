//
//  TableViewCell.m
//  23_FMDB数据库框架的使用_01
//
//  Created by lilin on 2020/8/23.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableview{
    static NSString *cellID = @"cell";
    
    TableViewCell* cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
