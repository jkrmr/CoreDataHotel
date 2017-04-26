//
//  RoomQuery.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface RoomQuery : NSObject
+ (NSFetchRequest *)availableOnDaysFrom:(NSDate *)fromDate to:(NSDate *)toDate;
@end
