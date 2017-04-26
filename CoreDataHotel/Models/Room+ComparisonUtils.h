//
//  Room+Room_Comparison.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "Room+CoreDataClass.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

@interface Room (ComparisonUtils)
- (NSComparisonResult) compare:(Room*)otherRoom;
@end
