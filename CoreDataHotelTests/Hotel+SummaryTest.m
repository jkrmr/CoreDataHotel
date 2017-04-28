//
//  Hotel+SummaryTest.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/28/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Hotel+Summary.h"
#import "XCCoreDataTestCase.h"
#import <XCTest/XCTest.h>

@interface Hotel_SummaryTest : XCCoreDataTestCase
@end

@implementation Hotel_SummaryTest
- (void)testSummaryIncludesStars {
  Hotel *hotel;
  hotel = [self buildInstance:[Hotel class]];
  hotel.name = @"The Avalon";
  hotel.stars = 4;

  NSString *expected = @"The Avalon (rating: 4)";
  NSString *actual = [hotel summary];

  XCTAssertEqualObjects(expected, actual);
}
@end
