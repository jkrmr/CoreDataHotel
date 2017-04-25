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
  [[[browseButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[browseButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[browseButton topAnchor] constraintEqualToAnchor:[self.view topAnchor]] setActive:YES];
  [[[browseButton heightAnchor] constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.3] setActive:YES];

  UIButton *bookButton = [self createButtonWithTitle:@"Book"
                                            andColor:[UIColor whiteColor]
                                              action:@selector(bookButtonWasPressed)];
  [[[bookButton leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[bookButton trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[bookButton bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]] setActive:YES];
  [[[bookButton heightAnchor] constraintEqualToAnchor:[self.view heightAnchor] multiplier:0.3] setActive:YES];
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
