//
//  FLGetSuggestionViewController.m
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import "FLGetSuggestionViewController.h"

@implementation FLGetSuggestionViewController

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

//TODO: Need way to reset seg control
- (IBAction)getSuggestionButtonPressed:(id)sender
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
    
    [self makeActivitySuggestion];
}

-(void)makeActivitySuggestion
{
    
    //Loop until you find a time slot that's not taken
    Activity *suggestedActivity = [self.helper getActivitySuggestionWhereTitle:_activityTitle weather:_weather groupSize:_groupSize season:_season location:_location prepwork:_prepwork holiday:_holiday];
    
    if(suggestedActivity)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Suggested Activity"
                                                       message: suggestedActivity.title
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Do It!",@"New Suggestion",nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle: @"Oops!"
                                                        message: @"No activity can be found that meets your criteria. Please broaden your search."
                                                       delegate: self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Ok",nil];
        [alert2 show];
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
