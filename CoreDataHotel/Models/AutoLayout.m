//
//  AutoLayout.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "AutoLayout.h"

@implementation AutoLayout

+ (NSLayoutConstraint*) genericConstraintFromView:(UIView*)view
                                           toView:(UIView*)superView
                                    withAttribute:(NSLayoutAttribute)attribute
                                    andMultiplier:(CGFloat)multiplier {
  NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem: view
                                                                attribute: attribute
                                                                relatedBy: NSLayoutRelationEqual
                                                                   toItem: superView
                                                                attribute: attribute
                                                               multiplier: multiplier
                                                                 constant: 0.0];
  constraint.active = YES;
  return constraint;
}

+ (NSLayoutConstraint*) genericConstraintFromView:(UIView*)view
                                           toView:(UIView*)superView
                                    withAttribute:(NSLayoutAttribute)attribute {
  return [self genericConstraintFromView: view
                                  toView: superView
                           withAttribute: attribute
                           andMultiplier: 1.0];
}

+ (NSArray*) fullScreenConstraintWithVFLFForView:(UIView*)view {
  NSMutableArray *constraints = [[NSMutableArray alloc] init];
  NSDictionary *viewDictionary = @{@"view": view};

  NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[view]|"
                                                                  options: 0
                                                                  metrics: nil
                                                                    views: viewDictionary];

  NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[view]|"
                                                                  options: 0
                                                                  metrics: nil
                                                                    views: viewDictionary];
  [constraints addObjectsFromArray: hConstraints];
  [constraints addObjectsFromArray: vConstraints];
  [NSLayoutConstraint activateConstraints: constraints];
  return constraints.copy;
}

+ (NSLayoutConstraint*) equalHeightConstraintFromView:(UIView*)view
                                               toView:(UIView*)otherView
                                       withMultiplier:(CGFloat)multiplier {
  NSLayoutConstraint *hConstraint = [AutoLayout genericConstraintFromView: view
                                                                   toView: otherView
                                                            withAttribute: NSLayoutAttributeHeight
                                                            andMultiplier: multiplier];
  return hConstraint;
  
}

+ (NSLayoutConstraint*) leadingConstraintFromView:(UIView*)view
                                           toView:(UIView*)otherView {
  return [AutoLayout genericConstraintFromView: view
                                        toView: otherView
                                 withAttribute: NSLayoutAttributeLeading];
  
}

+ (NSLayoutConstraint*) trailingConstraintFromView:(UIView*)view
                                            toView:(UIView*)otherView {
  return [AutoLayout genericConstraintFromView: view
                                        toView: otherView
                                 withAttribute: NSLayoutAttributeTrailing];
}
@end
