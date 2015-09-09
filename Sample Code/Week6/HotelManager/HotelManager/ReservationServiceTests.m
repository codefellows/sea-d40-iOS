//
//  ReservationServiceTests.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/9/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ReservationService.h"

@interface ReservationServiceTests : XCTestCase

@end

@implementation ReservationServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testAvailableRoomsForNilDates {
  NSArray *results = [ReservationService availableRoomsForStartDate:nil endDate:nil];
  XCTAssertNotNil(results);
  XCTAssertEqual(0, results.count,@"Results should be equal to zero");
}

@end
