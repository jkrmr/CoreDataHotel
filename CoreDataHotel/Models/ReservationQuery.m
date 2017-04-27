//
//  ReservationQuery.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/26/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "ReservationQuery.h"

@implementation ReservationQuery
+ (NSFetchRequest *)allReservations {
  NSFetchRequest *request =
      [[NSFetchRequest alloc] initWithEntityName:@"Reservation"];
  NSPredicate *allPredicate = [NSPredicate predicateWithValue:YES];
  request.predicate = allPredicate;
  return request;
}
@end
