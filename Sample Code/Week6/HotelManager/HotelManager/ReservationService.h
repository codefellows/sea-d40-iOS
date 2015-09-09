//
//  ReservationService.h
//  HotelManager
//
//  Created by Bradley Johnson on 9/9/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ReservationService : NSObject

+ (NSArray *)availableRoomsForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

@end
