//
//  MyModel.h
//  11_代码动态计算Cell高度_03
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MyModel : NSObject
@property (nonatomic,copy) NSString *profileImageName;//头像
@property (nonatomic,copy) NSString *userName;//发送用户
@property (nonatomic,copy) NSString *source;//设备来源
@property (nonatomic,copy) NSString *content;//内容
@property (nonatomic,copy) NSString *iconName;//小图标
@property (nonatomic,assign) CGFloat cellLabelHeight;
+(instancetype)myCellModel;
@end

NS_ASSUME_NONNULL_END
