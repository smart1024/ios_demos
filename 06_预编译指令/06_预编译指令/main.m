//
//  main.m
//  06_预编译指令
//
//  Created by lilin on 2020/6/21.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 1、宏定义：
    在对源代码编译过程中，需要完成一定的功能。如编译时包含其他源文件(#import)、定义宏(#define)、根据条件决定编译时是否包含某些代码。
    要完成这些工作就需要使用预处理程序
 2、预处理指令：以#开头，#必须是该行第一个字符，该指令将在编译器进行编译之前对源代码做某些转换，
    因此预处理过程先于编译器对源码处理
 3、宏(Macros):定义一个代表特定内容的标识符
    1、#define预处理指令来定义宏
    2、宏的作用范围：宏定义开始，直到文件为
    3、宏的常见2种用法：
        1>定义代表某个值的全局宏
        2>定义带参数的宏，可以像函数一样被调用，会在调用出展开，并实际参数文本替换形式参数
 #define 宏名 宏体
 */

/**
        1、无参宏： #define 宏名 宏体
           1、定义符号常量
           2、定义表达式
           3、定义字符串常量
           4、定义符号
           5、在宏定义中使用另一个宏
        */
//定义符号常量
#define PI 3.14
//定义表达式
#define LARGE (100+100)
//定义字符串常量
#define WEBNAME "www.99ios.com"
//定义符号 AND代表&&
#define AND &&
//在宏定义中使用另一个宏定义
#define TWO_PI (2.0*PI)

/**
 有参宏：定义格式：#define 宏名(参数列表) 宏体
 */
#define SOURCE(a) ((a)*(a)) //宏体中所有参数必须用()括起来

//续行符定义多行宏，\被称为续行符，表示下一行是本行的延续，\后不能添加任何空白字符

//定义一个有两个参数的宏，宏体中代码段可用{}括起来
#define LAGER(a,b) ({\
    int m = a,n = b; m > n? m:n; \
})

//运算符#,#运算符报紧跟的参数转化为字符串，也成字符串化运算符
#define STRING(n) #n

//运算符##，##运算符用于把多个参数连接到一起，预处理程序吧出现##两侧的参数合并成一个符号
#define CONNECT(a,b,c) a##b##c

/**
 #include、#import、@ class
 1、#include <类名.h>：表示告诉预处理程序在编译器自带的或外部库的头文件中搜索被包含头文件
 #include "类名.h":表示告诉预处理程序在当前应用的源码中搜索被包含的头文件，如果找不到再搜索编译器自带的头文件
    编译器安装在公共子目录下，二被编译应用是在其私有子目录下，应用程序既可包含编译器提供的公共头文件，也可包含自定义私有头文件。
 2、#import解决了#include出现的重复引用问题
 3、@ class可引入一个类，在声明上与#import功能类似，@ class指令效率高，w因为编译器不需要引入和处理整个引入类。如果要用到引入类中的属性和方法，@ class是不够的，必须使用#import
 */

/**
 
 1、条件编译：跟else if功能类似
 #if指令 检测关键字后宏或常量表达式是否为真
 #else：
 #elseif：
 #endif：
 
 2、#ifdef与ifndef
  1、#ifdef:如果被定义过
  2、ifndef:如果没被定义过
 */

#define IOS10 0
#define IOS9 1

#define RUN

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a = 3,b= 4;
        //宏参数可能是表达式，因此要括号括起来
        NSLog(@"square=%d",SOURCE(a+b));
        NSLog(@"LAGER(10, 5) = %d",LAGER(10, 5));
        NSLog(@"%s",STRING(www.99ios.com));
        
        //合并成了一个浮点数
        NSLog(@"%f",CONNECT(13.6, 2, 3));
        
        #if IOS10
            NSLog(@"这是一个IOS10设备");
        #elif IOS9
            NSLog(@"这是一个IOS9设备");
        #else
            NSLog(@"这既不是IOS10设备，也不是IOS9设备");
        #endif
        
        //判断宏是否被定义过
        #ifdef RUN
                NSLog(@"宏RUN被定义过");
        #endif
        
        #ifndef NOTRUN
            NSLog(@"宏NOTRUN没被定义过");
        #endif
    }
    return 0;
}
