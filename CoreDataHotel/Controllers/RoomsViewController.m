//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "RoomsViewController.h"

@interface RoomsViewController ()
@property(strong, nonatomic) UITableView *tableView;
@end

@implementation RoomsViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];

  [self setTableView:[[UITableView alloc] init]];
  [self.tableView setDataSource:self];
  [self.tableView setDelegate:self];
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:@"cell"];
  [self.view addSubview:self.tableView];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *tvT = [[self.tableView topAnchor]
      constraintEqualToAnchor:[self.view topAnchor]];
  NSLayoutConstraint *tvB = [[self.tableView bottomAnchor]
      constraintEqualToAnchor:[self.view bottomAnchor]];
  NSLayoutConstraint *tvL = [[self.tableView leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *tvR = [[self.tableView trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  [NSLayoutConstraint activateConstraints:@[ tvT, tvB, tvL, tvR ]];
}

// MARK: TableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell;
  Room *selectedRoom;
  
  cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                         forIndexPath:indexPath];
  selectedRoom = self.rooms[indexPath.row];

  NSLog(@"%@", selectedRoom);
  cell.textLabel.text = [NSString stringWithFormat:@"%@", selectedRoom.summary];
  return cell;
}

// MARK: TableViewDelegate Methods
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Room *selectedRoom;
  RoomDetailViewController *roomDetailVC;
  
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  selectedRoom = self.rooms[indexPath.row];
  roomDetailVC = [[RoomDetailViewController alloc] init];
  roomDetailVC.room = selectedRoom;
  [self.navigationController pushViewController:roomDetailVC animated:YES];
}
@end
