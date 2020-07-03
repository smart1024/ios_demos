//
//  MyModel.h
//  11_UITableView+FDTemplateLayoutCell计算Cell高度_04
//
//  Created by lilin on 2020/7/3.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyModel : NSObject
@property(nonatomic,copy)NSString*content;
+(instancetype)myCellModel;
@end

NS_ASSUME_NONNULL_END
