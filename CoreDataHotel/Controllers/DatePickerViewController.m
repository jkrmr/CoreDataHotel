//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property(strong, nonatomic) UIDatePicker *startDate;
@property(strong, nonatomic) UIDatePicker *endDate;
@property(strong, nonatomic) UIButton *submitButton;
@property(strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation DatePickerViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];
  [self setDateFormatter:[[NSDateFormatter alloc] init]];

  // set up start date picker
  [self setStartDate:[[UIDatePicker alloc] init]];
  [self.startDate setDatePickerMode:UIDatePickerModeDate];
  [self.startDate setMinimumDate:[[NSDate alloc] init]];
  [self.startDate addTarget:self
                     action:@selector(startDateWasSelected)
           forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:self.startDate];
  [self.startDate setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *startDateL = [[self.startDate leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *startDateR = [[self.startDate trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  NSLayoutConstraint *startDateT = [[self.startDate topAnchor]
      constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]];
  NSLayoutConstraint *startDateH = [[self.startDate heightAnchor]
      constraintEqualToAnchor:[self.view heightAnchor]
                   multiplier:0.33];

  // set up end date picker
  [self setEndDate:[[UIDatePicker alloc] init]];
  [self.endDate setMinimumDate:[self addADaytoDate:self.startDate.date]];
  [self.endDate setDatePickerMode:UIDatePickerModeDate];
  [self.view addSubview:self.endDate];
  [self.endDate setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *endDateL = [[self.endDate leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *endDateR = [[self.endDate trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  NSLayoutConstraint *endDateB = [[self.endDate topAnchor]
      constraintEqualToAnchor:[self.startDate bottomAnchor]];
  NSLayoutConstraint *endDateH = [[self.endDate heightAnchor]
      constraintEqualToAnchor:[self.view heightAnchor]
                   multiplier:0.33];

  // set up check availability button
  [self setSubmitButton:[[UIButton alloc] init]];
  [self.submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.submitButton setTitle:@"Check availability"
                     forState:UIControlStateNormal];
  [self.submitButton setTitleColor:[UIColor blackColor]
                          forState:UIControlStateNormal];
  [self.submitButton setBackgroundColor:[UIColor whiteColor]];
  [self.submitButton addTarget:self
                        action:@selector(submitButtonWasPressed)
              forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.submitButton];
  [self.submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *submitL = [[self.submitButton leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *submitR = [[self.submitButton trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  NSLayoutConstraint *submitB = [[self.submitButton topAnchor]
      constraintEqualToAnchor:[self.endDate bottomAnchor]];
  NSLayoutConstraint *submitH = [[self.submitButton heightAnchor]
      constraintEqualToAnchor:[self.view heightAnchor]
                   multiplier:0.33];

  [NSLayoutConstraint activateConstraints:@[
    startDateL, startDateR, startDateT, startDateH, endDateL, endDateR,
    endDateB, endDateH, submitL, submitR, submitB, submitH
  ]];
}

- (void)startDateWasSelected {
  NSDate *start = self.startDate.date;
  NSDate *end = self.endDate.date;
  NSDate *newEndDate = [self addADaytoDate:start];
  self.endDate.minimumDate = newEndDate;

  // if decrementing start date from a previously selected position, reset end
  // date
  if ([start compare:end] != NSOrderedDescending) {
    self.endDate.date = newEndDate;
  }
}

- (NSDate *)addADaytoDate:(NSDate *)date {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSDateComponents *offset = [[NSDateComponents alloc] init];
  [offset setDay:1];
  NSDate *newDate =
      [gregorian dateByAddingComponents:offset toDate:date options:0];
  return newDate;
}

- (void)submitButtonWasPressed {
  RoomAvailabilityViewController *roomAvailabilityVC =
      [[RoomAvailabilityViewController alloc] init];
  roomAvailabilityVC.requestedStartDate = self.startDate.date;
  roomAvailabilityVC.requestedEndDate = self.endDate.date;
  [self.navigationController pushViewController:roomAvailabilityVC
                                       animated:YES];
}
@end
