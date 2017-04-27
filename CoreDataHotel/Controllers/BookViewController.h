//
//  BookViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "AppDelegate.h"
#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import <UIKit/UIKit.h>

@interface BookViewController : UIViewController<UITextFieldDelegate>
@property(strong, nonatomic) Room *requestedRoom;
@property(strong, nonatomic) NSDate *requestedStartDate;
@property(strong, nonatomic) NSDate *requestedEndDate;
@end
