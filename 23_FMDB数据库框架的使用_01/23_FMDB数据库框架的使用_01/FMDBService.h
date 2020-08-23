//
//  FMDBService.h
//  23_FMDB数据库框架的使用_01
//
//  Created by lilin on 2020/8/23.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
NS_ASSUME_NONNULL_BEGIN

@interface FMDBService : NSObject
- (void)insertDataWithDictionary:(NSDictionary*)dict;
- (void)updateDataWithDictionary:(NSDictionary*)dict;
- (NSArray *)selectData;
- (void)deleteDataWithDictionary:(NSDictionary *)dict;
- (void)createTable;
@end

NS_ASSUME_NONNULL_END
