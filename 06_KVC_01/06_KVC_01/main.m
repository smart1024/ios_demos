//
//  main.m
//  06_KVC_01
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"
/**
 1、KVC(key-value coding):键值编码
 2、NSKeyValueCoding是对NSObject的扩展，因此所有类都可以使用NSKeyValueCoding中定义的方法
 3、可以对对象属性进行赋值和取值
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        Dog* dog = [[Dog alloc] init];
        
    //使用kvc赋值
        [dog setValue:@"tom" forKey:@"dogName"];
        [person setValue:@"shixin" forKey:@"name"];
        [person setValue:dog forKey:@"dog"];
        //给属性的属性赋值 setValue: forKeyPath:
        [person setValue:@2 forKeyPath:@"dog.dogAge"];
        
        //使用KVC取值
        
        NSString* personName = [person valueForKey:@"name"];
        NSString* dogName = [dog valueForKey:@"dogName"];
//        NSNumber* dogAge = [dog valueForKey:@"dogAge"];
        
        //取对象属性的属性的值
        NSNumber* dogAge = [person valueForKeyPath:@"dog.dogAge"];
        NSLog(@"<%@>的宠物狗名叫<%@>,它<%@>岁了",personName,dogName,dogAge);
        
        //字典转模型
        NSDictionary* dict =@{
            @"id":@1234567,
            @"name":@"99ios",
            @"age":@2
        };
        
        Person* per =  [[Person alloc] init];
        
        //kvc字典转模型
        [per setValuesForKeysWithDictionary:dict];
        
        NSLog(@"idNumber==%@",per.idNumber);
        NSLog(@"name == %@",per.name);
        NSLog(@"age==%d",per.age);
        
        /**
         修改readonly属性及私有属性
         1、点语法只能给未被标记为readonly属性赋值，而KVC可以修改只读属性(一般不建议修改readonly属性)
         2、通过runtime遍历出来的私有属性、私有变量，KVC也可进行赋值和取值
         */
        
        Person* p = [[Person alloc] init];
        NSLog(@"修改前idNum的值:%@",p.idNum);
        //点语法不能给只读属性赋值
//        p.idNum = @"7654321";
        
        //KVC强制修改只读属性
        [p setValue:@"7654321" forKey:@"idNum"];
        NSLog(@"KVC强制修改readonly属性后:%@",p.idNum);
    }
    return 0;
}
