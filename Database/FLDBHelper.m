//
//  FLDBHelperViewController.m
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import "FLDBHelper.h"
#import "FLAppDelegate.h"

@implementation FLDBHelper

-(NSManagedObjectContext *)context
{
    if(!_context)
    {
        _context = [(FLAppDelegate *)([UIApplication sharedApplication].delegate) managedObjectContext];
    }
    return _context;
}

- (BOOL) makeActivityAndSaveWithTitle:(NSString *)title
                              weather:(NSString *)weather
                            groupSize:(NSString *)groupSize
                               season:(NSString *)season
                             location:(NSString *)location
                             prepwork:(NSString *)prepwork
                              holiday:(NSString *)holiday
{
    
    Activity *activityToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:self.context];
    
    //If title null, fill in
    if(title.length == 0)
    {
        title = @"New Title";
    }
    [activityToAdd setTitle:title];
    [activityToAdd setIndoor_outdoor:weather];
    [activityToAdd setGroupsize:groupSize];
    [activityToAdd setSeason:season];
    [activityToAdd setLocation:location];
    [activityToAdd setPrepwork:prepwork];
    [activityToAdd setHoliday:holiday];
    return [self saveEventSuccessful];
}

- (BOOL) saveEventSuccessful
{
    BOOL success = YES;
    [(FLAppDelegate *)([UIApplication sharedApplication].delegate) saveContext];
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        success = NO;
    }
    else
    {
        //[self printDatabase];
    }
    return success;
}


-(NSFetchRequest *) formEventFetchRequest
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Activity" inManagedObjectContext:self.context];
    [fetchRequest setEntity:entity];
    return fetchRequest;
}

-(NSArray *)fetchAllActivities
{
    NSFetchRequest *fetchRequest = [self formEventFetchRequest];
    NSError *error;
    NSArray *fetchedObjects = [self.context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

-(Activity *) getActivitySuggestionWhereTitle:(NSString *)title
                                      weather:(NSString *)weather
                                    groupSize:(NSString *)groupSize
                                       season:(NSString *)season
                                     location:(NSString *)location
                                     prepwork:(NSString *)prepwork
                                      holiday:(NSString *)holiday
{
    //Fetch all events that fit criteria
    NSArray *activities;
    NSFetchRequest *fetchRequest = [self formEventFetchRequest];
    
    NSPredicate *predicate;
    NSMutableArray *preds=[[NSMutableArray alloc] initWithCapacity:1];
    if (title.length > 0)
    {
        NSPredicate *titlePred=[NSPredicate predicateWithFormat:@"title==%@",title];
        [preds addObject:titlePred];
    }
    if(weather.length >0)
    {
        NSPredicate *weatherPred=[NSPredicate predicateWithFormat:@"indoor_outdoor == %@", weather];
        [preds addObject:weatherPred];
    }
    if (groupSize.length >0) {
        NSPredicate *groupPred=[NSPredicate predicateWithFormat:@"groupsize == %@", groupSize];
        [preds addObject:groupPred];
    }
    if (season.length >0) {
        NSPredicate *seasonPred=[NSPredicate predicateWithFormat:@"season == %@", season];
        [preds addObject:seasonPred];
    }
    if (location.length >0) {
        NSPredicate *locationPred=[NSPredicate predicateWithFormat:@"location == %@", location];
        [preds addObject:locationPred];
    }
    if (prepwork.length >0) {
        NSPredicate *prepPred=[NSPredicate predicateWithFormat:@"prepwork == %@", prepwork];
        [preds addObject:prepPred];
    }
    if (holiday.length >0) {
        NSPredicate *holidayPred=[NSPredicate predicateWithFormat:@"holiday == %@", holiday];
        [preds addObject:holidayPred];
    }
    predicate =[NSCompoundPredicate andPredicateWithSubpredicates:preds];

    [fetchRequest setPredicate:predicate];

    NSError *error;
    activities = [self.context executeFetchRequest:fetchRequest error:&error];
    
    if(activities.count > 0)
    {
        //Pick random one
        Activity *activity = [self pickActivityFromList:activities];
        return activity;
    }
    else
    {
        return NULL;
    }
}

-(Activity *) pickActivityFromList:(NSArray *)activities
{
    int randomIndex = arc4random_uniform(activities.count);
    return [activities objectAtIndex:randomIndex];
}



@end
