//
//  main.m
//  04_Foundation_02
//
//  Created by lilin on 2020/6/19.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       /**
        NSFileManager类：文件管理类
        1、path：NSString类型
          文件路径的获取方式：
            1、绝对路径
            2、NSSearchPathForDirectoriesInDomains()函数来获取
        2、属性Attr:NSDictionary类型
        3、错误err:NSError类型
        */
        
        NSString* directoryPath = @"/Users/lilin/Desktop";
        
        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        
        NSString* destopPath = [paths objectAtIndex:0];
        
        //文件路径
        //拼接文件名称需要使用stringByAppendingPathComponent:方法
        NSString* filePath1 = [directoryPath stringByAppendingPathComponent:@"myfile.txt"];
        NSString* filePath2 = [destopPath stringByAppendingPathComponent:@"myfile.txt"];
        
        NSLog(@"filePath1 == %@",filePath1);
        NSLog(@"filePath2 == %@",filePath2);
        
        //实例化NSFileManager对象
        NSFileManager* fm = [NSFileManager defaultManager];
        
        if ([fm fileExistsAtPath:filePath1]) {
            NSLog(@"myfile.txt exists in file Path!");
        }
        
        if([fm fileExistsAtPath:filePath2]){
            NSLog(@"myfile.txt exists in DesktopPath！");
        }
    }
    return 0;
}
