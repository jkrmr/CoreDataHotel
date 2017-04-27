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

  [self
      setTableView:[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                style:UITableViewStyleGrouped]];
  [self.tableView
      setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:@"cell"];
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  [self.view addSubview:self.tableView];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *tvT =
      [[self.tableView topAnchor] constraintEqualToAnchor:[self.view topAnchor]
                                                 constant:25];
  NSLayoutConstraint *tvB = [[self.tableView bottomAnchor]
      constraintEqualToAnchor:[self.view bottomAnchor]];
  NSLayoutConstraint *tvL = [[self.tableView leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *tvR = [[self.tableView trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  [NSLayoutConstraint activateConstraints:@[ tvT, tvB, tvL, tvR ]];
}

- (void)viewWillAppear:(BOOL)animated {
  self.rooms = [self availableRooms];
  [self.tableView reloadData];
}

- (NSFetchedResultsController *)availableRooms {
  NSFetchRequest *request;
  request = [RoomQuery availableOnDaysFrom:self.requestedStartDate
                                        to:self.requestedEndDate];
  
  NSFetchedResultsController *fetchedRooms;
  fetchedRooms = [CoreData.repo resultsControllerForQuery:request
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

- (CGFloat)tableView:(UITableView *)tableView
    heightForHeaderInSection:(NSInteger)section {
  return 10;
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
