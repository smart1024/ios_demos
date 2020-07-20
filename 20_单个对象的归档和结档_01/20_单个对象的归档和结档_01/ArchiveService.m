//
//  ArchiveService.m
//  20_单个对象的归档和结档_01
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ArchiveService.h"

@implementation ArchiveService

//方法已过时
+ (BOOL)writeStringToArchiveFile:(NSString *)string{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@",docPath);
    NSString* filePath = [docPath stringByAppendingPathComponent:@"string.archive"];
    return [NSKeyedArchiver archiveRootObject:string toFile:filePath];
}

+ (BOOL)newWriteStringToArchiveFile:(NSString *)string{
   NSData* data = [NSKeyedArchiver archivedDataWithRootObject:string requiringSecureCoding:YES error:nil];
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@",docPath);
    NSString* filePath = [docPath stringByAppendingPathComponent:@"string.archive"];
    return [data writeToFile:filePath atomically:YES];
}

+ (NSString *)newReadStringFromArchiveFile{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@",docPath);
    NSString* filePath = [docPath stringByAppendingPathComponent:@"string.archive"];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    return [NSKeyedUnarchiver unarchivedObjectOfClass:[NSString class] fromData:data error:nil];
}

//此法已过时
+ (NSString *)readStringFromArchiveFile{
   NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString* filePath = [docPath stringByAppendingPathComponent:@"string.archive"];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}
@end
