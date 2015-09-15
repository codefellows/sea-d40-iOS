//
//  StackOverflowService.m
//  StackOverflow
//
//  Created by Bradley Johnson on 9/15/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "StackOverflowService.h"
#import <AFNetworking/AFNetworking.h>
#import "Errors.h"
#import "Question.h"
#import "QuestionJSONParser.h"

@implementation StackOverflowService

+ (void)questionsForSearchTerm:(NSString *)searchTerm completionHandler:(void(^)(NSArray *, NSError*))completionHandler {
  NSString *url = @"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=swift&site=stackoverflow";
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  
  [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//    NSLog(@"%ld",operation.response.statusCode);
//    NSLog(@"%@",responseObject);
    
    NSArray *questions = [QuestionJSONParser questionsResultsFromJSON:responseObject];

    completionHandler(questions,nil);
    
  } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    if (operation.response) {
      NSError *stackOverflowError = [self errorForStatusCode:operation.response.statusCode];
//      
//      [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        completionHandler(nil,stackOverflowError);
//      }]; SAME THING
      
      dispatch_async(dispatch_get_main_queue(), ^{
        completionHandler(nil,stackOverflowError);
      });
    } else {
      NSError *reachabilityError = [self checkReachability];
      if (reachabilityError) {
        completionHandler(nil, reachabilityError);
      }
    }
  }];
}

+(NSError *)checkReachability {
  if (![AFNetworkReachabilityManager sharedManager].reachable) {
    NSError *error = [NSError errorWithDomain:kStackOverFlowErrorDomain code:StackOverFlowConnectionDown userInfo:@{NSLocalizedDescriptionKey : @"Could not connect to servers, please try again when you have a connection"}];
    return error;
  }
  return nil;
}

+(NSError *)errorForStatusCode:(NSInteger)statusCode {
  
  NSInteger errorCode;
  NSString *localizedDescription;
  
  switch (statusCode) {
    case 502:
      localizedDescription = @"Too many requests, please slow down";
      errorCode = StackOverFlowTooManyAttempts;
      break;
    case 400:
      localizedDescription = @"Invalid search term, try another search";
      errorCode = StackOverFlowInvalidParameter;
      break;
    case 401:
      localizedDescription = @"You must sign in to access this feature";
      errorCode = StackOverFlowNeedAuthentication;
      break;
    default:
      localizedDescription = @"Could not complete operation, please try again later";
      errorCode = StackOverFlowGeneralError;
      break;
  }
  NSError *error = [NSError errorWithDomain:kStackOverFlowErrorDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey : localizedDescription}];
  return error;
}



@end
