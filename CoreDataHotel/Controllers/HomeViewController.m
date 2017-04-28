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
  UIButton *bookButton = [[UIButton alloc] init];
  bookButton.translatesAutoresizingMaskIntoConstraints = NO;
  [bookButton setTitle:@"Book a room" forState:UIControlStateNormal];
  [bookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [bookButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [bookButton setBackgroundColor:[UIColor whiteColor]];
  [bookButton addTarget:self
                 action:@selector(bookButtonWasPressed)
       forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:bookButton];

  UIButton *browseButton = [[UIButton alloc] init];
  browseButton.translatesAutoresizingMaskIntoConstraints = NO;
  [browseButton setTitle:@"Browse hotels" forState:UIControlStateNormal];
  [browseButton setTitleColor:[UIColor blackColor]
                     forState:UIControlStateNormal];
  [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [browseButton setBackgroundColor:[UIColor whiteColor]];
  [browseButton addTarget:self
                   action:@selector(browseButtonWasPressed)
         forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:browseButton];

  UIButton *lookupButton = [[UIButton alloc] init];
  lookupButton.translatesAutoresizingMaskIntoConstraints = NO;
  [lookupButton setTitle:@"See all bookings" forState:UIControlStateNormal];
  [lookupButton setTitleColor:[UIColor blackColor]
                     forState:UIControlStateNormal];
  [lookupButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [lookupButton setBackgroundColor:[UIColor whiteColor]];
  [lookupButton addTarget:self
                   action:@selector(lookupButtonWasPressed)
         forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:lookupButton];

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
