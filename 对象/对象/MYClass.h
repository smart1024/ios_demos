//
//  MYClass.h
//  对象
//
//  Created by lilin on 2020/6/14.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYClass : NSObject
@property (nonatomic,copy)NSString* name;

-(void)printLocalVariable;

//方法必须在接口中声明，才能在类外部访问，否则可见性只能在类内
-(void)printGloableVariable;

-(void)printStaticVariable;

-(void)testStaticValue1;

-(void)testStaticValue2;

@end

NS_ASSUME_NONNULL_END
