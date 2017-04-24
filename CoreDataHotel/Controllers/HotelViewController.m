//
//  HotelViewController.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "HotelViewController.h"

@interface HotelViewController ()
@end

@implementation HotelViewController
- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  self.view.backgroundColor = [UIColor whiteColor];
  [self setupLayout];
}

- (void) setupLayout {
  UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
  [AutoLayout leadingConstraintFromView:browseButton toView:self.view];
  [AutoLayout trailingConstraintFromView:browseButton toView:self.view];

  browseButton.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.75 alpha:1];
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
  NSLog(@"selected");
}

- (UIButton*) createButtonWithTitle:(NSString*)title {
  UIButton *button = [[UIButton alloc] init];
  [button setTitle:title forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.view addSubview:button];
  return button;
}
@end
