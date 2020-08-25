//
//  Person+CoreDataProperties.h
//  LeanCoreData
//
//  Created by lilin on 2020/8/24.
//  Copyright © 2020 lilin. All rights reserved.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
