//
//  RoomQuery.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface RoomQuery : NSObject
+ (NSFetchRequest*) availableOnDaysFrom:(NSDate*)fromDate to:(NSDate*)toDate;
@end
