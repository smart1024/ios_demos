//
//  MyTableViewCell.m
//  8.2.10
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYTableViewCell.h"

@interface MYTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation MYTableViewCell

+(instancetype) cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"cell";
    MYTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //IB中创建cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MYTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.profileImageView.layer.masksToBounds = YES;
    self.profileImageView.layer.borderWidth = 1;
    self.iconImageView.layer.masksToBounds =YES;
    self.iconImageView.layer.borderWidth = 1;
    self.contentLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)setCellData:(MYModel *)cellData {
    _cellData = cellData;
    self.profileImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",cellData.profileImageName]];
    self.userNameLabel.text = cellData.userName;
    self.sourceLabel.text = cellData.source;
    self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",cellData.iconName]];
    self.contentLabel.text = cellData.content;
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
