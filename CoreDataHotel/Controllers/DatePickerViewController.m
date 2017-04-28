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

  // set up end date picker
  [self setEndDate:[[UIDatePicker alloc] init]];
  [self.endDate setMinimumDate:[self addADaytoDate:self.startDate.date]];
  [self.endDate setDatePickerMode:UIDatePickerModeDate];
  [self.view addSubview:self.endDate];
  [self.endDate setTranslatesAutoresizingMaskIntoConstraints:NO];

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

  [NSLayoutConstraint activateConstraints:@[
    [[self.startDate leadingAnchor]
           constraintEqualToAnchor:[self.view leadingAnchor]],
    [[self.startDate trailingAnchor]
           constraintEqualToAnchor:[self.view trailingAnchor]],
    [[self.startDate topAnchor]
           constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]],
    [[self.startDate heightAnchor]
           constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.33],
    [[self.endDate leadingAnchor]
           constraintEqualToAnchor:[self.view leadingAnchor]],
    [[self.endDate trailingAnchor]
           constraintEqualToAnchor:[self.view trailingAnchor]],
    [[self.endDate topAnchor]
           constraintEqualToAnchor:[self.startDate bottomAnchor]],
    [[self.endDate heightAnchor]
           constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.33],
    [[self.submitButton leadingAnchor]
           constraintEqualToAnchor:[self.view leadingAnchor]],
    [[self.submitButton trailingAnchor]
           constraintEqualToAnchor:[self.view trailingAnchor]],
    [[self.submitButton topAnchor]
           constraintEqualToAnchor:[self.endDate bottomAnchor]],
    [[self.submitButton heightAnchor]
       constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.33]
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
  NSCalendar *gregorianCal;
  gregorianCal = [[NSCalendar alloc]
                  initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  
  NSDateComponents *addADay;
  addADay = [[NSDateComponents alloc] init];
  [addADay setDay:1];
  
  return [gregorianCal dateByAddingComponents:addADay toDate:date options:0];
}

- (void)submitButtonWasPressed {
  RoomAvailabilityViewController *roomAvailabilityVC;
  roomAvailabilityVC = [[RoomAvailabilityViewController alloc] init];
  roomAvailabilityVC.requestedStartDate = self.startDate.date;
  roomAvailabilityVC.requestedEndDate = self.endDate.date;
  [self.navigationController pushViewController:roomAvailabilityVC
                                       animated:YES];
}
@end
