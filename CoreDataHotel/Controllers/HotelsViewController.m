//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "HotelsViewController.h"

@interface HotelsViewController ()
@property(strong, nonatomic) NSArray *hotels;
@property(strong, nonatomic) UITableView *tableView;
@end

@implementation HotelsViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];

  [self setTableView:[[UITableView alloc] init]];
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:@"cell"];
  [self.tableView setDataSource:self];
  [self.tableView setDelegate:self];
  [self.view addSubview:self.tableView];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  
  [NSLayoutConstraint activateConstraints:@[
    [[self.tableView topAnchor] constraintEqualToAnchor:[self.view topAnchor]],
    [[self.tableView bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]],
    [[self.tableView leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]],
    [[self.tableView trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]]
  ]];
}

// MARK: Core Data fetching
- (NSArray *)hotels {
  if (!_hotels) {
    _hotels = [self hotelsFromCoreData];
  }
  return _hotels;
}

- (NSArray *)hotelsFromCoreData {
  NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  NSArray *hotels = [CoreData.repo resultsForQuery:req];
  return [hotels sortedArrayUsingSelector:@selector(compare:)];
}

// MARK: TableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.hotels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell;
  Hotel *selectedHotel;
  cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"
                                              forIndexPath:indexPath];
  selectedHotel = self.hotels[indexPath.row];
  cell.textLabel.text = selectedHotel.name;
  return cell;
}

// MARK: TableViewDelegate Methods
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  RoomsViewController *roomsVC = [[RoomsViewController alloc] init];
  Hotel *selectedHotel = self.hotels[indexPath.row];
  NSArray *hotelRooms = [selectedHotel.rooms allObjects];
  
  roomsVC.hotel = selectedHotel;
  roomsVC.rooms = [hotelRooms sortedArrayUsingSelector:@selector(compare:)];
  [self.navigationController pushViewController:roomsVC animated:YES];
}
@end
