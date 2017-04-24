//
//  AutoLayout.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/24/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

@import UIKit;

@interface AutoLayout : NSObject
+ (NSLayoutConstraint*) genericConstraintFromView:(UIView*)view
                                           toView:(UIView*)superView
                                    withAttribute:(NSLayoutAttribute)attribute
                                    andMultiplier:(CGFloat)multiplier;

+ (NSLayoutConstraint*) genericConstraintFromView:(UIView*)view
                                           toView:(UIView*)superView
                                    withAttribute:(NSLayoutAttribute)attribute;

+ (NSArray *) fullScreenConstraintWithVFLFForView:(UIView*)view;

+ (NSLayoutConstraint*) equalHeightConstraintFromView:(UIView*)view
                                               toView:(UIView*)otherView
                                       withMultiplier:(CGFloat)multiplier;

+ (NSLayoutConstraint*) leadingConstraintFromView:(UIView*)view
                                           toView:(UIView*)otherView;

+ (NSLayoutConstraint*) trailingConstraintFromView:(UIView*)view
                                            toView:(UIView*)otherView;
@end
