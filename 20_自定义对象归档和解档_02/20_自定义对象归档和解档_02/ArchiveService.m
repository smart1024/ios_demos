//
//  ArchiveService.m
//  20_自定义对象归档和解档_02
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ArchiveService.h"

@implementation ArchiveService

+ (BOOL)writeObjectToArchiveFile:(Person *)person{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSLog(@"%@",docPath);
    
    NSString* filePath = [docPath stringByAppendingPathComponent:@"person.archive"];
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:person requiringSecureCoding:YES error:nil];
    
    return [data writeToFile:filePath atomically:YES];
}

+ (Person *)readObjectFromArchiveFile{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filePath = [docPath stringByAppendingPathComponent:@"person.archive"];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    
    return [NSKeyedUnarchiver unarchivedObjectOfClass:[Person class] fromData:data error:nil];
}

@end
