//
//  Guest.h
//  HotelManager
//
//  Created by Bradley Johnson on 9/8/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reservation;

@interface Guest : NSManagedObject

@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) Reservation *reservation;

@end
