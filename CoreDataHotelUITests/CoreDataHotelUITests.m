//
//  CoreDataHotelUITests.m
//  CoreDataHotelUITests
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CoreDataHotelUITests : XCTestCase
@end

@implementation CoreDataHotelUITests
- (void)setUp {
  [super setUp];
  self.continueAfterFailure = NO;
  [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
  [super tearDown];
}

- (void)testExample {
}

@end
