//
//  Room+ComparisonUtilsTests.m
//  Room+ComparisonUtilsTests
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCCoreDataTestCase.h"
#import "Room+ComparisonUtils.h"

@interface Room_ComparisonUtilsTests : XCCoreDataTestCase
@end

@implementation Room_ComparisonUtilsTests
- (void)testCompareComparesByRoomNumber {
  Room *room1 = [[Room alloc] initWithContext:[self inMemoryContext]];
  Room *room2 = [[Room alloc] initWithContext:[self inMemoryContext]];
  room1.number = 8;
  room2.number = 50;
  XCTAssertEqual(42, room2.number - room1.number);

  NSComparisonResult order = [room1 compare:room2];

  XCTAssertEqual(NSOrderedAscending, order);
}
@end
