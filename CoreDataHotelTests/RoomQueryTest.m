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
  Room *room1;
  Reservation *res1;
  NSDate *startDate1, *endDate1;
  startDate1 = [self dateFromString:@"01/01/2001"];
  endDate1 = [self dateFromString:@"01/03/2001"];
  room1 = [self buildInstanceOf:[Room class]];
  room1.number = 100;
  res1 = [self buildInstanceOf:[Reservation class]];
  res1.startDate = startDate1;
  res1.endDate = endDate1;
  [room1 setReservations:[NSSet setWithObject:res1]];

  Room *room2;
  Reservation *res2;
  NSDate *startDate2, *endDate2;
  startDate2 = [self dateFromString:@"02/01/2001"];
  endDate2 = [self dateFromString:@"02/03/2001"];
  room2 = [self buildInstanceOf:[Room class]];
  room2.number = 900;
  res2 = [self buildInstanceOf:[Reservation class]];
  res2.startDate = startDate2;
  res2.endDate = endDate2;
  [room2 setReservations:[NSSet setWithObject:res2]];
  [self saveContext];

  NSFetchRequest *request;
  NSArray *results;
  Room *resultRoom;
  request = [RoomQuery availableOnDaysFrom:startDate1 to:startDate2];
  results = [self queryResultsForRequest:request];
  resultRoom = [results firstObject];

  XCTAssertEqual(1, results.count);
  XCTAssertEqual(room2.number, resultRoom.number);
}
@end
