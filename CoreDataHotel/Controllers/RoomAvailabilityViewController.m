//
//  RoomAvailabilityViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "RoomAvailabilityViewController.h"

@interface RoomAvailabilityViewController ()
@property (strong, nonatomic) NSArray *hotelNames;
@property (strong, nonatomic) NSArray *rooms;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation RoomAvailabilityViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];

  [self setTableView:[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped]];
  [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  [self.view addSubview:self.tableView];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [[[self.tableView topAnchor] constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor] constant:-40] setActive:YES];
  [[[self.tableView bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]] setActive:YES];
  [[[self.tableView leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.tableView trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  
  NSArray *availableRooms = [self availableRooms];

  NSMutableDictionary *hotelsToRooms = [[NSMutableDictionary alloc] init];
  for (Room *room in availableRooms) {
    if (hotelsToRooms[room.hotel.name] == nil) {
      hotelsToRooms[room.hotel.name] = [NSMutableArray array];
    } else {
      [hotelsToRooms[room.hotel.name] addObject:room];
    }
  }

  NSMutableArray *sortedRooms = [NSMutableArray array];
  for (NSArray *rooms in [hotelsToRooms allValues]) {
    [sortedRooms addObject:[rooms sortedArrayUsingSelector:@selector(compare:)]];
  }

  self.hotelNames = [hotelsToRooms allKeys];
  self.rooms = sortedRooms;
}

- (NSArray*) availableRooms {
  AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
  NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
  NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  NSPredicate *noReservationOnRequestedInterval =
  [NSPredicate predicateWithFormat:@"SUBQUERY(reservations, $r, $r.startDate < %@ AND $r.endDate > %@).@count == 0", self.requestedEndDate, self.requestedStartDate];
  [req setPredicate:noReservationOnRequestedInterval];

  NSError *fetchError;
  NSArray *fetchedRooms = [context executeFetchRequest:req error:&fetchError];
  
  if (fetchError) {
    NSLog(@"RoomAvailabilityVC: There was a problem fetching from core data");
  }

  return fetchedRooms;
}

// MARK: UITableViewDataSource methods
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return self.hotelNames[section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.hotelNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSArray* roomsForHotel = self.rooms[section];
  return roomsForHotel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  Room *selectedRoom = self.rooms[indexPath.section][indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"Room %i", selectedRoom.number];
  return cell;
}

// MARK: UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  BookViewController *bookVC = [[BookViewController alloc] init];
  bookVC.requestedRoom = self.rooms[indexPath.section][indexPath.row];
  [self presentViewController:bookVC animated:YES completion:nil];
}
@end
