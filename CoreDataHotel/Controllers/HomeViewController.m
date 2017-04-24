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
  UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
  [self.view addSubview:browseButton];
  browseButton.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.75 alpha:1];
  [AutoLayout leadingConstraintFromView:browseButton toView:self.view];
  [AutoLayout trailingConstraintFromView:browseButton toView:self.view];
  [AutoLayout equalHeightConstraintFromView:browseButton toView:self.view withMultiplier:0.33];
  
  [browseButton addTarget:self
                   action:@selector(browseButtonWasPressed)
         forControlEvents:UIControlEventTouchUpInside];

//  UIButton *bookButton = [self createButtonWithTitle:@"Book"];
//  [AutoLayout leadingConstraintFromView:bookButton toView:self.view];
//  [AutoLayout trailingConstraintFromView:bookButton toView:self.view];
//
//  UIButton *lookupButton = [self createButtonWithTitle:@"Look up"];
//  [AutoLayout leadingConstraintFromView:lookupButton toView:self.view];
//  [AutoLayout trailingConstraintFromView:lookupButton toView:self.view];
}

- (void) browseButtonWasPressed {
  HotelViewController *hotelVC = [[HotelViewController alloc] init];
  [[self navigationController] pushViewController:hotelVC animated:YES];
}

- (UIButton*) createButtonWithTitle:(NSString*)title {
  UIButton *button = [[UIButton alloc] init];
  [button setTitle:title forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button setTranslatesAutoresizingMaskIntoConstraints:NO];
  return button;
}
@end
