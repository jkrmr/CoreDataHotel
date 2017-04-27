//
//  AppDelegate.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property(strong, nonatomic) UINavigationController *navController;
@property(strong, nonatomic) HomeViewController *homeVC;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [Fabric with:@[ [Answers class] ]];
  [self setupRootViewController];
  [self generateTestData];
  return YES;
}

- (void)setupRootViewController {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.homeVC = [[HomeViewController alloc] init];
  self.navController =
      [[UINavigationController alloc] initWithRootViewController:self.homeVC];

  self.window.rootViewController = self.navController;
  [self.window makeKeyAndVisible];
}

- (void)generateTestData {
  NSFetchRequest *req;
  req = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];

  NSInteger hotelsCount;
  hotelsCount =
      [self.persistentContainer.viewContext countForFetchRequest:req error:nil];

  // If hotels have already been persisted, return early.
  if (hotelsCount > 0) {
    return;
  }

  NSString *jsonPath;
  jsonPath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];

  NSData *jsonData;
  NSError *jsonError;
  NSDictionary *dict;
  jsonData = [NSData dataWithContentsOfFile:jsonPath];
  dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                         options:NSJSONReadingMutableContainers
                                           error:&jsonError];
  if (jsonError) {
    NSLog(@"%@", jsonError.localizedDescription);
  }

  for (NSDictionary *hotel in dict[@"Hotels"]) {
    Hotel *newHotel = [CoreData.repo buildInstance:[Hotel class]];
    newHotel.name = hotel[@"name"];
    newHotel.location = hotel[@"location"];
    newHotel.stars = [hotel[@"stars"] integerValue];

    for (NSDictionary *room in hotel[@"rooms"]) {
      Room *newRoom = [CoreData.repo buildInstance:[Room class]];
      newRoom.number = [room[@"number"] integerValue];
      newRoom.beds = [room[@"beds"] integerValue];
      newRoom.rate = [room[@"rate"] integerValue];
      newRoom.hotel = newHotel;
    }
  }

  [CoreData.repo save];
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
  [self saveContext];
}

#pragma mark - Core Data stack
@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
  // The persistent container for the application. This implementation creates
  // and returns a container, having loaded the store for the application to it.
  @synchronized(self) {
    if (_persistentContainer == nil) {
      _persistentContainer =
          [[NSPersistentContainer alloc] initWithName:@"CoreDataHotel"];
      [_persistentContainer
          loadPersistentStoresWithCompletionHandler:^(
              NSPersistentStoreDescription *storeDescription, NSError *error) {
            if (error != nil) {
              // Replace this implementation with code to handle the error
              // appropriately. abort() causes the application to generate a
              // crash log and terminate. You should not use this function in a
              // shipping application, although it may be useful during
              // development.

              /*
               Typical reasons for an error here include:
               * The parent directory does not exist, cannot be created, or
               disallows writing. * The persistent store is not accessible, due
               to permissions or data protection when the device is locked. *
               The device is out of space. * The store could not be migrated to
               the current model version. Check the error message to determine
               what the actual problem was.
               */
              NSLog(@"Unresolved error %@, %@", error, error.userInfo);
              abort();
            }
          }];
    }
  }

  return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
  NSManagedObjectContext *context = self.persistentContainer.viewContext;
  NSError *error = nil;
  if ([context hasChanges] && ![context save:&error]) {
    // Replace this implementation with code to handle the error appropriately.
    // abort() causes the application to generate a crash log and terminate. You
    // should not use this function in a shipping application, although it may
    // be useful during development.
    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
    abort();
  }
}

@end
