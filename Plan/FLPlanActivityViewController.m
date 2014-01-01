//
//  FLPlanActivityViewController.m
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import "FLPlanActivityViewController.h"

@implementation FLPlanActivityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (FLDBHelper *)helper
{
    if(!_helper)
    {
        _helper = [[FLDBHelper alloc] init];
    }
    return _helper;
}

- (IBAction)addActivityButtonPressed:(id)sender
{
    _activityTitle = _textFieldTitle.text;
    
    if(_segControlWeather.selectedSegmentIndex!= UISegmentedControlNoSegment)
    {
        _weather = [_segControlWeather titleForSegmentAtIndex:_segControlWeather.selectedSegmentIndex];
    }
    
    if(_segControlGroupSize.selectedSegmentIndex!= UISegmentedControlNoSegment)
    {
        _groupSize = [_segControlGroupSize titleForSegmentAtIndex:_segControlGroupSize.selectedSegmentIndex];
    }    
    _season = _textFieldSeason.text;
    
    _location = _textFieldLocation.text;
    
    if(_segControlPrep.selectedSegmentIndex!= UISegmentedControlNoSegment)
    {
        _prepwork = [_segControlPrep titleForSegmentAtIndex:_segControlPrep.selectedSegmentIndex];
    }
   
    _holiday = _textFieldHoliday.text;

    
    BOOL activityAdded = [self.helper makeActivityAndSaveWithTitle:_activityTitle weather:_weather groupSize:_groupSize season:_season location:_location prepwork:_prepwork holiday:_holiday];
    
    if(activityAdded)
    {
        [self.navigationController popToRootViewControllerAnimated:true];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Save Failed"
                                                       message: @"Could not save activity. Please try again."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)resetButtonPressed:(id)sender {
    [_segControlWeather setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [_segControlGroupSize setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [_segControlPrep setSelectedSegmentIndex:UISegmentedControlNoSegment];
    _weather = NULL;
    _groupSize = NULL;
    _prepwork = NULL;
}
@end
