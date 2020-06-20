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
        
        
        
        NSString* filePath = [directoryPath stringByAppendingPathComponent:@"myfile.txt"];
        
        
        //文件的复制、移动、重命名、删除
        NSString* copyFilePath = [directoryPath stringByAppendingPathComponent:@"myfilecopy.txt"];
        
        NSLog(@"copyFilePath==%@",copyFilePath);
        
        if ([fm fileExistsAtPath:copyFilePath]==NO) { //文件不存在
            if([fm copyItemAtPath:filePath toPath:copyFilePath error:nil]){
                NSLog(@"file copy success");
            }
        }else{
            NSLog(@"文件已存在");
        }
        
        //移动文件,也可以用来重命名
        
        NSString* moveFilePath = [directoryPath stringByAppendingPathComponent:@"myfileNewCopy.txt"];
        
        if ([fm fileExistsAtPath:filePath]) {
            if([fm moveItemAtPath:filePath toPath:moveFilePath error:nil]){
                NSLog(@"file move success");
            }
        }else{
            NSLog(@"文件已存在");
        }
        
        //删除文件
        if ([fm removeItemAtPath:moveFilePath error:nil]) {
            NSLog(@"file remove success");
        }else{
            NSLog(@"文件不存在");
        }
        
        /**
         获取与修改文件属性
         */
        
        NSDictionary* fileAttr = [fm attributesOfItemAtPath:copyFilePath error:nil];
        NSLog(@"file owner name <%@>,file create date:<%@>",fileAttr[NSFileOwnerAccountName],fileAttr[NSFileCreationDate]);
        
        //修改文件属性
        NSDictionary* attrDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSDate distantFuture],NSFileCreationDate,nil];
        
        [fm setAttributes:attrDict ofItemAtPath:copyFilePath error:nil];
        
        fileAttr = [fm attributesOfItemAtPath:copyFilePath error:nil];
        
        NSLog(@"file create date:<%@>",fileAttr[NSFileCreationDate]);
        
        /**
         目录操作
         */
        //获取当前目录
        
        NSLog(@"currentDirectoryPath==%@",[fm currentDirectoryPath]);
        
        NSArray* paths1 = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        
        NSString* desktopPath = [paths objectAtIndex:0];
        
        [fm changeCurrentDirectoryPath:desktopPath];
        
        NSString* newPath = [fm currentDirectoryPath];
        
        NSLog(@"变更目录后的当前目录：<%@>",newPath);
        
        /**
         目录的创建、重命名、删除操作
         */
        NSFileManager* fm1 = [NSFileManager defaultManager];
        NSString* path = [fm currentDirectoryPath];
        
        NSLog(@"初始状态下的当前目录：<%@>",path);
        
        //创建目录
        NSString* myfolderPath = [path stringByAppendingPathComponent:@"myfolder"];
        if ([fm createDirectoryAtPath:myfolderPath withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"创建目录成功");
        }
        
        //重命名与移动目录
        NSString* myfolderNewPath = [path stringByAppendingPathComponent:@"myNewFolder"];
        if ([fm moveItemAtPath:myfolderPath toPath:myfolderNewPath error:nil]) {
            NSLog(@"目录重命名成功");
        }
        
        //删除目录
        if([fm removeItemAtPath:myfolderNewPath error:nil]){
            NSLog(@"目录删除成功");
        }
        
        /**
         枚举目录中的内容
         */
        //1、enumeratorAtPath 可以枚举指定目录中的所有文件，包括子目录中文件
        NSFileManager* fm2 = [NSFileManager defaultManager];
        
        //变更当期目录到桌面Desktop
        NSArray* paths2 = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        
        NSString* desktopPath2 = [paths2 objectAtIndex:0];
        
        [fm changeCurrentDirectoryPath:desktopPath2];
        
        // 使用enumeratorAtPath
        NSDirectoryEnumerator* dirEnum =  [fm2 enumeratorAtPath:desktopPath2];
        
        NSString* path2;
        
        while ((path2 = [dirEnum nextObject]) != nil) {
            NSLog(@"%@",path2);
        }
        
        NSLog(@"========================================");
        
        //2、contentsOfDirectoryAtPath：只能列出当前目录中的文件和文件夹，不能列出子文件夹内容
        
        NSArray* dirArray  = [fm2 contentsOfDirectoryAtPath:desktopPath2 error:nil];
        
        NSString* path3;
        
        for (path3 in dirArray) {
            NSLog(@"%@",path3);
        }
        
        /**
         文件的读取和写入
         */
        
        //1、文件内容的读取 contentsAtPath
        
        NSFileManager* fm4 = [NSFileManager defaultManager];
        
        NSArray* paths4 = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        
        //取出桌面路径
        NSString* desktopPath4 = [paths4 objectAtIndex:0];
        
        //切换当前目录为桌面
        [fm4 changeCurrentDirectoryPath:desktopPath4];
        
        NSString* filePath4 = [desktopPath4 stringByAppendingPathComponent:@"myfilecopy.txt"];
        
        NSData* fileData = [fm4 contentsAtPath:filePath4];
        
        NSString* fileContent = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        
        NSLog(@"fileContent=%@",fileContent);
        
        //把NSData写入文件
        //方法1
        NSString* newFilePath = [desktopPath4 stringByAppendingPathComponent:@"myNewFile.txt"];
        
        if ([fileData writeToFile:newFilePath atomically:YES]) {
            NSLog(@"使用writetToFile成功");
        }
        
        //方法2
        NSString* newFilePath2 = [desktopPath4 stringByAppendingPathComponent:@"myNewFile2.txt"];
        
        if ([fm createFileAtPath:newFilePath2 contents:fileData attributes:nil]) {
            NSLog(@"使用createFileAtPath方法写入成功");
        }
    }
    
    return 0;
}
