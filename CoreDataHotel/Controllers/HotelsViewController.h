//
//  HotelsViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "CoreData.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "Hotel+Summary.h"
#import "Room+ComparisonUtils.h"
#import "RoomsViewController.h"
#import <UIKit/UIKit.h>

@interface HotelsViewController
    : UIViewController <UITableViewDataSource, UITableViewDelegate>
@end
