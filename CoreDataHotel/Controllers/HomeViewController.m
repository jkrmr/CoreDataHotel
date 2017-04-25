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
  self.view.backgroundColor = [UIColor whiteColor];
  [self setupLayout];
}

- (void) setupLayout {
  UIButton *browseButton = [self createButtonWithTitle:@"Browse"
                                              andColor:[UIColor whiteColor]
                                                action:@selector(browseButtonWasPressed)];

  UIButton *bookButton = [self createButtonWithTitle:@"Book"
                                            andColor:[UIColor whiteColor]
                                              action:@selector(bookButtonWasPressed)];
}

- (void) browseButtonWasPressed {
  HotelsViewController *hotelsVC = [[HotelsViewController alloc] init];
  [[self navigationController] pushViewController:hotelsVC animated:YES];
}

- (void) bookButtonWasPressed {
  DatePickerViewController *datePickerVC = [[DatePickerViewController alloc] init];
  [[self navigationController] pushViewController:datePickerVC animated:YES];
}

- (UIButton*) createButtonWithTitle:(NSString*)title andColor:(UIColor*)color action:(SEL)selector{
  UIButton *button = [[UIButton alloc] init];
  [button setTitle:title forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button setTranslatesAutoresizingMaskIntoConstraints:NO];
  button.backgroundColor = color;
  [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
  return button;
}
@end
