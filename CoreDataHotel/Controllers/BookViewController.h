//
//  BookViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface BookViewController : UIViewController
@property (strong, nonatomic) Room *requestedRoom;
@property (strong, nonatomic) NSDate *requestedStartDate;
@property (strong, nonatomic) NSDate *requestedEndDate;
@end
