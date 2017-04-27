//
//  ReservationQueryTest.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "ReservationQuery.h"
#import "XCCoreDataTestCase.h"
#import <XCTest/XCTest.h>

@interface ReservationQueryTest : XCCoreDataTestCase
@end

@implementation ReservationQueryTest
- (void)testAllReservationsCorrectlyReturnsASingleReservation {
  NSArray *results0, *results1;
  results0 = [self queryResultsForRequest:[ReservationQuery allReservations]];
  XCTAssertEqual(0, results0.count);
  (void)[self buildInstanceOf:[Reservation class]];
  [self saveContext];

  results1 = [self queryResultsForRequest:[ReservationQuery allReservations]];

  XCTAssertEqual(1, results1.count);
}

- (void)testAllReservationsReturnsMultipleReservations {
  NSArray *results0, *results3;
  results0 = [self queryResultsForRequest:[ReservationQuery allReservations]];
  (void)[self buildInstanceOf:[Reservation class]];
  (void)[self buildInstanceOf:[Reservation class]];
  (void)[self buildInstanceOf:[Reservation class]];
  XCTAssertEqual(0, results0.count);
  [self saveContext];

  results3 = [self queryResultsForRequest:[ReservationQuery allReservations]];

  XCTAssertEqual(3, results3.count);
}
@end
