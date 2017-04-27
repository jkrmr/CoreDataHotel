//
//  Reservation+Summary.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Reservation+Summary.h"

@implementation Reservation (Summary)
- (NSString *)summary {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
  [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
  NSString *start = [dateFormatter stringFromDate:self.startDate];
  NSString *end = [dateFormatter stringFromDate:self.endDate];
  NSString *template = @"%@ #%@: %@ to %@";
  Room *room = self.room;
  NSString *hotelName = room.hotel.name;
  NSNumber *roomNumber = [NSNumber numberWithInt:room.number];
  return
      [NSString stringWithFormat:template, hotelName, roomNumber, start, end];
}
@end
