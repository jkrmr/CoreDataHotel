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
  NSString *template = @"Room %@ (%@ beds, $%@/nt)";
  return
      [NSString stringWithFormat:template, self.number, self.beds, self.rate];
}
@end
