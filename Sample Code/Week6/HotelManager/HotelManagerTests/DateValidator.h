//
//  DateValidator.h
//  HotelManager
//
//  Created by Bradley Johnson on 9/9/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateValidator : NSObject

+ (BOOL)validRangeStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;


@end
