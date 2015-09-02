//
//  Reminder.h
//  LocationReminders
//
//  Created by Bradley Johnson on 9/2/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import <Parse/Parse.h>

@interface Reminder : PFObject <PFSubclassing>

@property (strong,nonatomic) NSString *name;

@end
