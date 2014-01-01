//
//  FLAllActivitiesViewController.h
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
#import "FLDBHelper.h"

@interface FLAllActivitiesViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) NSManagedObjectContext *context;

@property (nonatomic, strong) FLDBHelper *helper;

@property (nonatomic, strong) NSMutableArray *activities;
/**
 The event for which the user would like to view the details
 */
//@property (nonatomic, strong) Activity *chosenActivity;

@end
