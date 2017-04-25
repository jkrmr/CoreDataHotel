//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "RoomsViewController.h"

@interface RoomsViewController ()
//@property (strong, nonatomic) UITableView *tableView;
@end

@implementation RoomsViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  NSLog(@"Hotel: %@", self.hotel.name);
  NSLog(@"Rooms: %i", (int)self.rooms.count);
}
@end
