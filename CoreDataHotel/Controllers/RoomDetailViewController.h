//
//  RoomDetailViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "UIBuilder.h"
#import <UIKit/UIKit.h>

@interface RoomDetailViewController
    : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic) Room *room;
@end
