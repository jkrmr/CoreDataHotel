//
//  Room+Comparison.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Room+ComparisonUtils.h"

@implementation Room (ComparisonUtils)
- (NSComparisonResult)compare:(Room *)otherRoom {
  NSNumber *roomNum, *otherRoomNum;

  roomNum = [NSNumber numberWithInt:self.number];
  otherRoomNum = [NSNumber numberWithInt:otherRoom.number];

  return [roomNum compare:otherRoomNum];
}
@end
