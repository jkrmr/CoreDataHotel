//
//  ReservationQuery.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"

@interface ReservationQuery : NSObject
+ (NSFetchRequest *) allReservations;
@end
