//
//  MyTableViewCell.m
//  11_Cell高度设置_02
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation MyTableViewCell

+(instancetype) cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"cell";
    MyTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //IB中创建cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:self options:nil] lastObject];
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
