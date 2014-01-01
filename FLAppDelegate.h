//
//  FLAppDelegate.h
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
