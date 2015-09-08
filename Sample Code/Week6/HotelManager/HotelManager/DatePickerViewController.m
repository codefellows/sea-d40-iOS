//
//  DatePickerViewController.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/8/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (strong,nonatomic) UIDatePicker *datePicker;
@property (strong,nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation DatePickerViewController


-(void)loadView {
  
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UIDatePicker *datePicker = [[UIDatePicker alloc] init];
  self.datePicker = datePicker;
  
  [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
  
  
  [rootView addSubview:datePicker];
  
  UIButton *nextButton = [[UIButton alloc] init];
  [nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [nextButton setTitle:@"Next" forState:UIControlStateNormal];
  [nextButton setTranslatesAutoresizingMaskIntoConstraints:false];
  
  [rootView addSubview:nextButton];
  
  NSLayoutConstraint *nextButtonCenterX = [NSLayoutConstraint constraintWithItem:nextButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  nextButtonCenterX.active = true;
  NSLayoutConstraint *nextButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:nextButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8];
  nextButtonBottomConstraint.active = true;
  
  self.view = rootView;
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
  self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.dateFormatter = [[NSDateFormatter alloc] init];
    // Do any additional setup after loading the view.
}

-(void)nextButtonPressed:(UIButton *)sender {
  
}

-(void)datePickerValueChanged:(UIDatePicker *)sender {

  //dateFormatter.dateStyle = NSDateFormatterShortStyle;
  [self.dateFormatter setDateFormat:@"MMMM EEE yy"];
  NSString *dateString = [self.dateFormatter stringFromDate:sender.date];
  NSLog(@"%@",dateString);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
