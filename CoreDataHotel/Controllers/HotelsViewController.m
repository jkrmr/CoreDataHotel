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
  
  self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
  [self.view addSubview:self.tableView];
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
    NSLog(@"there was a problem fetching hotels list from core data");
  } else {
    NSLog(@"loaded hotels from core data");
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
  RoomsViewController *roomsVC = [[RoomsViewController alloc] init];
  Hotel *selectedHotel = self.hotels[indexPath.row];
  roomsVC.hotel = selectedHotel;

  NSMutableArray *hotelRooms = [NSMutableArray array];

  if (selectedHotel.rooms) {
    for (Room *room in selectedHotel.rooms) {
      [hotelRooms addObject:room];
    }
  }
  roomsVC.rooms = hotelRooms;
  
  [self.navigationController pushViewController:roomsVC animated:YES];
}
@end
