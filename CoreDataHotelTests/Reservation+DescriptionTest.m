//
//  Reservation+DescriptionTest.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Reservation+CoreDataClass.h"
#import "Reservation+Description.h"
#import "XCCoreDataTestCase.h"
#import <XCTest/XCTest.h>

@interface Reservation_DescriptionTest : XCCoreDataTestCase
@end

@implementation Reservation_DescriptionTest
- (void)testDescriptionIncludesBookingDates {
  Reservation *res =
      [[Reservation alloc] initWithContext:[self inMemoryContext]];
  res.startDate = [self dateFromString:@"01/01/2001"];
  res.endDate = [self dateFromString:@"01/03/2001"];

  NSString *expected = @"Booked: Jan 1, 2001 to Jan 3, 2001";
  NSString *actual = [res description];

  XCTAssertEqualObjects(expected, actual);
}
@end
