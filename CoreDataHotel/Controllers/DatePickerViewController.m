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
@property (strong, nonatomic) UIButton *submitButton;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation DatePickerViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  self.dateFormatter = [[NSDateFormatter alloc] init];
  self.view.backgroundColor = [UIColor whiteColor];

  // set up start date picker
  self.startDate = [[UIDatePicker alloc] init];
  self.startDate.datePickerMode = UIDatePickerModeDate;
  self.startDate.minimumDate = [[NSDate alloc] init];
  [self.view addSubview:self.startDate];
  self.startDate.translatesAutoresizingMaskIntoConstraints = NO;
  [[[self.startDate leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.startDate trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[self.startDate topAnchor] constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]] setActive:YES];
  [[[self.startDate heightAnchor] constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.33] setActive:YES];
  [self.startDate addTarget:self action:@selector(startDateWasSelected) forControlEvents:UIControlEventValueChanged];

  // set up end date picker
  self.endDate = [[UIDatePicker alloc] init];
  self.endDate.minimumDate = [self addADaytoDate:self.startDate.date];
  self.endDate.datePickerMode = UIDatePickerModeDate;
  [self.view addSubview:self.endDate];
  self.endDate.translatesAutoresizingMaskIntoConstraints = NO;
  [[[self.endDate leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.endDate trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[self.endDate topAnchor] constraintEqualToAnchor:[self.startDate bottomAnchor]] setActive:YES];
  [[[self.endDate heightAnchor] constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.33] setActive:YES];

  // set up check availability button
  self.submitButton = [[UIButton alloc] init];
  self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.submitButton setTitle:@"Check availability" forState:UIControlStateNormal];
  [self.submitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [self.submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  self.submitButton.backgroundColor = [UIColor whiteColor];
  [self.submitButton addTarget:self action:@selector(submitButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.submitButton];
  [[[self.submitButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.submitButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[self.submitButton topAnchor] constraintEqualToAnchor:[self.endDate bottomAnchor]] setActive:YES];
  [[[self.submitButton heightAnchor] constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.33] setActive:YES];
}

- (void) startDateWasSelected {
  NSDate *start = self.startDate.date;
  NSDate *end = self.endDate.date;
  NSDate *newEndDate = [self addADaytoDate:start];
  self.endDate.minimumDate = newEndDate;

  // if decrementing start date from a previously selected position, reset end date
  if ([start compare:end] != NSOrderedDescending) {
    self.endDate.date = newEndDate;
  }
}

- (NSDate*) addADaytoDate:(NSDate*) date {
  // add a day to the start date
  NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSDateComponents *offset = [[NSDateComponents alloc] init];
  [offset setDay:1];
  NSDate *newDate = [gregorian dateByAddingComponents:offset toDate:date options:0];
  return newDate;
}

- (void) submitButtonWasPressed {
  RoomAvailabilityViewController *roomAvailabilityVC = [[RoomAvailabilityViewController alloc] init];
  roomAvailabilityVC.requestedStartDate = self.startDate.date;
  roomAvailabilityVC.requestedEndDate = self.endDate.date;
  [self.navigationController pushViewController:roomAvailabilityVC animated:YES];
}
@end
