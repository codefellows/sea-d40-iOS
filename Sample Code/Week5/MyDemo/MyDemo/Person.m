//
//  Person.m
//  MyDemo
//
//  Created by Bradley Johnson on 8/31/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import "Person.h"
#import "Car.h"

@interface Person()

@property (strong, nonatomic) NSNumber *SSN;
@property (strong, nonatomic) NSNumber *age;

@end

@implementation Person



- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age SSN:(NSNumber *)SSN {
  if (self = [super init]) {
    _name = name;
    _age = age;
    _SSN = SSN;
    //_friends = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)changeSSN {
  self.SSN = @123456; //using property + dot syntax
  [self setSSN:@123456]; //using the setter
  _SSN = @234245; //using ivar directly
  
}

- (void)changeName:(NSString *)newName andChangeSSN:(NSNumber *)newSSN andChangeAge:(NSNumber *)newAge {
  self.name = newName;
  self.SSN = newSSN;
  self.age = newAge;
}

- (void)setAge:(NSNumber *)age {
  _age = age;
}

-(NSMutableArray *)friends {
  if (!_friends) {
    _friends = [[NSMutableArray alloc] init];
  }
  return _friends;
}

@end
