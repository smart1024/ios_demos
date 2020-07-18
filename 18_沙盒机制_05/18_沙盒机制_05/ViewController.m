//
//  ViewController.m
//  18_沙盒机制_05
//
//  Created by lilin on 2020/7/18.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

/**
 1、IOS沙盒机制:每个应用只能在该应用的文件夹下读取文件，不可以访问其他区域内容，这个区域称之为沙盒
 2、所有非代码文件都存放在沙盒：图片、声音、属性列表和文本文件
 3、应用程序向外请求或接收数据都需要经过权限认证
 4、每个应用的沙盒都包含三个文件夹：
 Documents：苹果建议在程序中建立或程序中浏览到的文件数据保存在此目录下，iTunes会备份此目录
 Library：存储程序的默认设置和状态信息，其又包含两个子目录
    Caches：存放缓存文件（itunes不会备份此目录，应用退出也不会删除）
    Preferences：存放偏好设置的plist文件
 tmp：提供一个存放临时文件的地方(iphone重启会删除tmp目录下文件)
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //APP沙盒路径
    NSString* homePath = NSHomeDirectory();
    NSLog(@"沙盒路径%@",homePath);
    
    //获取沙盒的Documents文件夹路径   expandTilde:是否展开成完整路径
    //用户主目录中 NSUserDomainMask
    NSArray* documentAttr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentPath = [documentAttr objectAtIndex:0];
    
    NSLog(@"documentPath == %@", documentPath);
    
    //获取Library目录路径
    NSArray* libraryArr = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libraryArr objectAtIndex:0];
    NSLog(@"libraryPath==%@", libraryPath);
    
    //获取Caches目录路径
    NSArray *cachesArr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesPath = [cachesArr objectAtIndex:0];
    NSLog(@"cachesPath==%@", cachesPath);
    
    //获取PreferencePanes目录路径
    NSArray *preferenceArr = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES);
    NSString * preferencePath = [preferenceArr objectAtIndex:0];
    NSLog(@"preferencePath==%@", preferencePath);
    
    NSString* tempPath =  NSTemporaryDirectory();
    NSLog(@"%@",tempPath);
}


@end
