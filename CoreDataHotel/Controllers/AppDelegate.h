//
//  AppDelegate.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "CoreData.h"
#import "HomeViewController.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import <Answers/Answers.h>
#import <CoreData/CoreData.h>
#import <Fabric/Fabric.h>
#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(strong, nonatomic) UIWindow *window;
@property(readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;
@end
