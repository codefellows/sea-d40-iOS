//
//  DateValidatorTests.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/9/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DateValidator.h"

@interface DateValidatorTests : XCTestCase

@property (strong,nonatomic) NSDate *now;
@property (strong,nonatomic) NSDate *tomorrow;

@end

@implementation DateValidatorTests

- (void)setUp {
    [super setUp];
  
  self.now = [NSDate date];
  self.tomorrow = [NSDate dateWithTimeInterval:(60 * 60 * 24) sinceDate:self.now];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
  
  self.now = nil;
  self.tomorrow = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testDateValidatorExists {
  DateValidator *dateValidator = [[DateValidator alloc] init];
  XCTAssertNotNil(dateValidator);
}

- (void)testValidStartAndEndDates {
  
  BOOL result = [DateValidator validRangeStartDate:self.now endDate:self.tomorrow];
  XCTAssertTrue(result);
}

-(void)testInvalidStartAndEndDates {
  
  BOOL result = [DateValidator validRangeStartDate:self.tomorrow endDate:self.now];
  XCTAssertFalse(result);
}

@end
