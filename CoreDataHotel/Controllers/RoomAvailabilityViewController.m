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
@property (strong, nonatomic) NSArray *hotels;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation RoomAvailabilityViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];

  [self setTableView:[[UITableView alloc] init]];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  [self.view addSubview:self.tableView];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [[[self.tableView topAnchor] constraintEqualToAnchor:[self.view topAnchor]] setActive:YES];
  [[[self.tableView bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]] setActive:YES];
  [[[self.tableView leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.tableView trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  
  [self setRooms:[self availableRooms]];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1; //[self.hotelCount integerValue];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  Room *selectedRoom = self.rooms[indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"%@: Room %i", selectedRoom.hotel.name, selectedRoom.number];
  return cell;
}

// MARK: UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  BookViewController *bookVC = [[BookViewController alloc] init];
  bookVC.requestedRoom = self.rooms[indexPath.row];
  [self presentViewController:bookVC animated:YES completion:nil];
}
@end
