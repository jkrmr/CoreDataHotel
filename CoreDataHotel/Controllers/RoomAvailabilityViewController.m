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
  NSLayoutConstraint *tvT = [[self.tableView topAnchor]
      constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]
                     constant:-40];
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
  AppDelegate *appDelegate =
      (AppDelegate *)[[UIApplication sharedApplication] delegate];
  NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;

  NSFetchRequest *request =
      [RoomQuery availableOnDaysFrom:self.requestedStartDate
                                  to:self.requestedEndDate];
  NSError *fetchError;
  NSFetchedResultsController *fetchedRooms =
      [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                          managedObjectContext:context
                                            sectionNameKeyPath:@"hotel.name"
                                                     cacheName:nil];
  [fetchedRooms performFetch:&fetchError];
  if (fetchError) {
    NSLog(@"RoomAvailabilityVC: There was a problem fetching from core data");
  }

  return fetchedRooms;
}

// MARK: UITableViewDataSource methods
- (NSString *)tableView:(UITableView *)tableView
    titleForHeaderInSection:(NSInteger)section {
  id<NSFetchedResultsSectionInfo> sectionInfo =
      [self.rooms.sections objectAtIndex:section];
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
  id<NSFetchedResultsSectionInfo> sectionInfo =
      [self.rooms.sections objectAtIndex:section];
  return sectionInfo.numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell =
      [self.tableView dequeueReusableCellWithIdentifier:@"cell"
                                           forIndexPath:indexPath];
  Room *selectedRoom = [self.rooms objectAtIndexPath:indexPath];
  cell.textLabel.text =
      [NSString stringWithFormat:@"Room %i", selectedRoom.number];
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
  [self presentViewController:bookVC animated:YES completion:nil];
}
@end
