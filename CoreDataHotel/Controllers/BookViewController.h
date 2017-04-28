//
//  BookViewController.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/25/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "BookingService.h"
#import <UIKit/UIKit.h>
@class Room;

@interface BookViewController : UIViewController <UITextFieldDelegate>
@property(strong, nonatomic) Room *requestedRoom;
@property(strong, nonatomic) NSDate *requestedStartDate;
@property(strong, nonatomic) NSDate *requestedEndDate;
@end
