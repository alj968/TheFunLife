//
//  FLDBHelperViewController.h
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"

@interface FLDBHelper : NSObject

/**
 NSManagedObjectContext for core data
 */
@property (nonatomic, strong) NSManagedObjectContext *context;

- (BOOL) makeActivityAndSaveWithTitle:(NSString *)title
                                 weather:(NSString *)weather
                               groupSize:(NSString *)groupSize
                                  season:(NSString *)season
                                location:(NSString *)location
                                prepwork:(NSString *)prepwork
                                 holiday:(NSString *)holiday;

-(Activity *) getActivitySuggestionWhereTitle:(NSString *)title
                                      weather:(NSString *)weather
                                    groupSize:(NSString *)groupSize
                                       season:(NSString *)season
                                     location:(NSString *)location
                                     prepwork:(NSString *)prepwork
                                      holiday:(NSString *)holiday;

-(NSArray *) fetchAllActivities;

@end
