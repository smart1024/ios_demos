//
//  DestinationViewController.h
//  15_使用block界面间回传数据_04
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DestinationViewController : UIViewController

//声明一个名为PassDataBlock的block，无返回值，带有一个NSString类型参数
typedef void (^PassDataBlock)(NSString* dataText);

//添加PassDataBlock类型数据
@property (nonatomic,copy) PassDataBlock block;
@end

NS_ASSUME_NONNULL_END
