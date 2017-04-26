//
//  RoomAvailabilityViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "AppDelegate.h"
#import "BookViewController.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "Room+ComparisonUtils.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "RoomQuery.h"
#import <UIKit/UIKit.h>

@interface RoomAvailabilityViewController
    : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic) NSDate *requestedStartDate;
@property(strong, nonatomic) NSDate *requestedEndDate;
@end
