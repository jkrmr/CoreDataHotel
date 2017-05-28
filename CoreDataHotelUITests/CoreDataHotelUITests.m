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

- (void)testUserCanBookAReservation {
  XCUIApplication *app = [[XCUIApplication alloc] init];
  [app.buttons[@"Book a room"] tap];
  [app.buttons[@"Check availability"] tap];

  XCUIElementQuery *tablesQuery = app.tables;
  [[tablesQuery.cells elementBoundByIndex:1] tap];

  XCUIElement *firstNameTextField = app.textFields[@"First name"];
  XCUIElement *lastNameTextField = app.textFields[@"Last name"];
  XCUIElement *emailAddressTextField = app.textFields[@"Email address"];

  [firstNameTextField tap];
  [firstNameTextField typeText:@"Chesty"];
  [lastNameTextField tap];
  [lastNameTextField typeText:@"Puller"];
  [emailAddressTextField tap];
  [emailAddressTextField typeText:@"cpuller@usmc.mil"];

  if ([app.buttons[@"Confirm"] isHittable]) {
    [app.buttons[@"Confirm"] tap];
  } else {
    [app.keyboards.buttons[@"Done"] tap];
    [app.buttons[@"Confirm"] tap];
  }

  [app.buttons[@"See all bookings"] tap];

  XCTAssertTrue([[tablesQuery.cells elementBoundByIndex:0] exists]);
}

@end
