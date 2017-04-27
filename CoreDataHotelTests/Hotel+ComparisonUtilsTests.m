//
//  Hotel+ComparisonUtilsTests.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCCoreDataTestCase.h"
#import "Hotel+ComparisonUtils.h"

@interface Hotel_ComparisonUtilsTests : XCCoreDataTestCase
@end

@implementation Hotel_ComparisonUtilsTests
- (void)testCompareComparesByHotelNameDescending {
  Hotel *hotel1 = [self buildInstanceOf:[Hotel class]];
  Hotel *hotel2 = [self buildInstanceOf:[Hotel class]];
  hotel1.name = @"The Azteca";
  hotel2.name = @"The Alamada";

  NSComparisonResult order = [hotel1 compare:hotel2];

  XCTAssertEqual(NSOrderedDescending, order);
}

- (void)testCompareComparesByHotelNameSame {
  Hotel *hotel1 = [self buildInstanceOf:[Hotel class]];
  Hotel *hotel2 = [self buildInstanceOf:[Hotel class]];
  hotel1.name = @"The Alameda";
  hotel2.name = @"The Alameda";

  NSComparisonResult order = [hotel1 compare:hotel2];

  XCTAssertEqual(NSOrderedSame, order);
}

- (void)testCompareComparesByHotelNameAscending {
  Hotel *hotel1 = [self buildInstanceOf:[Hotel class]];
  Hotel *hotel2 = [self buildInstanceOf:[Hotel class]];
  hotel1.name = @"the Alameda";
  hotel2.name = @"the Zoloft";

  NSComparisonResult order = [hotel1 compare:hotel2];

  XCTAssertEqual(NSOrderedAscending, order);
}
@end
