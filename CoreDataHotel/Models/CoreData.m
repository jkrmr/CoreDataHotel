//
//  CoreData.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/27/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "CoreData.h"

@interface CoreData ()
@property(strong, nonatomic) AppDelegate *appDelegate;
@property(strong, nonatomic) NSManagedObjectContext *context;
@end

@implementation CoreData
- (instancetype)init {
  self = [super init];
  if (self) {
    self.appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
    self.context = self.appDelegate.persistentContainer.viewContext;
  }
  return self;
}

+ (instancetype)repo {
  static CoreData *repo = nil;
  static dispatch_once_t onceToken;

  dispatch_once(&onceToken, ^{
    repo = [[self alloc] init];
  });

  return repo;
}

- (NSArray *)resultsForQuery:(NSFetchRequest *)request {
  NSArray *results;
  NSError *error;

  results = [self.context executeFetchRequest:request error:&error];

  if (error) {
    NSLog(@"Core Data Fetch Error: %@", error.localizedDescription);
  }

  return results;
}

- (void)save {
  [self.appDelegate saveContext];
}

- (id)buildInstance:(id)type {
  NSString *className;
  NSEntityDescription *entity;

  className = NSStringFromClass([type class]);
  entity = [NSEntityDescription entityForName:className
                       inManagedObjectContext:self.context];

  return [[[type class] alloc] initWithEntity:entity
               insertIntoManagedObjectContext:self.context];
}

- (NSFetchedResultsController *)resultsControllerFor:(NSFetchRequest *)request
                                  sectionNameKeyPath:(NSString *)keyPath
                                           cacheName:(NSString *)cacheName {
  NSFetchedResultsController *results;
  NSManagedObjectContext *ctx;
  NSError *error;

  ctx = self.context;
  results = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                managedObjectContext:ctx
                                                  sectionNameKeyPath:keyPath
                                                           cacheName:cacheName];
  [results performFetch:&error];

  if (error) {
    NSLog(@"Core Data Fetch Error: %@", error.localizedDescription);
  }

  return results;
}
@end
