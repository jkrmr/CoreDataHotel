//
//  RoomDetailViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface RoomDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) Room *room;
@end
