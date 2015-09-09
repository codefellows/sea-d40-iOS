//
//  DateValidator.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/9/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "DateValidator.h"

@implementation DateValidator

+ (BOOL)validRangeStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
  return  [startDate compare:endDate] == NSOrderedAscending ? true : false;
}

@end
