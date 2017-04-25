//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (strong, nonatomic) UIDatePicker *startDate;
@property (strong, nonatomic) UIDatePicker *endDate;
@end

@implementation DatePickerViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // set up start date picker
  self.startDate = [[UIDatePicker alloc] init];
  self.startDate.datePickerMode = UIDatePickerModeDate;
  self.startDate.minimumDate = [[NSDate alloc] init];
  [self.view addSubview:self.startDate];
  self.startDate.translatesAutoresizingMaskIntoConstraints = NO;
  [[[self.startDate leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.startDate trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[self.startDate topAnchor] constraintEqualToAnchor:[self.view topAnchor]] setActive:YES];
  [[[self.startDate heightAnchor] constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.5] setActive:YES];

  // set up end date picker
  self.endDate = [[UIDatePicker alloc] init];
  self.endDate.minimumDate = [[NSDate alloc] init];
  self.endDate.datePickerMode = UIDatePickerModeDate;
  [self.view addSubview:self.endDate];
  self.endDate.translatesAutoresizingMaskIntoConstraints = NO;
  [[[self.endDate leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.endDate trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[self.endDate bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]] setActive:YES];
  [[[self.endDate heightAnchor] constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.5] setActive:YES];
}
@end
