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
  NSLayoutConstraint *tvT = [[self.tableView topAnchor] constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor] constant:-40];
  NSLayoutConstraint *tvB = [[self.tableView bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]];
  NSLayoutConstraint *tvL = [[self.tableView leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *tvR = [[self.tableView trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]];
  [NSLayoutConstraint activateConstraints:@[tvT, tvB, tvL, tvR]];
}

- (void) viewWillAppear:(BOOL)animated {
  NSArray *availableRooms = [self availableRooms];

  NSMutableDictionary *hotelNamesToRooms = [[NSMutableDictionary alloc] init];
  for (Room *room in availableRooms) {
    if (hotelNamesToRooms[room.hotel.name] == nil) {
      hotelNamesToRooms[room.hotel.name] = [NSMutableArray array];
    } else {
      [hotelNamesToRooms[room.hotel.name] addObject:room];
    }
  }

  self.hotelNames = [hotelNamesToRooms allKeys];
  self.rooms = [hotelNamesToRooms allValues];
  
  [self.tableView reloadData];
}

- (NSArray*) availableRooms {
  AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
  NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
  NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  NSPredicate *noReservationOnRequestedInterval =
  [NSPredicate predicateWithFormat:@"SUBQUERY(reservations, $r, $r.startDate < %@ AND $r.endDate > %@).@count == 0", self.requestedEndDate, self.requestedStartDate];
  [req setPredicate:noReservationOnRequestedInterval];
  NSSortDescriptor *byHotelName = [NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES];
  NSSortDescriptor *byRoomNumber = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
  [req setSortDescriptors:@[byHotelName, byRoomNumber]];

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
  bookVC.requestedStartDate = self.requestedStartDate;
  bookVC.requestedEndDate = self.requestedEndDate;
  [self presentViewController:bookVC animated:YES completion:nil];
}
@end
