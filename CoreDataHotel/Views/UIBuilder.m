//
//  UIBuilder.m
//  CoreDataHotel
//
//  Created by Jake Romer on 4/27/17.
//  Copyright © 2017 Jake Romer. All rights reserved.
//

#import "UIBuilder.h"

@implementation UIBuilder
+ (UITableView *)buildTableView {
  UITableView *tableView;
  tableView = [[UITableView alloc] init];
  tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
  [tableView registerClass:[UITableViewCell class]
      forCellReuseIdentifier:@"cell"];
  [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  return tableView;
}

+ (UIButton *)buildButtonWithTitle:(NSString *)title {
  UIButton *button;
  button = [[UIButton alloc] init];
  button.translatesAutoresizingMaskIntoConstraints = NO;
  [button setTitle:title forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button setTranslatesAutoresizingMaskIntoConstraints:NO];
  [button setBackgroundColor:[UIColor whiteColor]];
  return button;
}

+ (UITextField *)buildTextField {
  UITextField *textField;
  textField = [[UITextField alloc] init];
  textField.translatesAutoresizingMaskIntoConstraints = NO;
  textField.textColor = [UIColor blackColor];
  textField.font = [UIFont fontWithName:@"SFUIDisplay-Regular" size:25];
  textField.backgroundColor = [UIColor whiteColor];
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.text = @"";
  textField.autocorrectionType = UITextAutocorrectionTypeNo;
  textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
  textField.returnKeyType = UIReturnKeyDone;
  return textField;
}
@end
