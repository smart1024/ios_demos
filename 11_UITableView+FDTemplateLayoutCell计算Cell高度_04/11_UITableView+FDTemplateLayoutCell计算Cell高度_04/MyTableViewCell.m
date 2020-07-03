//
//  MyTableViewCell.m
//  11_UITableView+FDTemplateLayoutCell计算Cell高度_04
//
//  Created by lilin on 2020/7/3.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation MyTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"cellId";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSString* cellName = NSStringFromClass([self class]);
        //IB中创建cell
        cell = [[[NSBundle mainBundle] loadNibNamed:cellName owner:self options:nil] lastObject];
    }
    return cell;
}

- (void)setCellData:(MyModel *)cellData{
    _cellData = cellData;
    self.content.text = cellData.content;
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
