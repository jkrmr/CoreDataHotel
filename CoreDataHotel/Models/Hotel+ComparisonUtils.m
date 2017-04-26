//
//  Hotel+ComparisonUtils.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Hotel+ComparisonUtils.h"

@implementation Hotel (ComparisonUtils)
- (NSComparisonResult) compare:(Hotel*)otherHotel {
  return [self.name compare:otherHotel.name];
}
@end

