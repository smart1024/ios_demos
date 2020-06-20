//
//  UIImageView+DefaultImage.m
//  05_Foundation_Category_分类
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "UIImageView+DefaultImage.h"

@implementation UIImageView (DefaultImage)
+ (UIImageView *)imageViewWithDefaultImage{
    UIImage* image = [UIImage imageNamed:@"placeholder"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}
@end
