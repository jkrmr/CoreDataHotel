//
//  LookUpReservationViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "AppDelegate.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Reservation+Description.h"
#import "ReservationQuery.h"
#import <UIKit/UIKit.h>

@interface LookUpReservationViewController
    : UIViewController <UITableViewDataSource, UITableViewDelegate>
@end
