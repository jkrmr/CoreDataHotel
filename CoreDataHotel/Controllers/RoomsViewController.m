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

  self.tableView = [UIBuilder buildTableView];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];
  
  [NSLayoutConstraint activateConstraints:@[
    [[self.tableView topAnchor]
        constraintEqualToAnchor:[self.view topAnchor]],
    [[self.tableView bottomAnchor]
        constraintEqualToAnchor:[self.view bottomAnchor]],
    [[self.tableView leadingAnchor]
        constraintEqualToAnchor:[self.view leadingAnchor]],
    [[self.tableView trailingAnchor]
        constraintEqualToAnchor:[self.view trailingAnchor]],
  ]];
}

// MARK: TableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell;
  cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                         forIndexPath:indexPath];
  Room *selectedRoom;
  selectedRoom = self.rooms[indexPath.row];

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
