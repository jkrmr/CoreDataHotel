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
  (void)[self buildInstance:[Reservation class]];
  [self saveContext];

  results1 = [self queryResultsForRequest:[ReservationQuery allReservations]];

  XCTAssertEqual(1, results1.count);
}

- (void)testAllReservationsReturnsMultipleReservations {
  NSArray *results0, *results3;
  results0 = [self queryResultsForRequest:[ReservationQuery allReservations]];
  (void)[self buildInstance:[Reservation class]];
  (void)[self buildInstance:[Reservation class]];
  (void)[self buildInstance:[Reservation class]];
  XCTAssertEqual(0, results0.count);
  [self saveContext];

  results3 = [self queryResultsForRequest:[ReservationQuery allReservations]];

  XCTAssertEqual(3, results3.count);
}

- (void)testReservationsWithGuestDetailsFindsByExactOrPartialMatch {
  Guest *guest1;
  guest1 = [self buildInstance:[Guest class]];
  guest1.firstName = @"Chesty";
  guest1.lastName = @"Puller";
  guest1.emailAddress = @"cpuller@usmc.mil";

  Guest *guest2;
  guest2 = [self buildInstance:[Guest class]];
  guest2.firstName = @"Dan";
  guest2.lastName = @"Daly";
  guest2.emailAddress = @"ddaly@usmc.mil";

  Reservation *reservation1;
  reservation1 = [self buildInstance:[Reservation class]];
  reservation1.startDate = [self dateFromString:@"01/01/2000"];
  reservation1.endDate = [self dateFromString:@"02/02/2000"];
  reservation1.guests = [NSSet setWithArray:@[ guest1 ]];

  Reservation *reservation2;
  reservation2 = [self buildInstance:[Reservation class]];
  reservation2.startDate = [self dateFromString:@"01/01/2001"];
  reservation2.endDate = [self dateFromString:@"02/02/2002"];
  reservation2.guests = [NSSet setWithArray:@[ guest1, guest2 ]];
  [self saveContext];

  NSFetchRequest *requestByFirstName;
  NSArray *results1;
  requestByFirstName = [ReservationQuery reservationsWithGuestDetail:@"Chesty"];
  results1 = [self queryResultsForRequest:requestByFirstName];
  XCTAssertEqual(2, results1.count);

  NSFetchRequest *requestByLastName;
  NSArray *results2;
  requestByLastName = [ReservationQuery reservationsWithGuestDetail:@"Daly"];
  results2 = [self queryResultsForRequest:requestByLastName];
  XCTAssertEqual(1, results2.count);

  NSFetchRequest *requestByEmailStub;
  NSArray *results3;
  requestByEmailStub =
      [ReservationQuery reservationsWithGuestDetail:@"usmc.mil"];
  results3 = [self queryResultsForRequest:requestByEmailStub];
  XCTAssertEqual(2, results3.count);
}
@end
