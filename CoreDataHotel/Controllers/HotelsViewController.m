//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "HotelsViewController.h"

@interface HotelsViewController ()
@property (strong, nonatomic) NSArray *hotels;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation HotelsViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  
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

// MARK: Core Data fetching
- (NSArray*) hotels {
  if (!_hotels) { _hotels = [self hotelsFromCoreData]; }
  return _hotels;
}

- (NSArray*) hotelsFromCoreData {
  AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
  NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
  NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  
  NSError *fetchError;
  NSArray *hotels = [context executeFetchRequest:req error:&fetchError];

  if (fetchError) {
    NSLog(@"HotelsVC: There was a problem fetching hotels list from core data");
  }

  return hotels;
}

// MARK: TableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.hotels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

  Hotel *selectedHotel = self.hotels[indexPath.row];
  cell.textLabel.text = selectedHotel.name;
  return cell;
}

// MARK: TableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  RoomsViewController *roomsVC = [[RoomsViewController alloc] init];
  Hotel *selectedHotel = self.hotels[indexPath.row];
  roomsVC.hotel = selectedHotel;
  roomsVC.rooms = [selectedHotel.rooms allObjects];
  [self.navigationController pushViewController:roomsVC animated:YES];
}
@end
