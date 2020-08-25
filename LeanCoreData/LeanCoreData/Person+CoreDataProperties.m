//
//  Person+CoreDataProperties.m
//  LeanCoreData
//
//  Created by lilin on 2020/8/24.
//  Copyright © 2020 lilin. All rights reserved.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Person"];
}

@dynamic name;

@end
