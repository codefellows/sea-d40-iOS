//
//  BookReservationViewController.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/8/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "BookReservationViewController.h"
#import "Reservation.h"
#import "AppDelegate.h"
#import "Room.h"
#import "CoreDataStack.h"

@interface BookReservationViewController ()

@end

@implementation BookReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //[self bookTestReservation];
  
  NSDate *startDate = [NSDate date];
  NSDate *endDate = [NSDate dateWithTimeInterval:86400 * 2 sinceDate:[NSDate date]];
  
  
  [self fetchAvailableRoomsForFromDate:startDate toDate:endDate];
    // Do any additional setup after loading the view.
}

-(NSArray *)fetchAvailableRoomsForFromDate:(NSDate*)fromDate toDate:(NSDate *)toDate {
  
   AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate >= %@",toDate,fromDate];
  request.predicate = predicate;
  NSError *fetchError;
  NSArray *results = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:request error:&fetchError];
  
  NSMutableArray *badRooms = [[NSMutableArray alloc] init];
  for (Reservation *reservation in results) {
    [badRooms addObject:reservation.room];
  }
  
  NSFetchRequest *finalRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  NSPredicate *finalPredicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", badRooms];
  finalRequest.predicate = finalPredicate;
  
  NSError *finalError;
  
  NSArray *finalResults = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:finalRequest error:&finalError];
  
  if (finalError) {
    return nil;
  }
  return finalResults;
  
}

-(void)bookTestReservation {
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;

  Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:appDelegate.coreDataStack.managedObjectContext];
  
  reservation.startDate = [NSDate date];
  reservation.endDate = [NSDate dateWithTimeInterval:86400 * 2 sinceDate:[NSDate date]];
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  fetchRequest.predicate = [NSPredicate predicateWithFormat:@"number == 2"];
  NSError *fetchError;
  NSArray *results = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
  if (results.count > 0) {
    Room *room = results.firstObject;
    reservation.room = room;
    NSError *saveError;
    if (![appDelegate.coreDataStack.managedObjectContext save:&saveError]) {
      NSLog(@"%@",saveError.localizedDescription);
    }
    
  }
  
  
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
