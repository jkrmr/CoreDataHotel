//
//  Reservation+Description.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Reservation+Description.h"

@implementation Reservation (Description)
- (NSString*) description {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
  [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
  NSString *start = [dateFormatter stringFromDate:self.startDate];
  NSString *end = [dateFormatter stringFromDate:self.endDate];
  return [NSString stringWithFormat:@"Booked: %@ to %@", start, end];
}
@end
