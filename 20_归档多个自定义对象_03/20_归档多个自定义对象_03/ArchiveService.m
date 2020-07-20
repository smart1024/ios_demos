//
//  ArchiveService.m
//  20_归档多个自定义对象_03
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ArchiveService.h"

@implementation ArchiveService

//归档
+ (BOOL)writeObjectsToArchive:(NSMutableArray *)persons{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSLog(@"%@",docPath);
    NSString* filePath = [docPath stringByAppendingPathComponent:@"persons.archive"];
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:persons requiringSecureCoding:YES error:nil];
    
    return [data writeToFile:filePath atomically:YES];
}

//解档
+ (NSMutableArray *)readObjectsFromArchiveFile{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filePath = [docPath stringByAppendingPathComponent:@"persons.archive"];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];

    /**
     1、归档的是非容器类型：unarchivedObjectOfClass
     2、归档的是容器类型：unarchivedObjectOfClasses，自定义类型必须遵守NSSecureCoding协议，类型类列表需要都指出
     */
    return [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithArray:@[NSMutableArray.class,Person.class]] fromData:data error:nil];
}

+ (BOOL)writeSubObjectToArchive:(Student *)student{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSLog(@"%@",docPath);
    NSString* filePath = [docPath stringByAppendingPathComponent:@"student.archive"];
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:student requiringSecureCoding:YES error:nil];
    
    return [data writeToFile:filePath atomically:YES];
}

+ (Student *)readSubObjectFromArchiveFile{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filePath = [docPath stringByAppendingPathComponent:@"student.archive"];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    return [NSKeyedUnarchiver unarchivedObjectOfClass:[Student class] fromData:data error:nil];
}

@end
