//
//  DestinationViewController.h
//  15_使用代理逆传数据_02
//
//  Created by lilin on 2020/7/13.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DestinationViewController;
@protocol DestinationViewControllerDelegate <NSObject>

-(void)destinationViewController:(DestinationViewController*) destinationViewController return2SrcVCWithData:(NSString*) string;

@end

@interface DestinationViewController : UIViewController
@property (nonatomic,strong) NSString* dataText;

@property (nonatomic,weak) id<DestinationViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
