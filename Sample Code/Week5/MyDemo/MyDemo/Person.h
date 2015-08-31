//
//  Person.h
//  MyDemo
//
//  Created by Bradley Johnson on 8/31/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;

@interface Person : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) Car *myCar;
@property (strong, nonatomic) NSMutableArray *friends;


- (void)changeSSN;
- (void)changeName:(NSString *)newName andChangeSSN:(NSNumber *)newSSN andChangeAge:(NSNumber *)newAge;
- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age SSN:(NSNumber *)SSN;


@end
