//
//  AppDelegate.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/7/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Hotel.h"
#import "Room.h"
#import "HotelListViewController.h"
#import "DatePickerViewController.h"
#import "BookReservationViewController.h"
#import "CoreDataStack.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  self.coreDataStack = [[CoreDataStack alloc] init];
  
  NSCalendar *calendar = [NSCalendar currentCalendar];
  
  NSDate *now = [NSDate date];
  NSLog(@"%@",now);
  
  NSDate *later = [NSDate dateWithTimeIntervalSinceNow:30];
  NSLog(@"later: %@",later);
  
  NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:now];
  
  NSLog(@"year is: %ld",(long)components.year);
  
  NSDateComponents *newComponents = [[NSDateComponents alloc] init];
  newComponents.year = 1990;
  newComponents.day = 25;
  newComponents.month = 12;
  
  NSDate *xmasIn1990 = [calendar dateFromComponents:newComponents];
  
  NSLog(@"%@",xmasIn1990);
  
//  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
//  
//  
//  NSError *fetchError;
//  NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
//  
//  NSLog(@"%lu",(unsigned long)results.count);

  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self.window makeKeyAndVisible];
  
  HotelListViewController *hotelListViewController = [[HotelListViewController alloc] init];
  DatePickerViewController *datePickerController = [[DatePickerViewController alloc] init];
  BookReservationViewController *bookReservationController = [[BookReservationViewController alloc] init];
  

  self.window.rootViewController = bookReservationController;
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  // Saves changes in the application's managed object context before the application terminates.
}

@end
