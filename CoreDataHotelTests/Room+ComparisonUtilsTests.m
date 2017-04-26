//
//  Room+ComparisonUtilsTests.m
//  Room+ComparisonUtilsTests
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "Room+ComparisonUtils.h"

@interface Room_ComparisonUtilsTests : XCTestCase
@property (strong, nonatomic) NSManagedObjectContext *inMemoryContext;
@end

@implementation Room_ComparisonUtilsTests
- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  [super tearDown];
}

- (void)testCompareComparesByRoomNumber {
  Room *room1 = [[Room alloc] initWithContext:[self inMemoryContext]];
  Room *room2 = [[Room alloc] initWithContext:[self inMemoryContext]];
  room1.number = 8;
  room2.number = 50;
  XCTAssertEqual(42, room2.number - room1.number);

  NSComparisonResult order = [room1 compare:room2];

  XCTAssertEqual(NSOrderedAscending, order);
}

- (void)testPerformanceExample {
  [self measureBlock:^{
  }];
}

- (NSManagedObjectContext*) inMemoryContext {
  if (_inMemoryContext) { return _inMemoryContext; }

  NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:@[[NSBundle mainBundle]]];
  NSPersistentStoreCoordinator *coord = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];

  @try {
    [coord addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:nil];
  } @catch (NSException *exception) {
    NSLog(@"Failed to add in-memory store. Exception: %@", exception);
  }

  _inMemoryContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:0];
  [_inMemoryContext setPersistentStoreCoordinator:coord];

  return _inMemoryContext;
}
@end
