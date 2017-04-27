//
//  XCCoreDataTestCase.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "XCCoreDataTestCase.h"

@implementation XCCoreDataTestCase
- (NSManagedObjectContext *)inMemoryContext {
  if (_inMemoryContext) {
    return _inMemoryContext;
  }

  NSManagedObjectModel *mom =
      [NSManagedObjectModel mergedModelFromBundles:@[ [NSBundle mainBundle] ]];
  NSPersistentStoreCoordinator *coord =
      [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];

  @try {
    [coord addPersistentStoreWithType:NSInMemoryStoreType
                        configuration:nil
                                  URL:nil
                              options:nil
                                error:nil];
  } @catch (NSException *exception) {
    NSLog(@"Failed to add in-memory store. Exception: %@", exception);
  }

  _inMemoryContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:0];
  [_inMemoryContext setPersistentStoreCoordinator:coord];

  return _inMemoryContext;
}

- (NSDateFormatter *)dateFormatter {
  if (_dateFormatter) {
    return _dateFormatter;
  }
  _dateFormatter = [[NSDateFormatter alloc] init];
  [_dateFormatter setDateFormat:@"MM/dd/yyyy"];
  return _dateFormatter;
}

- (NSDate *)dateFromString:(NSString *)dateString {
  return [[self dateFormatter] dateFromString:dateString];
}

@end
