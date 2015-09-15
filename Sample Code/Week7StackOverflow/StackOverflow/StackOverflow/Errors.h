//
//  Errors.h
//  StackOverflow
//
//  Created by Bradley Johnson on 9/14/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kStackOverFlowErrorDomain;

typedef enum : NSUInteger {
  StackOverFlowBadJSON = 200,
  StackOverFlowConnectionDown,
  StackOverFlowTooManyAttempts,
  StackOverFlowInvalidParameter,
  StackOverFlowNeedAuthentication,
  StackOverFlowGeneralError
} StackOverFlowErrorCodes;

