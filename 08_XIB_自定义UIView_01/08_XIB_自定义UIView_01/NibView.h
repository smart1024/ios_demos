//
//  NibView.h
//  08_XIB_自定义UIView_01
//
//  Created by lilin on 2020/6/23.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NibView : UIView
@property (nonatomic,weak) IBOutlet UIView* subView;
+(NibView*) initFromNib;
@end

NS_ASSUME_NONNULL_END
