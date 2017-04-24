//
//  AppDelegate.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "AppDelegate.h"
#import "HotelViewController.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface AppDelegate ()
@property(strong, nonatomic) UINavigationController *navController;
@property(strong, nonatomic) HotelViewController *hotelVC;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [self setupRootViewController];
  [self generateTestData];
  return YES;
}

- (void) setupRootViewController {
  self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
  self.hotelVC = [[HotelViewController alloc] init];
  self.navController = [[UINavigationController alloc] initWithRootViewController: self.hotelVC];

  self.window.rootViewController = self.navController;
  [self.window makeKeyAndVisible];
}

- (void) generateTestData {
  NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName: @"Hotel"];
  NSError *error;
  NSInteger count = [self.persistentContainer.viewContext countForFetchRequest: req
                                                                         error: &error];
  if (error) {
    NSLog(@"%@", error.localizedDescription);
  }

  if (count == 0) {
    NSString *path = [[NSBundle mainBundle] pathForResource: @"hotels" ofType: @"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile: path];
    NSError *jsonError;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData: jsonData
                                                         options: NSJSONReadingMutableContainers
                                                           error: &jsonError];

    if (jsonError) {
      NSLog(@"%@", jsonError.localizedDescription);
    }

    for (NSDictionary *hotel in dict[@"Hotels"]) {
      Hotel *newHotel = [NSEntityDescription insertNewObjectForEntityForName: @"Hotel"
                                                      inManagedObjectContext: self.persistentContainer.viewContext];
      newHotel.name = hotel[@"name"];
      newHotel.location = hotel[@"location"];
      newHotel.stars = (NSInteger)hotel[@"stars"];

      for (NSDictionary *room in hotel[@"rooms"]) {
        Room *newRoom = [NSEntityDescription insertNewObjectForEntityForName: @"Room"
                                                      inManagedObjectContext: self.persistentContainer.viewContext];
        newRoom.number = (NSInteger)room[@"number"];
        newRoom.beds = (NSInteger)room[@"beds"];
        newRoom.rate = (NSInteger)room[@"rate"];
        newRoom.hotel = newHotel;
      }
    }

    NSError *saveError;
    [self.persistentContainer.viewContext save: &saveError];

    if (saveError) {
      NSLog(@"Error saving to core data");
    } else {
      NSLog(@"Saved to core data");
    }
  }
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
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreDataHotel"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
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
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
