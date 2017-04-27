//
//  ReservationQuery.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface ReservationQuery : NSObject
+ (NSFetchRequest *)allReservations;
+ (NSFetchRequest *)reservationsWithGuestDetail:(NSString*)string;
@end
