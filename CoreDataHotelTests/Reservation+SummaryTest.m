//
//  Reservation+SummaryTest.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Reservation+CoreDataClass.h"
#import "Reservation+Summary.h"
#import "XCCoreDataTestCase.h"
#import <XCTest/XCTest.h>

@interface Reservation_SummaryTest : XCCoreDataTestCase
@end

@implementation Reservation_SummaryTest
- (void)testSummaryIncludesBookingDates {
  Hotel *hotel;
  hotel = [self buildInstance:[Hotel class]];
  hotel.name = @"The Avalon";

  Room *room;
  room = [self buildInstance:[Room class]];
  room.number = 420;
  room.hotel = hotel;

  Reservation *reservation;
  reservation = [self buildInstance:[Reservation class]];
  reservation.startDate = [self dateFromString:@"01/01/2001"];
  reservation.endDate = [self dateFromString:@"01/03/2001"];
  reservation.room = room;

  NSString *expected = @"The Avalon #420: Jan 1, 2001 to Jan 3, 2001";
  NSString *actual = [reservation summary];

  XCTAssertEqualObjects(expected, actual);
}
@end
