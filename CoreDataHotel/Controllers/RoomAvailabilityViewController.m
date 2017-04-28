//
//  RoomAvailabilityViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "RoomAvailabilityViewController.h"

@interface RoomAvailabilityViewController ()
@property(strong, nonatomic) NSFetchedResultsController *rooms;
@property(strong, nonatomic) UITableView *tableView;
@end

@implementation RoomAvailabilityViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];

  self.tableView = [UIBuilder buildTableView];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];

  [NSLayoutConstraint activateConstraints:@[
    [[self.tableView topAnchor] constraintEqualToAnchor:[self.view topAnchor]],
    [[self.tableView bottomAnchor]
        constraintEqualToAnchor:[self.view bottomAnchor]],
    [[self.tableView leadingAnchor]
        constraintEqualToAnchor:[self.view leadingAnchor]],
    [[self.tableView trailingAnchor]
        constraintEqualToAnchor:[self.view trailingAnchor]]
  ]];
}

- (void)viewWillAppear:(BOOL)animated {
  self.rooms = [self availableRooms];
  [self.tableView reloadData];
}

- (NSFetchedResultsController *)availableRooms {
  NSDate *startDate, *endDate;
  startDate = self.requestedStartDate;
  endDate = self.requestedEndDate;

  NSFetchRequest *request;
  request = [RoomQuery availableOnDaysFrom:startDate to:endDate];

  NSFetchedResultsController *fetchedRooms;
  fetchedRooms = [CoreData.repo resultsControllerFor:request
                                  sectionNameKeyPath:@"hotel.name"
                                           cacheName:nil];
  return fetchedRooms;
}

// MARK: UITableViewDataSource methods
- (NSString *)tableView:(UITableView *)tableView
    titleForHeaderInSection:(NSInteger)section {
  id<NSFetchedResultsSectionInfo> sectionInfo;
  sectionInfo = [self.rooms.sections objectAtIndex:section];
  return sectionInfo.name;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.rooms.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  id<NSFetchedResultsSectionInfo> sectionInfo;
  sectionInfo = [self.rooms.sections objectAtIndex:section];
  return sectionInfo.numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell;
  cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"
                                              forIndexPath:indexPath];
  Room *selectedRoom;
  selectedRoom = [self.rooms objectAtIndexPath:indexPath];

  NSString *roomNumber;
  roomNumber = [NSString stringWithFormat:@"Room %i", selectedRoom.number];
  cell.textLabel.text = roomNumber;
  return cell;
}

// MARK: UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  BookViewController *bookVC = [[BookViewController alloc] init];
  bookVC.requestedRoom = [self.rooms objectAtIndexPath:indexPath];
  bookVC.requestedStartDate = self.requestedStartDate;
  bookVC.requestedEndDate = self.requestedEndDate;
  [self.navigationController pushViewController:bookVC animated:YES];
}
@end
