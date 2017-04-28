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
                                guests:(NSArray *)guestsData {

  NSMutableArray *guests = [NSMutableArray array];
  for (NSDictionary *guestData in guestsData) {
    Guest *newGuest;
    newGuest = [CoreData.repo buildInstance:[Guest class]];
    newGuest.firstName = guestData[@"firstName"];
    newGuest.lastName = guestData[@"lastName"];
    newGuest.emailAddress = guestData[@"emailAddress"];
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
