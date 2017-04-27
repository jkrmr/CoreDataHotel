//
//  RoomQueryTest.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Reservation+CoreDataClass.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "RoomQuery.h"
#import "XCCoreDataTestCase.h"
#import <XCTest/XCTest.h>

@interface RoomQueryTest : XCCoreDataTestCase
@end

@implementation RoomQueryTest
- (void)testAvailableOnDaysFromReturnsAValidRequest {
  Room *room1 = [[Room alloc] initWithContext:[self inMemoryContext]];
  room1.number = 100;
  Reservation *res1 =
      [[Reservation alloc] initWithContext:[self inMemoryContext]];
  NSDate *startDate1 = [self dateFromString:@"01/01/2001"];
  NSDate *endDate1 = [self dateFromString:@"01/03/2001"];
  res1.startDate = startDate1;
  res1.endDate = endDate1;
  [room1 setReservations:[NSSet setWithObject:res1]];

  Room *room2 = [[Room alloc] initWithContext:[self inMemoryContext]];
  room2.number = 900;
  Reservation *res2 =
      [[Reservation alloc] initWithContext:[self inMemoryContext]];
  NSDate *startDate2 = [self dateFromString:@"02/01/2001"];
  NSDate *endDate2 = [self dateFromString:@"02/03/2001"];
  res2.startDate = startDate2;
  res2.endDate = endDate2;
  [room2 setReservations:[NSSet setWithObject:res2]];
  [[self inMemoryContext] save:nil];

  NSFetchRequest *request =
      [RoomQuery availableOnDaysFrom:startDate1 to:startDate2];
  NSArray *result =
      [[self inMemoryContext] executeFetchRequest:request error:nil];
  Room *resultRoom = [result firstObject];

  XCTAssertEqual(1, result.count);
  XCTAssertEqual(resultRoom.number, resultRoom.number);
}
@end
