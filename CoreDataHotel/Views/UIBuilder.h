//
//  TableViewFactory.h
//  CoreDataHotel
//
//  Created by Jake Romer on 4/27/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBuilder : NSObject
+ (UITableView*) buildTableView;
+ (UIButton*) buildButtonWithTitle:(NSString*)title;
+ (UITextField*) buildTextField;
@end
