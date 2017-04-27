//
//  CoreData.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/27/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface CoreData : NSObject
+ (instancetype) repo;
- (id)buildInstanceOf:(id)type;
- (NSArray*) resultsForQuery:(NSFetchRequest*)request;
- (NSFetchedResultsController*) resultsControllerForQuery:(NSFetchRequest*)request
                                       sectionNameKeyPath:(NSString*)keyPath
                                                cacheName:(NSString*)cacheName;
- (void) save;
@end


