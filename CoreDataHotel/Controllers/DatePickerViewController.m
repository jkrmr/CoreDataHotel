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
  [self.view addSubview:self.startDate];
  self.startDate.translatesAutoresizingMaskIntoConstraints = NO;
  [[[self.startDate leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.startDate trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[self.startDate bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]] setActive:YES];
  [[[self.startDate heightAnchor] constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.3] setActive:YES];

  // set up end date picker
}
@end
