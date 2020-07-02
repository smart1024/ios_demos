//
//  NSString+Extent.m
//  11_代码动态计算Cell高度_03
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "NSString+Extent.h"

@implementation NSString (Extent)

//计算文字的高度
- (CGFloat)heightWithText:(NSString *)text FontSize:(UIFont *)font LabelWidth:(CGFloat)width{
    NSDictionary* attributes = @{NSFontAttributeName:font};
    CGSize contentSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return contentSize.height;
}
@end
