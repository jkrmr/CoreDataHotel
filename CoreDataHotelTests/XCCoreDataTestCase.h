//
//  XCCoreDataTestCase.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>

@interface XCCoreDataTestCase : XCTestCase
@property (strong, nonatomic) NSManagedObjectContext *inMemoryContext;
@end
