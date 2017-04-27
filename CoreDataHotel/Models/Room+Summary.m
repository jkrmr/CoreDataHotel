//
//  Room+Summary.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/27/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Room+Summary.h"

@implementation Room (Summary)
- (NSString *)summary {
  NSNumber *number, *beds, *rate;
  NSString *template;

  number = [NSNumber numberWithInt:self.number];
  beds = [NSNumber numberWithInt:self.beds];
  rate = [NSNumber numberWithDouble:self.rate];
  template = @"Room %@ (%@ beds, $%@/nt)";

  return [NSString stringWithFormat:template, number, beds, rate];
}
@end
