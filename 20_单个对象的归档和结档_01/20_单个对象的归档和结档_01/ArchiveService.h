//
//  ArchiveService.h
//  20_单个对象的归档和结档_01
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArchiveService : NSObject

+(BOOL)writeStringToArchiveFile:(NSString*) string;

+(BOOL)newWriteStringToArchiveFile:(NSString*) string;

+(NSString*)readStringFromArchiveFile;
+(NSString*)newReadStringFromArchiveFile;

@end

NS_ASSUME_NONNULL_END
