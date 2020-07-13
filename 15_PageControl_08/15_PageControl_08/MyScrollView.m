//
//  MyScrollView.m
//  15_PageControl_08
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat contentSizeWidth = [UIScreen mainScreen].bounds.size.width*4;
        self.contentSize = CGSizeMake(contentSizeWidth, 0);
        self.contentOffset = CGPointZero;
        self.pagingEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
        self.clipsToBounds = NO;
        [self addImageView];
    }
    return self;
}

-(void)addImageView{
    for (int i =0; i<4; i++) {
        //获取图片尺寸
        NSString* imageName = [NSString stringWithFormat:@"99logo_%02d.jpg",i];
        UIImage* image = [UIImage imageNamed:imageName];
        CGFloat imageWidth = image.size.width;
        CGFloat imageHeight = image.size.height;
        CGFloat imageWHRatio = imageWidth/imageHeight;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat imageViewX = i*screenWidth;
        //求图片等比例缩放高度
        CGFloat imageViewHeight = screenWidth / imageWHRatio;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, 0, screenWidth, imageViewHeight)];
        imageView.image = image;
        [self addSubview:imageView];
    }
}
@end
