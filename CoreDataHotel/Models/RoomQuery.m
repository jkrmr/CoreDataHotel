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

  // If a room has zero reservations that
  // (1) begin before the requested reservation would end, and
  // (2) end after the requested reservation would begin
  // then that room is available for the requested reservation period.
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
