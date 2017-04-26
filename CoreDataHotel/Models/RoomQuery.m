//
//  RoomQuery.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "RoomQuery.h"

@implementation RoomQuery
+ (NSFetchRequest *)availableOnDaysFrom:(NSDate *)startDate
                                     to:(NSDate *)endDate {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Room"];

  NSString *query = @"SUBQUERY(reservations, $r, $r.startDate < %@ AND "
                    @"$r.endDate > %@).@count == 0";
  NSPredicate *noConflictingBooking =
      [NSPredicate predicateWithFormat:query, endDate, startDate];
  [request setPredicate:noConflictingBooking];

  NSSortDescriptor *byHotelName =
      [NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES];
  NSSortDescriptor *byRoomNumber =
      [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
  [request setSortDescriptors:@[ byHotelName, byRoomNumber ]];

  return request;
}
@end
