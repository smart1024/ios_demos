//
//  MYView.h
//  05_Foundation_Protocol_协议
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MYView;

//定义代理协议名称、方法、添加代理属性(weak)
@protocol MyViewDelegate <NSObject>

-(void)myView:(MYView*) myView clickMYButtonShowAlert:(NSString*)message;

@end

@interface MYView : UIView

@property (nonatomic,weak) id<MyViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
