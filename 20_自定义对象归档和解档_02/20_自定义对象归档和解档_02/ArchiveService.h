//
//  ArchiveService.h
//  20_自定义对象归档和解档_02
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface ArchiveService : NSObject

+(BOOL)writeObjectToArchiveFile:(Person*)person;
+(Person*)readObjectFromArchiveFile;

@end

NS_ASSUME_NONNULL_END
