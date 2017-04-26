//
//  Room+Comparison.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Room+ComparisonUtils.h"

@implementation Room (ComparisonUtils)
- (NSComparisonResult) compare:(Room*)otherRoom {
  return [[NSNumber numberWithInt:self.number] compare: [NSNumber numberWithInt:otherRoom.number]];
}
@end
