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
  NSFetchRequest *request;
  NSPredicate *allPredicate;
  
  request = [[NSFetchRequest alloc] initWithEntityName:@"Reservation"];
  allPredicate = [NSPredicate predicateWithValue:YES];
  request.predicate = allPredicate;
  
  return request;
}

+ (NSFetchRequest *)reservationsWithGuestDetail:(NSString*)string {
  NSFetchRequest *request;
  NSPredicate *anyGuestNamePredicate;
  NSString *queryString;
  
  request = [[NSFetchRequest alloc] initWithEntityName:@"Reservation"];
  
  queryString = @"SUBQUERY(guests, $g, "
                @"$g.firstName CONTAINS[cd] %@ OR "
                @"$g.lastName CONTAINS[cd] %@ OR "
                @"$g.emailAddress CONTAINS[cd] %@).@count > 0";
  anyGuestNamePredicate = [NSPredicate predicateWithFormat:queryString, string, string, string];
  request.predicate = anyGuestNamePredicate;

  return request;
}
@end
