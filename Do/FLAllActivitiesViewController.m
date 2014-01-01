//
//  FLAllActivitiesViewController.m
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import "FLAllActivitiesViewController.h"
#import "FLAppDelegate.h"

@implementation FLAllActivitiesViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.backgroundColor = [UIColor colorWithRed:(71.0/255.0) green:(204.0/255.0) blue:(188.0/255.0) alpha:1];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self setUpTable];
    [self.tableView reloadData];
}

- (FLDBHelper *)helper
{
    if(!_helper)
    {
        _helper = [[FLDBHelper alloc] init];
    }
    return _helper;
}

-(void)setUpTable
{
    _activities = [[self.helper fetchAllActivities] mutableCopy];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_activities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Activity Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Activity *activity = [_activities objectAtIndex:indexPath.row];
    cell.textLabel.text = activity.title;
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the managed object at the given index path.
        //TODO: Move this to db helper
        _context = [(FLAppDelegate *)([UIApplication sharedApplication].delegate) managedObjectContext];
        NSManagedObject *activityToDelete = [_activities objectAtIndex:indexPath.row];
        [_context deleteObject:activityToDelete];
        
        // Commit the change.
        NSError *error = nil;
        if (![_context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        //If it was actually deleted from the database, delete from the array
        else {
            // Update the array and table view.
            [_activities removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
        }
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
