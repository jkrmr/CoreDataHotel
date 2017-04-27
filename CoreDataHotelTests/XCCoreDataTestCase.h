//
//  XCCoreDataTestCase.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <XCTest/XCTest.h>

@interface XCCoreDataTestCase : XCTestCase

@property(strong, nonatomic) NSManagedObjectContext *inMemoryContext;
@property(strong, nonatomic) NSDateFormatter *dateFormatter;

- (NSDate *)dateFromString:(NSString *)dateString;
- (id)buildInstance:(id)type;
- (NSArray *)queryResultsForRequest:(NSFetchRequest *)request;
- (void)saveContext;
@end
