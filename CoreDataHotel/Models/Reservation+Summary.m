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
  Room *room = self.room;
  NSString *hotelName = room.hotel.name;
  NSNumber *roomNum = [NSNumber numberWithInt:room.number];

  NSString *template = @"%@ #%@: %@ to %@";
  return [NSString stringWithFormat:template, hotelName, roomNum, start, end];
}
@end
