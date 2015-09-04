//
//  ComplicationController.m
//  LocationRemindersWatch Extension
//
//  Created by Bradley Johnson on 9/4/15.
//  Copyright © 2015 CF. All rights reserved.
//

#import "ComplicationController.h"

@interface ComplicationController ()

@end

@implementation ComplicationController

#pragma mark - Timeline Configuration

- (void)getSupportedTimeTravelDirectionsForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTimeTravelDirections directions))handler {
    handler(CLKComplicationTimeTravelDirectionForward|CLKComplicationTimeTravelDirectionBackward);
}

- (void)getTimelineStartDateForComplication:(CLKComplication *)complication withHandler:(void(^)(__nullable NSDate *date))handler {
    handler(nil);
}

- (void)getTimelineEndDateForComplication:(CLKComplication *)complication withHandler:(void(^)(__nullable NSDate *date))handler {
    handler(nil);
}

- (void)getPrivacyBehaviorForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationPrivacyBehavior privacyBehavior))handler {
    handler(CLKComplicationPrivacyBehaviorShowOnLockScreen);
}

#pragma mark - Timeline Population

- (void)getCurrentTimelineEntryForComplication:(CLKComplication *)complication withHandler:(void(^)(__nullable CLKComplicationTimelineEntry *))handler {
    // Call the handler with the current timeline entry
    handler(nil);
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication beforeDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(__nullable NSArray<CLKComplicationTimelineEntry *> *entries))handler {
    // Call the handler with the timeline entries prior to the given date
    handler(nil);
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication afterDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(__nullable NSArray<CLKComplicationTimelineEntry *> *entries))handler {
    // Call the handler with the timeline entries after to the given date
    handler(nil);
}

#pragma mark Update Scheduling

- (void)getNextRequestedUpdateDateWithHandler:(void(^)(__nullable NSDate *updateDate))handler {
    // Call the handler with the date when you would next like to be given the opportunity to update your complication content
    handler(nil);
}

#pragma mark - Placeholder Templates

- (void)getPlaceholderTemplateForComplication:(CLKComplication *)complication withHandler:(void(^)(__nullable CLKComplicationTemplate *complicationTemplate))handler {
    // This method will be called once per supported complication, and the results will be cached
    handler(nil);
}

@end
