//
//  StackOverflowService.h
//  StackOverflow
//
//  Created by Bradley Johnson on 9/15/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackOverflowService : NSObject
+ (void)questionsForSearchTerm:(NSString *)searchTerm completionHandler:(void(^)(NSArray *, NSError*))completionHandler;

@end
