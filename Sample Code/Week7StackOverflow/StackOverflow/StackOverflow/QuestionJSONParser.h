//
//  QuestionJSONParser.h
//  StackOverflow
//
//  Created by Bradley Johnson on 9/15/15.
//  Copyright © 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionJSONParser : NSObject
+(NSArray *)questionsResultsFromJSON:(NSDictionary *)jsonInfo;
@end
