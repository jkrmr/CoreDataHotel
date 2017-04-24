//
//  HotelViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "HotelViewController.h"

@interface HotelViewController ()
@property (strong, nonatomic) NSArray *allHotels;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation HotelViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  [self.view addSubview:self.tableView];
  self.tableView.dataSource = self;
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
  self.view.backgroundColor = [UIColor whiteColor];
}

// MARK: Core Data fetching
- (NSArray*) allHotels {
  if (!_allHotels) { _allHotels = [self hotelsFromCoreData]; }
  return _allHotels;
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
  return self.allHotels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

  Hotel *selectedHotel = self.allHotels[indexPath.row];
  cell.textLabel.text = selectedHotel.name;
  return cell;
}
@end
