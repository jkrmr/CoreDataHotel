//
//  BookingService.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/27/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "BookingService.h"

@implementation BookingService
+ (void)createReservationWithStartDate:(NSDate *)startDate
                               endDate:(NSDate *)endDate
                               forRoom:(Room *)room
                             guestList:(NSArray *)guestsAttrs {
  
  NSMutableArray *guests = [NSMutableArray array];
  for (NSDictionary *guestAttrs in guestsAttrs) {
    Guest *newGuest;
    newGuest = [CoreData.repo buildInstance:[Guest class]];
    newGuest.firstName = guestAttrs[@"firstName"];
    newGuest.lastName = guestAttrs[@"lastName"];
    newGuest.emailAddress = guestAttrs[@"emailAddress"];
    [guests addObject:newGuest];
  }

  Reservation *newReservation;
  newReservation = [CoreData.repo buildInstance:[Reservation class]];
  newReservation.startDate = startDate;
  newReservation.endDate = endDate;
  newReservation.room = room;
  [newReservation setGuests:[NSSet setWithArray:guests]];

  [CoreData.repo save];
}
@end
