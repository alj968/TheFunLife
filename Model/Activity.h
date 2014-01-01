//
//  Activity.h
//  TheFunLife
//
//  Created by Amanda Jones on 12/30/13.
//  Copyright (c) 2013 Amanda Jones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * indoor_outdoor;
@property (nonatomic, retain) NSString * groupsize;
@property (nonatomic, retain) NSString * season;
@property (nonatomic, retain) NSString * holiday;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * prepwork;

@end
