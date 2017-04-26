//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "BookViewController.h"

@interface BookViewController ()
@property (strong, nonatomic) UITextField *firstName;
@property (strong, nonatomic) UITextField *lastName;
@property (strong, nonatomic) UITextField *emailAddress;
@end

@implementation BookViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // set up first name text field
  UITextField *firstName = [[UITextField alloc] init];
  firstName.translatesAutoresizingMaskIntoConstraints = NO;
  firstName.textColor = [UIColor blackColor];
  firstName.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  firstName.backgroundColor = [UIColor whiteColor];
  firstName.borderStyle = UITextBorderStyleRoundedRect;
  firstName.text = @"";
  firstName.placeholder = @"First name";
  [self.view addSubview:firstName];
  [[[firstName topAnchor] constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor] constant:10] setActive:YES];
  [[[firstName leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10] setActive:YES];
  [[[firstName trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10] setActive:YES];
  [[[firstName heightAnchor] constraintEqualToConstant:40] setActive:YES];

  // set up last name text field
  UITextField *lastName = [[UITextField alloc] init];
  lastName. translatesAutoresizingMaskIntoConstraints = NO;
  lastName.textColor = [UIColor blackColor];
  lastName.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  lastName.backgroundColor = [UIColor whiteColor];
  lastName.borderStyle = UITextBorderStyleRoundedRect;
  lastName.text = @"";
  lastName.placeholder = @"Last name";
  [self.view addSubview:lastName];
  [[[lastName topAnchor] constraintEqualToAnchor:[firstName bottomAnchor] constant:10] setActive:YES];
  [[[lastName leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10] setActive:YES];
  [[[lastName trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10] setActive:YES];
  [[[lastName heightAnchor] constraintEqualToConstant:40] setActive:YES];

  // set up email text field
  UITextField *email = [[UITextField alloc] init];
  email.translatesAutoresizingMaskIntoConstraints = NO;
  email.textColor = [UIColor blackColor];
  email.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  email.backgroundColor = [UIColor whiteColor];
  email.borderStyle = UITextBorderStyleRoundedRect;
  email.text = @"";
  email.placeholder = @"Email address";
  [self.view addSubview:email];
  [[[email topAnchor] constraintEqualToAnchor:[lastName bottomAnchor] constant:10] setActive:YES];
  [[[email leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor] constant:10] setActive:YES];
  [[[email trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor] constant:-10] setActive:YES];
  [[[email heightAnchor] constraintEqualToConstant:40] setActive:YES];

  UIButton *confirmButton = [[UIButton alloc] init];
  confirmButton.translatesAutoresizingMaskIntoConstraints = NO;
  [confirmButton setTitle:@"Confirm" forState:UIControlStateNormal];
  [confirmButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [confirmButton setBackgroundColor:[UIColor colorWithRed:0.2 green:0.56 blue:0.2 alpha:1.0]];
  [confirmButton addTarget:self action:@selector(confirmButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:confirmButton];
  [[[confirmButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[confirmButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[confirmButton bottomAnchor] constraintEqualToAnchor:[self.bottomLayoutGuide topAnchor]] setActive:YES];
  [[[confirmButton heightAnchor] constraintEqualToConstant:100] setActive:YES];

  UIButton *cancelButton = [[UIButton alloc] init];
  cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
  [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
  [cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [cancelButton setBackgroundColor:[UIColor redColor]];
  [cancelButton addTarget:self action:@selector(cancelButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:cancelButton];
  [[[cancelButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[cancelButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[cancelButton bottomAnchor] constraintEqualToAnchor:[confirmButton topAnchor]] setActive:YES];
  [[[cancelButton heightAnchor] constraintEqualToConstant:100] setActive:YES];
}

- (void) confirmButtonWasPressed {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) cancelButtonWasPressed {
  [self dismissViewControllerAnimated:YES completion:nil];
}
@end
