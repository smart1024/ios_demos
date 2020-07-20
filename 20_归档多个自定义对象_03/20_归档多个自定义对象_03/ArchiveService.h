//
//  ArchiveService.h
//  20_归档多个自定义对象_03
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface ArchiveService : NSObject

+(BOOL)writeObjectsToArchive:(NSMutableArray*)persons;
+(NSMutableArray*)readObjectsFromArchiveFile;
@end

NS_ASSUME_NONNULL_END
