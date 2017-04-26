//
//  RoomDetailViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "RoomDetailViewController.h"

@interface RoomDetailViewController ()
@property (strong, nonatomic) NSArray *reservations;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation RoomDetailViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];

  self.reservations = [self.room.reservations allObjects];
  
  [self setTableView:[[UITableView alloc] init]];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
  [self.tableView setDataSource:self];
  [self.tableView setDelegate:self];
  [self.view addSubview:self.tableView];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [[[self.tableView topAnchor] constraintEqualToAnchor:[self.view topAnchor]] setActive:YES];
  [[[self.tableView bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]] setActive:YES];
  [[[self.tableView leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.tableView trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
}

// MARK: UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.reservations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  Reservation *selectedReservation = self.reservations[indexPath.row];
  cell.textLabel.text = selectedReservation.description;
  return cell;
}

// MARK: UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"selected a reservation");
}
@end
