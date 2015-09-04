//
//  DetailViewController.m
//  LocationReminders
//
//  Created by Bradley Johnson on 9/2/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import "DetailViewController.h"
#import "Constants.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
- (IBAction)buttonPressed:(id)sender {
  
//  [[NSNotificationCenter defaultCenter] postNotificationName:kReminderNotification object:self];
  
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  
  notification.alertTitle = @"Hello";
  notification.alertBody = @"Blah blah blah";
  
  NSDate *now = [NSDate date];
  NSDate *fireDate = [NSDate dateWithTimeInterval:15.0 sinceDate:now];
  notification.fireDate = fireDate;
  
  [[UIApplication sharedApplication] scheduleLocalNotification:notification];
  
  
  
  NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Data" forKey:@"Hello"];
  
  [[NSNotificationCenter defaultCenter] postNotificationName:kReminderNotification object:self userInfo:userInfo];
  
  
  
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
