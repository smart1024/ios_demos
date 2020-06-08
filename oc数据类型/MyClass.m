//
//  MyClass.m
//  oc数据类型
//
//  Created by lilin on 2020/6/7.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MyClass.h"

//在类的t扩展（Extention）定义私有属性，只能在类的内部使用
@interface MyClass ()
@property (nonatomic,copy) NSString* firtName;
@property (nonatomic,copy) NSString* lastName;
@end

@implementation MyClass
//firstName懒加载
-(NSString*)firtName{
    if (_firtName==nil) {
        _firtName = [NSString stringWithFormat:@"www."];
    }
    return _firtName;
}
//lastName懒加载
-(NSString*)lastName{
    if (_lastName==nil) {
        _lastName = [NSString stringWithFormat:@"99ios.com"];
    }
    return _lastName;
}

-(NSString*)name{
    if (_name==nil) {
        _name = [self.firtName stringByAppendingString:self.lastName];
    }
    return _name;
}
@end
