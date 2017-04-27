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
  [self.view addSubview:firstName];
  NSLayoutConstraint *fnB = [[firstName topAnchor]
      constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]
                     constant:10];
  NSLayoutConstraint *fnL = [[firstName leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]
                     constant:10];
  NSLayoutConstraint *fnT = [[firstName trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]
                     constant:-10];
  NSLayoutConstraint *fnH =
      [[firstName heightAnchor] constraintEqualToConstant:40];

  // set up last name text field
  UITextField *lastName = [[UITextField alloc] init];
  lastName.translatesAutoresizingMaskIntoConstraints = NO;
  lastName.textColor = [UIColor blackColor];
  lastName.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  lastName.backgroundColor = [UIColor whiteColor];
  lastName.borderStyle = UITextBorderStyleRoundedRect;
  lastName.text = @"";
  lastName.placeholder = @"Last name";
  [self.view addSubview:lastName];
  NSLayoutConstraint *lnT =
      [[lastName topAnchor] constraintEqualToAnchor:[firstName bottomAnchor]
                                           constant:10];
  NSLayoutConstraint *lnL = [[lastName leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]
                     constant:10];
  NSLayoutConstraint *lnR = [[lastName trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]
                     constant:-10];
  NSLayoutConstraint *lnH =
      [[lastName heightAnchor] constraintEqualToConstant:40];

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
  NSLayoutConstraint *emT =
      [[email topAnchor] constraintEqualToAnchor:[lastName bottomAnchor]
                                        constant:10];
  NSLayoutConstraint *emL =
      [[email leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]
                                            constant:10];
  NSLayoutConstraint *emR =
      [[email trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]
                                             constant:-10];
  NSLayoutConstraint *emH = [[email heightAnchor] constraintEqualToConstant:40];

  UIButton *confirmButton = [[UIButton alloc] init];
  confirmButton.translatesAutoresizingMaskIntoConstraints = NO;
  [confirmButton setTitle:@"Confirm" forState:UIControlStateNormal];
  [confirmButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [confirmButton setTitleColor:[UIColor whiteColor]
                      forState:UIControlStateNormal];
  [confirmButton setBackgroundColor:[UIColor colorWithRed:0.2
                                                    green:0.56
                                                     blue:0.2
                                                    alpha:1.0]];
  [confirmButton addTarget:self
                    action:@selector(confirmButtonWasPressed)
          forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:confirmButton];
  NSLayoutConstraint *cbL = [[confirmButton leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *cbR = [[confirmButton trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  NSLayoutConstraint *cbB = [[confirmButton bottomAnchor]
      constraintEqualToAnchor:[self.bottomLayoutGuide topAnchor]];
  NSLayoutConstraint *cbH =
      [[confirmButton heightAnchor] constraintEqualToConstant:100];

  UIButton *cancelButton = [[UIButton alloc] init];
  cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
  [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
  [cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [cancelButton setTitleColor:[UIColor whiteColor]
                     forState:UIControlStateNormal];
  [cancelButton setBackgroundColor:[UIColor redColor]];
  [cancelButton addTarget:self
                   action:@selector(cancelButtonWasPressed)
         forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:cancelButton];
  NSLayoutConstraint *caL = [[cancelButton leadingAnchor]
      constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *caR = [[cancelButton trailingAnchor]
      constraintEqualToAnchor:[self.view trailingAnchor]];
  NSLayoutConstraint *caB = [[cancelButton bottomAnchor]
      constraintEqualToAnchor:[confirmButton topAnchor]];
  NSLayoutConstraint *caH =
      [[cancelButton heightAnchor] constraintEqualToConstant:100];

  // activate constraints
  [NSLayoutConstraint activateConstraints:@[
    fnB, fnL, fnT, fnH, lnT, lnL, lnR, lnH, emT, emL,
    emR, emH, cbL, cbR, cbB, cbH, caL, caR, caB, caH
  ]];

  self.firstName = firstName;
  self.lastName = lastName;
  self.emailAddress = email;
}

- (void)cancelButtonWasPressed {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmButtonWasPressed {
  AppDelegate *appDelegate =
      (AppDelegate *)[[UIApplication sharedApplication] delegate];
  NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;

  Guest *newGuest = [[Guest alloc] initWithContext:context];
  newGuest.firstName = self.firstName.text;
  newGuest.lastName = self.lastName.text;
  newGuest.emailAddress = self.emailAddress.text;

  Reservation *newReservation = [[Reservation alloc] initWithContext:context];
  newReservation.startDate = self.requestedStartDate;
  newReservation.endDate = self.requestedEndDate;
  newReservation.room = self.requestedRoom;
  [newReservation setGuests:[NSSet setWithArray:@[newGuest]]];
  
  [appDelegate saveContext];

  [self dismissViewControllerAnimated:YES completion:nil];
}
@end
