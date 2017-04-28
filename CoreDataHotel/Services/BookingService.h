//
//  BookingService.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/27/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "CoreData.h"
#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import <Foundation/Foundation.h>

@interface BookingService : NSObject
+ (void)createReservationWithStartDate:(NSDate *)startDate
                               endDate:(NSDate *)endDate
                               forRoom:(Room *)room
                                guests:(NSArray *)guests;
@end
