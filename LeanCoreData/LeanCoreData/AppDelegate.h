//
//  AppDelegate.h
//  LeanCoreData
//
//  Created by lilin on 2020/8/24.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

