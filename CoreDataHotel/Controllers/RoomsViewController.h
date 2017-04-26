//
//  RoomsViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "RoomDetailViewController.h"
#import <UIKit/UIKit.h>

@interface RoomsViewController
    : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic) Hotel *hotel;
@property(strong, nonatomic) NSArray *rooms;
@end
