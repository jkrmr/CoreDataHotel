//
//  Hotel+Summary.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/28/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Hotel+Summary.h"

@implementation Hotel (Summary)
- (NSString *)summary {
  NSNumber *rating;
  rating = [NSNumber numberWithInt:self.rating];

  return [NSString stringWithFormat:@"%@ (rating: %@)", self.name, rating];
}
@end
