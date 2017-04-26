//
//  Hotel+ComparisonUtils.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Hotel+CoreDataClass.h"

@interface Hotel (ComparisonUtils)
- (NSComparisonResult) compare:(Hotel*)otherHotel;
@end
