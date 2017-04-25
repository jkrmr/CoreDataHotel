//
//  RoomAvailabilityViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "RoomAvailabilityViewController.h"

@interface RoomAvailabilityViewController ()
@property (strong, nonatomic) NSArray *rooms;
@property (strong, nonatomic) NSNumber *hotelCount;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation RoomAvailabilityViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

//  self.tableView = [[UITableView alloc] init];
  self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
  [self.view addSubview:self.tableView];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;

  // TEMP
  AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
  NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
  NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  
  NSError *fetchError;
  NSArray *hotels = [context executeFetchRequest:req error:&fetchError];
  
  if (fetchError) {
    NSLog(@"there was a problem fetching hotels list from core data");
  } else {
    NSLog(@"loaded hotels from core data");
  }

  self.hotelCount = [NSNumber numberWithUnsignedInteger:hotels.count];
  self.rooms = [[[hotels firstObject] rooms] allObjects];
}

// MARK: UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1; //[self.hotelCount integerValue];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"
                                                               forIndexPath:indexPath];
  Room *selectedRoom = self.rooms[indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"%@: Room %i", selectedRoom.hotel.name, selectedRoom.number];
  return cell;
}

// MARK: UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"selected a room");
}
@end
