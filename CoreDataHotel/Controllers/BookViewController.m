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
  UITextField *firstName = [[UITextField alloc] init];
  firstName.translatesAutoresizingMaskIntoConstraints = NO;
  firstName.textColor = [UIColor blackColor];
  firstName.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  firstName.backgroundColor = [UIColor whiteColor];
  firstName.borderStyle = UITextBorderStyleRoundedRect;
  firstName.text = @"";
  firstName.placeholder = @"First name";
  firstName.autocorrectionType = UITextAutocorrectionTypeNo;
  firstName.autocapitalizationType = UITextAutocapitalizationTypeWords;
  firstName.returnKeyType = UIReturnKeyDone;
  firstName.delegate = self;
  [self.view addSubview:firstName];
  self.firstName = firstName;

  // set up last name text field
  UITextField *lastName = [[UITextField alloc] init];
  lastName.translatesAutoresizingMaskIntoConstraints = NO;
  lastName.textColor = [UIColor blackColor];
  lastName.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  lastName.backgroundColor = [UIColor whiteColor];
  lastName.borderStyle = UITextBorderStyleRoundedRect;
  lastName.text = @"";
  lastName.placeholder = @"Last name";
  lastName.autocorrectionType = UITextAutocorrectionTypeNo;
  lastName.autocapitalizationType = UITextAutocapitalizationTypeWords;
  lastName.returnKeyType = UIReturnKeyDone;
  lastName.delegate = self;
  [self.view addSubview:lastName];
  self.lastName = lastName;

  // set up email text field
  UITextField *email = [[UITextField alloc] init];
  email.translatesAutoresizingMaskIntoConstraints = NO;
  email.textColor = [UIColor blackColor];
  email.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  email.backgroundColor = [UIColor whiteColor];
  email.borderStyle = UITextBorderStyleRoundedRect;
  email.text = @"";
  email.placeholder = @"Email address";
  email.autocorrectionType = UITextAutocorrectionTypeNo;
  email.autocapitalizationType = UITextAutocapitalizationTypeNone;
  email.keyboardType = UIKeyboardTypeEmailAddress;
  email.returnKeyType = UIReturnKeyDone;
  email.delegate = self;
  [self.view addSubview:email];
  self.emailAddress = email;

  UIButton *confirmButton = [[UIButton alloc] init];
  confirmButton.translatesAutoresizingMaskIntoConstraints = NO;
  [confirmButton setTitle:@"Confirm" forState:UIControlStateNormal];
  [confirmButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [confirmButton setBackgroundColor:[UIColor colorWithRed:0.2 green:0.56 blue:0.2 alpha:1.0]];
  [confirmButton addTarget:self action:@selector(confirmButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:confirmButton];

  UIButton *cancelButton = [[UIButton alloc] init];
  cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
  [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
  [cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [cancelButton setBackgroundColor:[UIColor redColor]];
  [cancelButton addTarget:self action:@selector(cancelButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:cancelButton];

  [NSLayoutConstraint activateConstraints:@[
    [[firstName topAnchor] constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor] constant:10],
    [[firstName leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10],
    [[firstName trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10],
    [[firstName heightAnchor] constraintEqualToConstant:40],
    [[lastName topAnchor] constraintEqualToAnchor:[firstName bottomAnchor] constant:10],
    [[lastName leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10],
    [[lastName trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10],
    [[lastName heightAnchor] constraintEqualToConstant:40],
    [[email topAnchor] constraintEqualToAnchor:[lastName bottomAnchor] constant:10],
    [[email leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10],
    [[email trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10],
    [[email heightAnchor] constraintEqualToConstant:40],
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
