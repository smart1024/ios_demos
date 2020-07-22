//
//  ArchiveService.m
//  21_归档多个不同类型的对象_01
//
//  Created by lilin on 2020/7/22.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ArchiveService.h"
#import "Person.h"
@implementation ArchiveService

+ (void)writeMultiTypesObjectsToArchiveFile{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"multitypesObjects.archive"];
    //创建一个MutableData对象用于存放需要归档的数据
    NSMutableData *archiveData = [NSMutableData data];
    //创建一个NSKeyedArchiver类的对象archiver，用来对归档对象进行编码，编码完成才能进行归档
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:archiveData];
    //归档基本数据类型
    [archiver encodeInt:2 forKey:@"int"];
    [archiver encodeObject:@"99iOS" forKey:@"string"];
    //归档自定义类
    Person *person = [[Person alloc] init];
    person.name = @"99iOS";
    person.age = 100;
    [archiver encodeObject:person forKey:@"person"];
    //完成编码
    [archiver finishEncoding];
    //将archiveData对象写入文件，完成归档
    [archiveData writeToFile:filePath atomically:YES];
}

+ (void)readSMultiTypesObjectsFromArchiveFile{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"multitypesObjects.archive"];
    //创建NSData对象来接收解档文件
    NSData *unarchiveData = [NSData dataWithContentsOfFile:filePath];

    NSKeyedUnarchiver* unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:unarchiveData];

    int number = [unArchiver decodeIntForKey:@"int"];

    NSString* string = [unArchiver decodeObjectForKey:@"string"];

    Person* person = [unArchiver decodeObjectForKey:@"person"];

    [unArchiver finishDecoding];
    //打印
    NSLog(@"number = %d, string = %@, person name = %@ person age = %d", number, string, person.name,person.age);
}

@end
