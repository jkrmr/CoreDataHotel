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
  [bookButton setTitle:@"Book" forState:UIControlStateNormal];
  [bookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [bookButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [bookButton setBackgroundColor:[UIColor whiteColor]];
  [bookButton addTarget:self
                 action:@selector(bookButtonWasPressed)
       forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:bookButton];
  NSLayoutConstraint *bookL = [[bookButton leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *bookT = [[bookButton trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  NSLayoutConstraint *bookB = [[bookButton bottomAnchor]
      constraintEqualToAnchor:[self.bottomLayoutGuide topAnchor]];
  NSLayoutConstraint *bookH =
      [[bookButton heightAnchor] constraintEqualToConstant:100];

  UIButton *browseButton = [[UIButton alloc] init];
  browseButton.translatesAutoresizingMaskIntoConstraints = NO;
  [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
  [browseButton setTitleColor:[UIColor blackColor]
                     forState:UIControlStateNormal];
  [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [browseButton setBackgroundColor:[UIColor whiteColor]];
  [browseButton addTarget:self
                   action:@selector(browseButtonWasPressed)
         forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:browseButton];
  NSLayoutConstraint *browseL = [[browseButton leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *browseT = [[browseButton trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  NSLayoutConstraint *browseB = [[browseButton bottomAnchor]
      constraintEqualToAnchor:[bookButton topAnchor]];
  NSLayoutConstraint *browseH =
      [[browseButton heightAnchor] constraintEqualToConstant:100];

  [NSLayoutConstraint activateConstraints:@[
    bookL, bookT, bookB, bookH, browseL, browseT, browseB, browseH
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
@end
