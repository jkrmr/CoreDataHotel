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

  // Set up Search Bar
  [self setSearchBar:[[UISearchBar alloc] init]];
  [self.searchBar setDelegate:self];
  [self.searchBar setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.view addSubview:self.searchBar];
  self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;

  [NSLayoutConstraint activateConstraints:@[
    [[self.tableView topAnchor]
        constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]],
    [[self.tableView bottomAnchor]
        constraintEqualToAnchor:[self.view bottomAnchor]],
    [[self.tableView leadingAnchor]
        constraintEqualToAnchor:[self.view leadingAnchor]],
    [[self.tableView trailingAnchor]
        constraintEqualToAnchor:[self.view trailingAnchor]],
     [[self.searchBar topAnchor]
        constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]],
     [[self.searchBar leadingAnchor]
        constraintEqualToAnchor:[self.view leadingAnchor]],
     [[self.searchBar trailingAnchor]
        constraintEqualToAnchor:[self.view trailingAnchor]]
  ]];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.allReservations = [self fetchAllReservations];
}

- (NSArray *)fetchAllReservations {
  NSFetchRequest *request = [ReservationQuery allReservations];
  NSArray *allReservations = [CoreData.repo resultsForQuery:request];
  return allReservations;
}

- (NSArray *)fetchReservationsWithGuestDetail:(NSString *)string {
  NSFetchRequest *req = [ReservationQuery reservationsWithGuestDetail:string];
  NSArray *guestReservations = [CoreData.repo resultsForQuery:req];
  return guestReservations;
}

// MARK: TableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.reservations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell;
  Reservation *selectedReservation;

  cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"
                                              forIndexPath:indexPath];
  selectedReservation = self.reservations[indexPath.row];
  cell.textLabel.text = selectedReservation.summary;
  return cell;
}

// MARK: TableViewDelegate methods
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// MARK: Search Bar methods
- (NSArray *)reservations {
  if (self.inSearchMode) {
    return self.filteredReservations;
  }
  return self.allReservations;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  NSString *searchText;
  searchText = searchBar.text;
  [self setInSearchMode:YES];

  self.filteredReservations =
      [self fetchReservationsWithGuestDetail:searchText];
  [self.tableView reloadData];

  [self.searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText {
  if ([searchText isEqualToString:@""]) {
    [self setInSearchMode:NO];
    [self.tableView reloadData];
    [self.searchBar resignFirstResponder];
  } else {
    [self setInSearchMode:YES];
    self.filteredReservations =
        [self fetchReservationsWithGuestDetail:searchText];
    [self.tableView reloadData];
  }
}
@end
