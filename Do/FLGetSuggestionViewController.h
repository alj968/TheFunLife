//
//  FLGetSuggestionViewController.h
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLDBHelper.h"

@interface FLGetSuggestionViewController : UITableViewController

/**
 The database helper
 */
@property (nonatomic, strong) FLDBHelper *helper;


@property (nonatomic, strong) NSString *activityTitle;
@property (nonatomic, strong) NSString *weather;
@property (nonatomic, strong) NSString *groupSize;
@property (nonatomic, strong) NSString *season;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *prepwork;
@property (nonatomic, strong) NSString *holiday;

@property (strong, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControlWeather;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControlGroupSize;
@property (strong, nonatomic) IBOutlet UITextField *textFieldSeason;
@property (strong, nonatomic) IBOutlet UITextField *textFieldLocation;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControlPrep;
@property (strong, nonatomic) IBOutlet UITextField *textFieldHoliday;

- (IBAction)getSuggestionButtonPressed:(id)sender;
- (IBAction)resetButtonPressed:(id)sender;


@end
