//
//  NSString+Extent.h
//  11_代码动态计算Cell高度_03
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extent)
//文字内容、字体大小、控件宽度，决定了文字的高度
- (CGFloat) heightWithText:(NSString *) text FontSize:(UIFont *) font LabelWidth:(CGFloat) width;
@end

NS_ASSUME_NONNULL_END
