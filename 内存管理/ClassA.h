//
//  ClassA.h
//  内存管理
//
//  Created by lilin on 2020/6/8.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassA : NSObject
@property (nonatomic,copy) NSMutableString* name;
@property (nonatomic,strong) NSMutableString* strongName;
@property (nonatomic,weak) NSMutableString* weakName;


//@property (nonatomic,strong) MYCLASS* myclass;
@property (nonatomic,weak) id delegate;
@property (nonatomic,assign) int age;
@property (nonatomic,copy) NSString* name1;
@property (nonatomic,copy) NSArray* courseResults;
@property (nonatomic,copy) void (^blockProperty)(void);
@end
NS_ASSUME_NONNULL_END
