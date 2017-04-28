//
//  HomeViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@end

@implementation HomeViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];
  [self setupLayout];
}

- (void)setupLayout {
  UIButton *bookButton = [UIBuilder buildButtonWithTitle:@"Book a room"];
  [self.view addSubview:bookButton];
  [bookButton addTarget:self
                 action:@selector(bookButtonWasPressed)
       forControlEvents:UIControlEventTouchUpInside];

  UIButton *browseButton = [UIBuilder buildButtonWithTitle:@"Browse hotels"];
  [self.view addSubview:browseButton];
  [browseButton addTarget:self
                   action:@selector(browseButtonWasPressed)
         forControlEvents:UIControlEventTouchUpInside];

  UIButton *lookupButton = [UIBuilder buildButtonWithTitle:@"See all bookings"];
  [self.view addSubview:lookupButton];
  [lookupButton addTarget:self
                   action:@selector(lookupButtonWasPressed)
         forControlEvents:UIControlEventTouchUpInside];

  [NSLayoutConstraint activateConstraints:@[
    [[bookButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]],
    [[bookButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]],
    [[bookButton bottomAnchor] constraintEqualToAnchor:[self.bottomLayoutGuide topAnchor]],
    [[bookButton heightAnchor] constraintEqualToConstant:100],
    [[browseButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]],
    [[browseButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]],
    [[browseButton bottomAnchor] constraintEqualToAnchor:[bookButton topAnchor]],
    [[browseButton heightAnchor] constraintEqualToConstant:100],
    [[lookupButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]],
    [[lookupButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]],
    [[lookupButton bottomAnchor] constraintEqualToAnchor:[browseButton topAnchor]],
    [[lookupButton heightAnchor] constraintEqualToConstant:100]
  ]];
}

- (void)browseButtonWasPressed {
  HotelsViewController *hotelsVC = [[HotelsViewController alloc] init];
  [[self navigationController] pushViewController:hotelsVC animated:YES];
}

- (void)bookButtonWasPressed {
  DatePickerViewController *datePickerVC =
      [[DatePickerViewController alloc] init];
  [[self navigationController] pushViewController:datePickerVC animated:YES];
}

- (void)lookupButtonWasPressed {
  LookUpReservationViewController *lookupVC =
      [[LookUpReservationViewController alloc] init];
  [[self navigationController] pushViewController:lookupVC animated:YES];
}
@end
