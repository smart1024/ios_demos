//
//  MYLabel.h
//  06_KVO_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface MYLabel : UILabel
@property (nonatomic,strong) Person* viewData;
@end

NS_ASSUME_NONNULL_END
