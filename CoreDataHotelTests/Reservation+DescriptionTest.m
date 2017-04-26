//
//  Reservation+DescriptionTest.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCCoreDataTestCase.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+Description.h"

@interface Reservation_DescriptionTest : XCCoreDataTestCase
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation Reservation_DescriptionTest
- (void)testDescriptionIncludesBookingDates {
  Reservation *res = [[Reservation alloc] initWithContext:[self inMemoryContext]];
  res.startDate = [[self dateFormatter] dateFromString:@"01/01/2001"];
  res.endDate = [[self dateFormatter] dateFromString:@"01/03/2001"];
  NSLog(@"%@", [[self dateFormatter] dateFromString:@"01/03/2001"]);

  NSString *expected = @"Booked: Jan 1, 2001 to Jan 3, 2001";
  NSString *actual = [res description];

  XCTAssertEqualObjects(expected, actual);
}

- (NSDateFormatter*) dateFormatter {
  if (_dateFormatter) { return _dateFormatter; }
  _dateFormatter = [[NSDateFormatter alloc] init];
  [_dateFormatter setDateFormat:@"MM/dd/yyyy"];
  return _dateFormatter;
}
@end
