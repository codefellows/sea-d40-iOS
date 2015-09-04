//
//  InterfaceController.m
//  LocationRemindersWatch Extension
//
//  Created by Bradley Johnson on 9/4/15.
//  Copyright © 2015 CF. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchKit/WatchKit.h>
#import "MyTableRowController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface InterfaceController() <WCSessionDelegate>

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *watchTable;
@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) WCSession *session;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];


  
  self.dataArray = [[NSArray alloc] initWithObjects:@"String1", @"String2", @"String3", nil];
  
  NSArray *rowTypes = [NSArray arrayWithObject:@"MyTableRowController"];
  
  [self.watchTable setRowTypes:rowTypes];
  [self.watchTable setNumberOfRows:self.dataArray.count withRowType:@"MyTableRowController"];
  
  for (int i=0; i<self.dataArray.count; i++) {
    MyTableRowController *currentRow = [self.watchTable rowControllerAtIndex:i];
    [currentRow.label setText:self.dataArray[i]];
  }
  
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



