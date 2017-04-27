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

//  return [NSEntityDescription insertNewObjectForEntityForName:className
//                                       inManagedObjectContext:self.inMemoryContext];
- (id)buildInstanceOf:(id)type {
  NSString *className;
  NSEntityDescription *entity;
  
  className = NSStringFromClass([type class]);
  entity = [NSEntityDescription entityForName:className
                       inManagedObjectContext:self.inMemoryContext];

  return [[[type class] alloc] initWithEntity:entity
               insertIntoManagedObjectContext:self.inMemoryContext];
}

- (NSArray *)queryResultsForRequest:(NSFetchRequest *)request {
  NSArray *results;
  NSError *error;

  results = [self.inMemoryContext executeFetchRequest:request error:&error];

  if (error) {
    NSLog(@"Error fetching from Core Data: %@", error.localizedDescription);
  }

  return results;
}

- (void)saveContext {
  NSError *error;
  [self.inMemoryContext save:&error];

  if (error) {
    NSLog(@"Error saving to Core Data: %@", error.localizedDescription);
  }
}
@end
