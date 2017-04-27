//
//  CoreData.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/27/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface CoreData : NSObject
+ (instancetype)repo;
- (id)buildInstance:(id)type;
- (NSArray *)resultsForQuery:(NSFetchRequest *)request;
- (NSFetchedResultsController *)resultsControllerFor:(NSFetchRequest *)request
                                  sectionNameKeyPath:(NSString *)keyPath
                                           cacheName:(NSString *)cacheName;
- (void)save;
@end
