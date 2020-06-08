//
//  main.m
//  oc数据类型
//
//  Created by lilin on 2020/6/6.
//  Copyright © 2020 lilin. All rights reserved.
//

/**
 1、id是指针，是通用对象类型 void*
 2、id可以指向任意类型的NSObject对象
 3、id是object-c动态绑定的基础
 */
#import <Foundation/Foundation.h>
#import "MyClass.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int number = 10;
        NSLog(@"%d",number);
        
        float f = 10.1234;
        NSLog(@"%f %.2f",f,f);
        
        char c = 'a';
        NSLog(@"%c",c);
        
        BOOL b1 = YES;
        BOOL b2 = NO;
        
        NSLog(@"b1:%d,b2:%d",b1,b2);
        
        /**
         NSArray存储NSNumber和NSString类型对象
         */
        NSArray *array=@[@123,@"99ios"];
        id obj = array;
        NSLog(@"%@",obj);
        
        //        不提倡++和--与其他运算符混用，在c语言标准里称为未定义行为，编译器不会报错，会警告
        //        int i=1,j=1,p,q;
        //        p =(i++)+(i++)+(i++);
        //        NSLog(@"%d",p);
        int a = 10,b=4;
        NSLog(@"a%%b = %d",a%b);
        
        //遍历数组array
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"张三",@"李四",@"王五",@"赵六", nil];
        for (NSString* str in arr) {
            NSLog(@"%@",str);
        }
        
        for (NSString* str in arr) {
            if([str isEqualToString:@"张三"]){
                [arr removeObject:str];
                break; //oc中删完必须break否则报异常
            }
        }
        
        int x =3 ,y=5;
        if(x>y){
            NSLog(@"Welcome to www.99ios.com!");
        }else{
            NSLog(@"欢迎访问99学院");
        }
        
        MyClass* myClass = [[MyClass alloc] init];
        NSLog(@"name属性初始值：%@",myClass.name);
        myClass.name =@"九九学院";
        NSLog(@"name属性最新值：%@",myClass.name);
        
        int date;
        scanf("%d",&date);
        switch (date) {
            case 1:
                NSLog(@"Monday");
                break;
            case 2:
                NSLog(@"Tuesday");
                break;
            case 3:
                NSLog(@"Wednesday");
                break;
            case 4:
                NSLog(@"Tursday");
                break;
            case 5:
                NSLog(@"Friday");
                break;
            case 6:
                NSLog(@"Saturday");
                break;
            case 7:
                NSLog(@"Sunday");
                break;
            default:
                NSLog(@"Error!");
                break;
        }
        
        
    
    }
    return 0;
}
