//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "BookViewController.h"

@interface BookViewController ()
@property(strong, nonatomic) UITextField *firstName;
@property(strong, nonatomic) UITextField *lastName;
@property(strong, nonatomic) UITextField *emailAddress;
@end

@implementation BookViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];

  // set up first name text field
  self.firstName = [UIBuilder buildTextField];
  self.firstName.placeholder = @"First name";
  self.firstName.delegate = self;
  [self.view addSubview:self.firstName];

  // set up last name text field
  self.lastName = [UIBuilder buildTextField];
  self.lastName.placeholder = @"Last name";
  self.lastName.delegate = self;
  [self.view addSubview:self.lastName];

  // set up email text field
  self.emailAddress = [UIBuilder buildTextField];
  self.emailAddress.placeholder = @"Email address";
  self.emailAddress.autocapitalizationType = UITextAutocapitalizationTypeNone;
  self.emailAddress.keyboardType = UIKeyboardTypeEmailAddress;
  self.emailAddress.delegate = self;
  [self.view addSubview:self.emailAddress];

  UIButton *confirmButton = [UIBuilder buildButtonWithTitle:@"Confirm"];
  [confirmButton addTarget:self action:@selector(confirmButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:confirmButton];

  UIButton *cancelButton = [UIBuilder buildButtonWithTitle:@"Cancel"];
  [cancelButton addTarget:self action:@selector(cancelButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:cancelButton];

  [NSLayoutConstraint activateConstraints:@[
    [[self.firstName topAnchor] constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor] constant:10],
    [[self.firstName leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10],
    [[self.firstName trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10],
    [[self.firstName heightAnchor] constraintEqualToConstant:40],
    [[self.lastName topAnchor] constraintEqualToAnchor:[self.firstName bottomAnchor] constant:10],
    [[self.lastName leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10],
    [[self.lastName trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10],
    [[self.lastName heightAnchor] constraintEqualToConstant:40],
    [[self.emailAddress topAnchor] constraintEqualToAnchor:[self.lastName bottomAnchor] constant:10],
    [[self.emailAddress leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10],
    [[self.emailAddress trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10],
    [[self.emailAddress heightAnchor] constraintEqualToConstant:40],
    [[confirmButton bottomAnchor] constraintEqualToAnchor:[self.bottomLayoutGuide topAnchor]],
    [[confirmButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]],
    [[confirmButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]],
    [[confirmButton heightAnchor] constraintEqualToConstant:100],
    [[cancelButton bottomAnchor] constraintEqualToAnchor:[confirmButton topAnchor]],
    [[cancelButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]],
    [[cancelButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]],
    [[cancelButton heightAnchor] constraintEqualToConstant:100]
  ]];
}

- (void)cancelButtonWasPressed {
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)confirmButtonWasPressed {
  NSArray *guests = @[ @{
    @"firstName" : self.firstName.text,
    @"lastName" : self.lastName.text,
    @"emailAddress" : self.emailAddress.text
  } ];
  
  [BookingService createReservationWithStartDate:self.requestedStartDate
                                         endDate:self.requestedEndDate
                                         forRoom:self.requestedRoom
                                       guestList:guests];

  [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}
@end
