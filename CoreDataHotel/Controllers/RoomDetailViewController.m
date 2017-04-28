//
//  RoomDetailViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "RoomDetailViewController.h"

@interface RoomDetailViewController ()
@property(strong, nonatomic) NSArray *reservations;
@property(strong, nonatomic) UITableView *tableView;
@end

@implementation RoomDetailViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];
  self.reservations = [self.room.reservations allObjects];

  self.tableView = [UIBuilder buildTableView];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
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

// MARK: UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.reservations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell;
  Reservation *selectedReservation;
  cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                         forIndexPath:indexPath];
  selectedReservation = self.reservations[indexPath.row];
  cell.textLabel.text = selectedReservation.description;
  return cell;
}

// MARK: UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"selected a reservation");
}
@end
