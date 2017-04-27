//
//  LookUpReservationViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "LookUpReservationViewController.h"

@interface LookUpReservationViewController ()
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) UISearchBar *searchBar;
@property(strong, nonatomic) NSArray *allReservations;
@property(strong, nonatomic) NSArray *filteredReservations;
@property(strong, nonatomic) NSArray *reservations;
@property(nonatomic) BOOL inSearchMode;
@end

@implementation LookUpReservationViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];
  [self setInSearchMode:NO];

  // Set up Table View
  [self setTableView:[[UITableView alloc] init]];
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:@"cell"];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.view addSubview:self.tableView];

  NSLayoutConstraint *tvT, *tvB, *tvL, *tvR;
  tvT = [[self.tableView topAnchor] constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]];
  tvB = [[self.tableView bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]];
  tvL = [[self.tableView leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]];
  tvR = [[self.tableView trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]];

  // Set up Search Bar
  NSLayoutConstraint *searchT, *searchL, *searchR;
  [self setSearchBar:[[UISearchBar alloc] init]];
  [self.searchBar setDelegate:self];
  [self.searchBar setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.view addSubview:self.searchBar];
  searchT = [[self.searchBar topAnchor] constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]];
  searchL = [[self.searchBar leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]];
  searchR = [[self.searchBar trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]];
  
  [NSLayoutConstraint activateConstraints:@[ tvT, tvB, tvL, tvR, searchT, searchL, searchR ]];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.allReservations = [self fetchAllReservations];
}

- (NSArray *)fetchAllReservations {
  AppDelegate *appDelegate;
  NSManagedObjectContext *context;
  NSError *error;
  NSFetchRequest *request;
  NSArray *allReservations;

  appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  context = appDelegate.persistentContainer.viewContext;
  request = [ReservationQuery allReservations];
  allReservations = [context executeFetchRequest:request error:&error];
  
  if (error) {
    NSLog(@"Error fetching all reservations: %@", error.localizedDescription);
  }

  return allReservations;
}

- (NSArray *)fetchAllReservationsForGuestWithDetail:(NSString*)string {
  AppDelegate *appDelegate;
  NSManagedObjectContext *context;
  NSError *error;
  NSFetchRequest *request;
  NSArray *guestReservations;
  
  appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  context = appDelegate.persistentContainer.viewContext;
  request = [ReservationQuery reservationsWithGuestDetail: string];
  guestReservations = [context executeFetchRequest:request error:&error];
  
  if (error) {
    NSLog(@"Error fetching all reservations: %@", error.localizedDescription);
  }
  
  return guestReservations;
}

// MARK: TableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.reservations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell =
      [self.tableView dequeueReusableCellWithIdentifier:@"cell"
                                           forIndexPath:indexPath];
  Reservation *selectedReservation = self.reservations[indexPath.row];
  cell.textLabel.text = selectedReservation.summary;
  return cell;
}

// MARK: TableViewDelegate methods
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// MARK: Search Bar methods
- (NSArray*) reservations {
  if (self.inSearchMode) {
    return self.filteredReservations;
  }
  return self.allReservations;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  NSString *searchText;
  searchText = searchBar.text;
  [self setInSearchMode:YES];

  self.filteredReservations = [self fetchAllReservationsForGuestWithDetail:searchText];
  [self.tableView reloadData];

  [self.searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
  if ([searchText isEqualToString:@""]) {
    [self setInSearchMode:NO];
    [self.tableView reloadData];
    [self.searchBar resignFirstResponder];
  } else {
    [self setInSearchMode:YES];
    self.filteredReservations = [self fetchAllReservationsForGuestWithDetail:searchText];
    [self.tableView reloadData];
  }
}
@end
