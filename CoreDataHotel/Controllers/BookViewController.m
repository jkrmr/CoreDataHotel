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

  UITextField *firstName = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 200, 40)];
  firstName.textColor = [UIColor blackColor];
  firstName.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  firstName.backgroundColor = [UIColor whiteColor];
  firstName.borderStyle = UITextBorderStyleRoundedRect;
  firstName.text = @"";
  firstName.placeholder = @"First name";

  UITextField *lastName = [[UITextField alloc] initWithFrame:CGRectMake(45, firstName.frame.origin.y+75, 200, 40)];
  lastName.textColor = [UIColor blackColor];
  lastName.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  lastName.backgroundColor = [UIColor whiteColor];
  lastName.borderStyle = UITextBorderStyleRoundedRect;
  lastName.text = @"";
  lastName.placeholder = @"Last name";
  
  UITextField *email = [[UITextField alloc] initWithFrame:CGRectMake(45, lastName.frame.origin.y+75, 200, 40)];
  email.textColor = [UIColor blackColor];
  email.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  email.backgroundColor = [UIColor whiteColor];
  email.borderStyle = UITextBorderStyleRoundedRect;
  email.text = @"";
  email.placeholder = @"Email address";

  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 400, 400)];
  [view addSubview:firstName];
  [view addSubview:lastName];
  [view addSubview:email];

  [self.view addSubview:view];
}
@end
